@extends('layouts.user')
@section('title')
 Welcome
@endsection
@section('content')
@if (auth()->user()->isPending())
<section class="container mx-auto my-8 p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-4">Your Status is Pending Wait the Admin To Change it..</h2>

</section>

@else
<!-- User Info Section -->
 <section class="container mx-auto my-8 p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-4">Your Information</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
        <div>
            <p class="text-gray-700"><span class="font-semibold">Name:</span> {{$user->name}}</p>
            <p class="text-gray-700"><span class="font-semibold">Email:</span> {{$user->email}}</p>
            <p class="text-gray-700"><span class="font-semibold">Student ID:</span> {{$user->id}}</p>
        </div>
       
    </div>
</section>

<!-- Courses Section -->
<section class="container mx-auto my-8 p-6 bg-white rounded-lg shadow-lg">
    <h2 class="text-2xl font-bold mb-6">Your Courses</h2>
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @if ($userCourses->isEmpty())
         <p class="text-gray-700">
             <span class="font-semibold">There are no courses assigned to you yet</span>
         </p>
        @endif

       @foreach ($userCourses as $course )
       @php
       $courseMark = $userMarks->firstWhere('course_id', $course->id);
        @endphp
       <div class="bg-blue-50 p-6 rounded-lg shadow-md">
        <h3 class="text-xl font-semibold mb-2">
            <a href="{{ route('CourseLessons', ['courseId' => $course->id]) }}">
                {{ $course->title }}
            </a>
        </h3>
        <p class="text-gray-700 mb-4">Lorem ipsum, dolor sit amet consectetur adipisicing elit. </p>
        <p class="text-gray-700"><span class="font-semibold">start at:</span> {{$course->start_date}}</p>
        <p class="text-gray-700"><span class="font-semibold">end at:</span> {{$course->end_date}}</p>

        <p class="text-gray-700"><span class="font-semibold">Status:</span> <span class="text-green-600">Enrolled</span></p>
        @if ($courseMark)
        <p class="text-gray-700"><span class="font-semibold">Mark:</span> {{ $courseMark->mark }}/100</p>

        @endif
    </div>
       @endforeach
    </div>
</section>

@endif
 @endsection
