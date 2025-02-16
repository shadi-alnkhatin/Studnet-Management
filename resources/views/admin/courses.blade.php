@extends('layouts.base')
@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Courses</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active"></li>
    </ol>
    <button type="button" class="btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#courseModal">
        Add Course
      </button>

    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Courses Table
        </div>
        <div class="card-body">
            <table id="coursesTable" class="table table-bordered table-striped ">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Duration</th>
                        <th>Start At</th>
                        <th>End At</th>
                        <th>Action</th>
                    </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Edit Course Modal -->
<div class="modal fade" id="editCourseModal" tabindex="-1" aria-labelledby="editCourseModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editCourseModalLabel">Edit Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="editCourseForm">
                    <div class="mb-3">
                        <label for="editTitle" class="form-label">Title</label>
                        <input type="text" class="form-control" id="editTitle" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="editDuration" class="form-label">Duration (in weeks)</label>
                        <input type="number" class="form-control" id="editDuration" name="duration" required>
                    </div>
                    <div class="mb-3">
                        <label for="editStartAt" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="editStartAt" name="start_at" required>
                    </div>
                    <div class="mb-3">
                        <label for="editEndAt" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="editEndAt" name="end_at" required>
                    </div>
                    <input type="hidden" id="editCourseId" name="courseId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveEditCourse">Save changes</button>
            </div>
        </div>
    </div>
</div>

@include('admin.courses-crud')

@endsection
@push('admin-scripts')
    <script src="{{asset('assets/js/course.js')}}"></script>
    <script src="{{asset('assets/js/scripts.js')}}"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script src="{{asset('assets/js/datatables-simple-demo.js')}}"></script>
@endpush
