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
    public function update(Request $request, $lessonId)
    {
        $lesson = Lesson::find($lessonId);
        if (!$lesson) {
            return response()->json([
                'message' => 'Lesson not found',
                'status_code' => 404,
            ], 404);
        }

        $validated = $request->validate([
            'title' => 'sometimes|string',
            'order' => 'sometimes|integer',
            'video' => 'sometimes|file|mimes:mp4,mkv,avi'
        ]);

        // Handle video upload
        if ($request->hasFile('video')) {
            // Delete old video if it exists
            if ($lesson->video_url) {
                Storage::disk('public')->delete($lesson->video_url);
            }
            // Store new video
            $videoPath = $request->file('video')->store('videos', 'public');
            $lesson->video_url = $videoPath;
        }

        // Only update fields that are present in the request
        $updateData = [];
        if ($request->has('title')) {
            $updateData['title'] = $validated['title'];
        }
        if ($request->has('order')) {
            $updateData['order'] = $validated['order'];
        }
        if ($request->hasFile('video')) {
            $updateData['video_url'] = $lesson->video_url;
        }

        $lesson->update($updateData);

        return response()->json([
            'message' => 'Lesson updated successfully',
            'status_code' => 200,
        ]);
    }
    public function delete( $lessonId){
        $lesson = Lesson::find($lessonId);
        if ($lesson->video_url) {
            Storage::disk('public')->delete($lesson->video_url);
        }
         $lesson->delete();
        return response()->json([
           'message' => 'Lesson deleted successfully',
           'status_code' => 200,
        ]);
    }
}
