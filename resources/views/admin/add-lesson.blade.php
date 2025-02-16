@extends('layouts.base')

@section('content')
<div class="container mt-5">
    <!-- Course Title and Duration -->
    <div class="card mb-4 shadow-sm">
        <div class="card-body">
            <h1 class="card-title display-4">{{ $course->title }}</h1>
            <p class="card-text text-muted">Duration: {{ $course->duration }} weeks</p>
        </div>
    </div>

    <div class="container-fluid px-4">
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active"></li>
        </ol>
        <button type="button" class="btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#lessonModal">
            Add Lesson
          </button>
    
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Lessons Table
            </div>
            <div class="card-body">
                <table id="lessonsTable" class="table table-bordered table-striped ">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Order</th>
                            <th>Video</th>
                            <th>Action</th>
                        </tr>
                    </thead>
    
                    <tbody>
    
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    @include('admin.lessons-crud')

@endsection
@push('admin-scripts')
    <script src="{{asset('assets/js/lesson.js')}}"></script>
    <script src="{{asset('assets/js/scripts.js')}}"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="{{asset('assets/js/datatables-simple-demo.js')}}"></script>
@endpush
