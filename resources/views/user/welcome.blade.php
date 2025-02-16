@extends('layouts.user')
@section('title')
 Welcome
@endsection
@push('user-head')
<style>
    header{
        height: 80vh;
        display: flex;
        align-items: center;
    }
</style>
@endpush
@section('content')

 <!-- Hero Section -->
 <header class="bg-blue-500 text-white py-20">
    <div class="container mx-auto text-center">
        <h1 class="text-5xl font-bold mb-4">Welcome to the Student System</h1>
        <p class="text-xl mb-8">Manage your courses, track progress, and achieve your academic goals.</p>
        <a href="#" class="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100">Get Started</a>
    </div>
</header>

<!-- Features Section -->
<section class="py-16">
    <div class="container mx-auto text-center">
        <h2 class="text-3xl font-bold mb-8">Features</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-xl font-semibold mb-4">Course Management</h3>
                <p>Easily enroll in courses, track your progress, and access study materials.</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-xl font-semibold mb-4">Progress Tracking</h3>
                <p>Monitor your academic performance and stay on top of your goals.</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-lg">
                <h3 class="text-xl font-semibold mb-4">24/7 Support</h3>
                <p>Get help anytime with our dedicated support team.</p>
            </div>
        </div>
    </div>
</section>

<!-- Call to Action Section -->
<section class="bg-blue-500 text-white py-16">
    <div class="container mx-auto text-center">
        <h2 class="text-3xl font-bold mb-4">Ready to Get Started?</h2>
        <p class="text-xl mb-8">Join thousands of students achieving their academic goals with our system.</p>
        <a href="/register" class="bg-white text-blue-600 px-8 py-3 rounded-lg font-semibold hover:bg-gray-100">Sign Up Now</a>
    </div>
</section>

@endsection
