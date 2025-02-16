@extends('layouts.base')
@section('content')
<div class="container-fluid px-4">
    <h1 class="mt-4">Students</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item active"></li>
    </ol>
    <button type="button" class="btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#userModal">
        Add Student
      </button>
      <button type="button" class="btn btn-primary my-2" data-bs-toggle="modal" data-bs-target="#setMarkModal">
        Set Mark
      </button>
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Students Table
        </div>
        <div class="card-body">
            <table id="usersTable" class="table table-bordered table-striped table-hover">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

                </tbody>
            </table>
        </div>
    </div>
</div>

@include('admin.students-crud')


@endsection

@push('admin-scripts')
    <script src="{{asset('assets/js/students.js')}}"></script>
    <script src="{{asset('assets/js/scripts.js')}}"></script>
    <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script> 
    <script src="{{asset('assets/js/datatables-simple-demo.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="{{asset('assets/demo/chart-area-demo.js')}}"></script>
    <script src="{{asset('assets/demo/chart-bar-demo.js')}}"></script>
@endpush
