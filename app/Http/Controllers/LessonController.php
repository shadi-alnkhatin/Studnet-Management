<?php

namespace App\Http\Controllers;

use App\Models\Course;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Lesson;
class LessonController extends Controller
{
    public function index($courseId)
    {
        // Fetch course with lessons
        $course = Course::findOrFail($courseId);
        return view('admin.add-lesson', compact('course'));
    }
    public function showToAdmin($courseId)
    {
        // Fetch course with lessons
        $course = Course::with('lessons')->findOrFail($courseId);
    
        // Transform the lessons for DataTables
        $lessons = $course->lessons->map(function ($lesson) {
            return [
                'id' => $lesson->id,
                'title' => $lesson->title,
                'order' => $lesson->order,
                'video_url' => $lesson->video_url,
            ];
        });
    
        // Return JSON response for DataTables
        return response()->json([
            'draw' => request()->get('draw'), // DataTables draw counter
            'recordsTotal' => $lessons->count(),
            'recordsFiltered' => $lessons->count(),
            'data' => $lessons,
        ]);
    }
    


    public function show($courseId)
    {
        // Fetch course with lessons
        $course = Course::with('lessons')->findOrFail($courseId);
        return view('user.lessons', compact('course'));
    }

    public function store(Request $request, $courseId)
    {
        // Validate request
        $validated = $request->validate([
            'title' => 'required|string',
            'order' => 'nullable|integer',
            'video' => 'required|file|mimes:mp4,mkv,avi'
        ]);

        // Find course
        $course = Course::findOrFail($courseId);

        // Store video file
        $videoPath = $request->file('video')->store('videos', 'public');

        // Create lesson
        $lesson = $course->lessons()->create([
            'title' => $validated['title'],
            'order' => $validated['order'],
            'video_url' => $videoPath,
        ]);



        return response()->json([
            'data' => $lesson,
            'message' => 'Lesson created successfully',
            'status_code' => 201,
        ]);
    }
}
