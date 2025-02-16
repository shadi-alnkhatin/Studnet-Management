<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use App\Models\Course;
use App\Models\Mark;
use App\Models\User;

use Yajra\DataTables\DataTables;

class CoursesController extends Controller
{
    public function index()
    {
        $courses = Course::query();

        return DataTables::of($courses)
        ->addColumn('action', function ($course) {
            return '
                <button class="btn btn-warning btn-edit"  data-id="' . $course->id . '"><i class="fa-solid fa-pen"></i></button>
                <button class="btn btn-danger btn-delete" data-id="' . $course->id . '"><i class="fa-regular fa-trash-can"></i></button>
            ';
        })
        ->make(true);
    }
    public function create(Request $request ){
        // Validate the incoming request
        $request->validate([
            'title' =>'required|string|max:255',
            'duration' =>'required|integer',
            'start_date'=>'required',
            'end_date'=>'required',
        ]);

        // Create a new course in the database
        $course = Course::create([
            'title' => $request->title,
            'duration' => $request->duration,
           'start_date' => $request->start_date,
            'end_date' => $request->end_date,
        ]);

        return response()->json([
            'data' => $course,
           'message' => 'Course created successfully',
           'status_code' => 201,
        ]);
    }
    public function details($id)
    {
        $course = Course::find($id);

        if (!$course) {
            return response()->json([
                'message' => 'Course not found',
                'status_code' => 404,
            ], 404);
        }

        return response()->json([
            'data' => $course,
            'message' => 'Course details retrieved successfully',
            'status_code' => 200,
        ]);
    }

    // Edit a course
    public function edit(Request $request, $id)
    {
        $course = Course::find($id);

        if (!$course) {
            return response()->json([
                'message' => 'Course not found',
                'status_code' => 404,
            ], 404);
        }

        $validatedData = $request->validate([
            'title' => 'sometimes|string|max:255',
            'duration' => 'sometimes|integer|min:1',
            'start_date' => 'sometimes|date',
            'end_date' => 'sometimes|date|after_or_equal:start_date',
        ]);

        $course->update($validatedData);

        return response()->json([
            'data' => $course,
            'message' => 'Course updated successfully',
            'status_code' => 200,
        ]);
    }

    // Delete a course
    public function delete($id)
    {
        $course = Course::find($id);

        if (!$course) {
            return response()->json([
                'message' => 'Course not found',
                'status_code' => 404,
            ], 404);
        }

        $course->delete();

        return response()->json([
            'message' => 'Course deleted successfully',
            'status_code' => 200,
        ]);
    }
    public function getCourses($studentId)
    {
        $student = User::findOrFail($studentId);

        $assignedCourseIds = $student->courses()->pluck('courses.id')->toArray();

        return response()->json([
            'unassigned' => Course::whereNotIn('id', $assignedCourseIds)->get(),
            'assigned' => Course::whereIn('id', $assignedCourseIds)->get(),
        ]);
    }
    public function setMark(Request $request, $userId)
    {
        $student = User::findOrFail($userId);

        $validated = $request->validate([
            'course_id' => 'required|exists:courses,id',
            'mark' => 'required|numeric',
        ]);

        if (!$student->courses()->where('course_id', $validated['course_id'])->exists()) {
            return response()->json(['message' => 'Course is not assigned to this user.'], 400);
        }

        $student->marks()->updateOrCreate(
            ['course_id' => $validated['course_id']],
            ['mark' => $validated['mark']]
        );

        return response()->json(['message' => 'Mark saved successfully!']);
    }

    public function getMark(Request $request)
    {
        $validated = $request->validate([
            'course_id' => 'required|exists:courses,id',
            'user_id' => 'required|exists:users,id',
        ]);
        $courseId = $validated['course_id'];
        $userId= $validated['user_id'];
        $mark = Mark::where('user_id', $userId)
        ->where('course_id', $courseId)
        ->first();
        if (!$mark) {
            return response()->json(['message' => 'Mark not found for this course.'], 404);
        }

        return response()->json([
           'mark' => $mark->mark,
        ]);
    }

    public function manageCourses(Request $request, $id)
    {
        $student = User::findOrFail($id);

        $validated = $request->validate([
            'assign_course_ids' => 'array',
            'unassign_course_ids' => 'array',
        ]);

        // Assign courses
        if (!empty($validated['assign_course_ids'])) {
            $student->courses()->attach($validated['assign_course_ids']);
        }

        // Unassign courses
        if (!empty($validated['unassign_course_ids'])) {
            $student->courses()->detach($validated['unassign_course_ids']);
        }

        return response()->json(['message' => 'Courses updated successfully!']);
    }


}
