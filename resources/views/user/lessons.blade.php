@extends('layouts.user')

@section('content')
<div class="container mx-auto p-4">
    <div class="card mb-4 shadow-sm bg-white rounded-lg overflow-hidden">
        <div class="card-body p-6">
            <h2 class="card-title text-2xl font-bold text-gray-900">{{ $course->title }}</h2>
            <p class="card-text text-gray-600 mt-2">Duration: {{ $course->duration }} weeks</p>
        </div>
    </div>
    <div class="flex flex-col md:flex-row gap-6">
        <!-- Sidebar for Lessons -->
        <div class="w-full md:w-2/4">
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold mb-4">Lessons</h2>
                <ul class="space-y-2">
                    @foreach ($course->lessons as $lesson)
                        <li class="p-3 rounded-lg hover:bg-gray-100 transition duration-200 cursor-pointer lesson-item" data-video="{{ asset('storage/' . $lesson->video_url) }}">
                            <div class="flex justify-between items-center">
                                <a href="#" class="text-blue-600 hover:text-blue-800 lesson-link">
                                    {{ $lesson->title }}
                                </a>
                                <span class="bg-blue-500 text-white text-sm px-2 py-1 rounded-full">Lesson {{ $lesson->order }}</span>
                            </div>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>

        <!-- Main Content Area for Video -->
        <div class="w-full md:w-3/4">
            <div class="bg-white rounded-lg shadow-md p-6">
                <h2 class="text-xl font-semibold mb-4">Lesson Video</h2>
                <div id="video-container" class="bg-gray-50 rounded-lg p-4">
                    <p class="text-gray-500">Select a lesson to start watching.</p>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('user-scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const lessonItems = document.querySelectorAll('.lesson-item');
        const videoContainer = document.getElementById('video-container');

        lessonItems.forEach(item => {
            item.addEventListener('click', function (e) {
                e.preventDefault();

                // Get the video URL from the data attribute
                const videoUrl = item.getAttribute('data-video');

                // Update the video container with the selected video
                videoContainer.innerHTML = `
                    <video
                        id="lesson-video"
                        class="w-full rounded-lg shadow-md"
                        controls
                        preload="auto"
                        width="640"
                        height="360">
                        <source src="${videoUrl}" type="video/mp4">
                        <!-- Add more sources for different formats if needed -->
                    </video>
                `;
            });
        });
    });
</script>
@endpush
