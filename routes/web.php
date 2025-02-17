<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CoursesController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\LessonController;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Support\Facades\Auth;

// Public Routes
Route::get('/', function () {
    return view('user.welcome');
});

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [UserController::class, 'userInfo'])->name('dashboard');
    Route::post('/logout', function () {
        Auth::logout();
        return redirect('/');
    })->name('logout');

    Route::prefix('profile')->name('profile.')->group(function () {
        Route::get('/', [ProfileController::class, 'edit'])->name('edit');
        Route::patch('/', [ProfileController::class, 'update'])->name('update');
        Route::delete('/', [ProfileController::class, 'destroy'])->name('destroy');
    });


    Route::prefix('chat')->name('chat.')->group(function () {
        Route::get('/', [ChatController::class, 'index'])->name('index');
        Route::get('/messages/{id}', [ChatController::class, 'fetchMessages'])->name('messages');
        Route::post('/send', [ChatController::class, 'sendMessage'])->name('send');
    });
 Route::get('/course-lesson/{courseId}', [LessonController::class, 'show'])->name('CourseLessons');

});

Route::middleware(['auth', 'role:admin'])->group(function () {
    Route::prefix('admin')->name('admin.')->group(function () {
        // Dashboard
        Route::get('/index', [UserController::class, 'admin_statistics'])->name('index');

        Route::prefix('users')->name('users.')->group(function () {
            Route::get('/', function () {
                return view('admin.students');
            })->name('index');
            Route::get('/all', [UserController::class, 'index'])->name('all');
            Route::get('/details/{id}', [UserController::class, 'details'])->name('details');
            Route::post('/create', [UserController::class, 'create'])->name('create');
            Route::put('/edit/{id}', [UserController::class, 'edit'])->name('edit');
            Route::delete('/delete/{id}', [UserController::class, 'delete'])->name('delete');
        });

        // Course Management Routes
        Route::prefix('courses')->name('courses.')->group(function () {
            Route::get('/', function () {
                return view('admin.courses');
            })->name('index');
            Route::get('/all', [CoursesController::class, 'index'])->name('all');
            Route::get('/all/{id}', [CoursesController::class, 'getCourses'])->name('get');
            Route::get('/details/{id}', [CoursesController::class, 'details'])->name('details');
            Route::post('/create', [CoursesController::class, 'create'])->name('create');
            Route::put('/edit/{id}', [CoursesController::class, 'edit'])->name('edit');
            Route::delete('/delete/{id}', [CoursesController::class, 'delete'])->name('delete');
            Route::post('/set-mark/{userId}', [CoursesController::class, 'setMark'])->name('setMark');
            Route::get('/get-mark', [CoursesController::class, 'getMark'])->name('getMark');

            Route::post('/manage-courses/{id}', [CoursesController::class, 'manageCourses'])
            ->name('assign.course')->withoutMiddleware(VerifyCsrfToken::class);
            Route::get('/course-lesson/{courseId}', [LessonController::class, 'index'])->name('getCourseLessons');
            Route::get('/lessons-table/{courseId}', [LessonController::class, 'showToAdmin'])->name('AdminLessonsTable');

            Route::post('/add-lesson/{courseId}', [LessonController::class, 'store'])->name('lesson-store');
            Route::delete('/delete-lesson/{lessonId}', [LessonController::class,'delete'])->name('lesson-delete');
            Route::post('/update-lesson/{lessonId}', [LessonController::class,'update'])->name('lesson-update');
     });
});



});





require __DIR__.'/auth.php';
