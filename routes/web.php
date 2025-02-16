<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\CoursesController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\LessonController;
use Illuminate\Support\Facades\Route;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;

// Route::get('/', function () {
//     return view('user.welcome');
// });

// Route::get('/dashboard', [UserController::class,'userInfo'])->middleware(['auth', 'verified'])->name('dashboard');
// Route::post('/logout', function () {
//     Auth::logout();
//     return redirect('/');
// })->name('logout');
// Route::middleware('auth')->group(function () {
//     Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
//     Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
//     Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

//     Route::get('/chat', [ChatController::class, 'index'])->name('chat.index');
//     Route::get('/chat/messages/{id}', [ChatController::class, 'fetchMessages']);
//     Route::post('/chat/send', [ChatController::class, 'sendMessage']);
// });

// Route::middleware(['role:admin'])->group(function () {
//     Route::get('/index', [UserController::class,'admin_statistics'])->name('index');
//     Route::get('/users', function () {
//         return view('students');
//     })->name('users.index');
//     Route::get('/users/all',[UserController::class,'index']);
//     Route::get('/user/details/{id}',[UserController::class,'details'])->name('users.details');

//     Route::post('/create/user',[UserController::class,'create'])->name('users.create');
//     Route::put('/edit/user/{id}',[UserController::class,'edit'])->name('users.edit');
//     Route::delete('/delete/user/{id}',[UserController::class,'delete'])->name('users.delete');

//     Route::get('/courses', function () {
//         return view('courses');
//     })->name('courses.index');
//     Route::get('/courses/all',[CoursesController::class,'index']);
//     Route::get('/courses/all/{id}',[CoursesController::class,'getCourses'])->name('courses.get');

//     Route::get('/course/details/{id}',[CoursesController::class,'details'])->name('course.details');

//     Route::post('/create/course',[CoursesController::class,'create'])->name('course.create');
//     Route::put('/edit/course/{id}',[CoursesController::class,'edit'])->name('course.edit');
//     Route::delete('/delete/course/{id}',[CoursesController::class,'delete'])->name('course.delete');
//     Route::post('/course/set-mark/{userId}',[CoursesController::class,'setMark'])->name('course.setMark');


// });
// Route::put('/edit/user/{id}',[UserController::class,'edit'])->name('users.edit')->withoutMiddleware(VerifyCsrfToken::class);;

// Route::post('/create/course',[CoursesController::class,'create'])->name('course.create')->withoutMiddleware(VerifyCsrfToken::class);
// Route::post('/manage-courses/{id}', [CoursesController::class, 'manageCourses'])->name('assign.course')->withoutMiddleware(VerifyCsrfToken::class);






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

     });
});



});





require __DIR__.'/auth.php';
