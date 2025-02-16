<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use App\Models\User;
use App\Models\Course;
use Yajra\DataTables\DataTables;
use App\ApiResponse;


class UserController extends Controller
{
    use ApiResponse;
    public function index()
    {
        $users = User::where('role','student')->get();
        return DataTables::of($users)
            ->addColumn('action', function ($user) {
                return '
        <button class="btn btn-primary assign-courses-btn w-25 d-inline-flex justify-content-center align-items-center" data-id="' . $user->id . '">
        <i class="fa-solid fa-book"></i>
        </button>
        <button class="btn btn-warning btn-edit w-25 d-inline-flex justify-content-center align-items-center" data-id="' . $user->id . '">
            <i class="fa-solid fa-pen"></i>
        </button>
        <button class="btn btn-danger btn-delete w-25 d-inline-flex justify-content-center align-items-center" onclick="deleteUser(' . $user->id . ')">
            <i class="fa-regular fa-trash-can"></i>
        </button>

                ';
            })
            ->make(true);
    }

    public function  details($id){
        $student = User::find($id);
        return response()->json([
            'success' => true,
            'message' => 'User info loaded successfully',
            'data' => $student,
        ], 201);
    }
    // add user
    public function create(Request $request)
    {
        $validatedData = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6',
            'role' => 'required|in:student,admin',
            'status' => 'required|in:active,pending',
        ]);

        $user = User::create([
            'name' => $validatedData['name'],
            'email' => $validatedData['email'],
            'password' => bcrypt($validatedData['password']),
            'role' => $validatedData['role'],
            'status' => $validatedData['status'],
        ]);

        return response()->json([
            'success' => true,
            'message' => 'User created successfully',
            'data' => $user,
        ], 201);
    }
    public function edit(Request $request, $id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found',
            ], 404);
        }

        $validatedData = $request->validate([
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|unique:users,email,' . $user->id,
            'role' => 'sometimes|in:student,admin',
            'status' => 'sometimes|in:active,pending',
        ]);

        try {
            $user->update($validatedData);

            return response()->json([
                'success' => true,
                'message' => 'User updated successfully',
                'data' => $user,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update user',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function delete($id)
    {
        $user = User::find($id);

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'User not found',
            ], 404);
        }

        $user->delete();

        return response()->json([
            'success' => true,
            'message' => 'User deleted successfully',
        ], 200);
    }
    public function userInfo()
    {
        $user = Auth::user();
        $userCourses = $user->courses;
        $userMarks = $user->marks;
        return view('user.dashboard',compact('userCourses', 'user', 'userMarks'));

    }

    public function admin_statistics(){
        $userCount=User::count();
        $courseCount=Course::count();
        $activeUserCount=User::where('status','active')->count();
        $pendingUserCount=User::where('status','pending')->count();
        return view('admin.index',compact('userCount','courseCount','activeUserCount','pendingUserCount'));
    }

    public function userInfoApi()
    {

        $user = Auth::user();
        $userCourses = $user->courses->map(function ($course) use ($user) {
            $mark = $user->marks->where('course_id', $course->id)->first();
            return [
                'title' => $course->title,
                'mark' => $mark ? $mark->mark : null,
                'duration' => $course->duration.' weeks'
            ];
        });

        $data = [
            'name' => $user->name,
            'email' => $user->email,
            'courses' => $userCourses,
        ];
        return $this->successResponse(
         "usser courses and marks retrieved successfully.",$data,200);


    }

}
