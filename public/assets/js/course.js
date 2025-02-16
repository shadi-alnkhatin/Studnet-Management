$(document).ready(function () {
    const csrfToken = $('meta[name="csrf-token"]').attr('content'); // Fetch CSRF token

    // Initialize DataTable
    const courseTable = $('#coursesTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/admin/courses/all',
        columns: [
            {
                data: 'title',
                render: function (data, type, row) {
                    // Dynamically generate the URL for each course
                    const courseLessonsUrl = `/admin/courses/course-lesson/${row.id}`; // Adjust the URL as per your route
                    return `<a href="${courseLessonsUrl}">${data}</a>`;
                }
            },
            { data: 'duration',
                render: function (data, type, row) {
                   return data+' '+"week"
                }
            },
            { data: 'start_date' },
            { data: 'end_date' },
            { data: 'action', orderable: false, searchable: false },
        ],
    });

    // Reload DataTable
    function reloadTable() {
        courseTable.ajax.reload(null, false);
    }

    // Save or Update Course
    function saveCourse(url, method, formData) {
        $.ajax({
            url: url,
            type: method,
            data: JSON.stringify(formData),
            contentType: 'application/json',
            headers: { 'X-CSRF-TOKEN': csrfToken },
            success: function (response) {
                $('#courseModal, #editCourseModal').modal('hide');
                reloadTable();
                toastr.success(response.message);
            },
            error: function (xhr) {
                console.error(xhr.responseJSON.message || 'An error occurred');
            },
        });
    }

    // Create New Course
    $('#saveCourse').click(function () {
        const url = '/admin/courses/create';
        const method = 'POST';
        const formData = {
            title: $('#title').val(),
            duration: $('#duration').val(),
            start_date: $('#start_at').val(),
            end_date: $('#end_at').val(),
        };
        saveCourse(url, method, formData);
    });

    // Edit Existing Course
    $('#saveEditCourse').click(function () {
        const courseId = $('#editCourseId').val();
        const url = `/admin/courses/edit/${courseId}`;
        const method = 'PUT';
        const formData = {
            title: $('#editTitle').val(),
            duration: $('#editDuration').val(),
            start_date: $('#editStartAt').val(),
            end_date: $('#editEndAt').val(),
        };
        saveCourse(url, method, formData);
    });

    // Load Course Details into Edit Modal
    $(document).on('click', '.btn-edit', function () {
        const courseId = $(this).data('id');
        $.get(`/admin/courses/details/${courseId}`, function (response) {
            $('#editCourseId').val(response.data.id);
            $('#editTitle').val(response.data.title);
            $('#editDuration').val(response.data.duration);
            $('#editStartAt').val(formatDateForInput(response.data.start_date));
            $('#editEndAt').val(formatDateForInput(response.data.end_date));
            $('#editCourseModal').modal('show');
        });
    });


$(document).on('click', '.btn-delete', function () {
    const courseId = $(this).data('id');
    Swal.fire({
        title: 'Are you sure?',
        text: 'Do you really want to delete this course? This action cannot be undone.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Yes, delete it!',
        cancelButtonText: 'Cancel',
    }).then((result) => {
        if (result.isConfirmed) {
            $.ajax({
                url: `/admin/courses/delete/${courseId}`,
                type: 'DELETE',
                headers: { 'X-CSRF-TOKEN': csrfToken },
                success: function (response) {
                    // Reload table and show success message
                    reloadTable();
                    Swal.fire({
                        title: 'Deleted!',
                        text: response.message || 'The course has been deleted successfully.',
                        icon: 'success',
                        timer: 3000,
                        showConfirmButton: false,
                    });
                },
                error: function (xhr) {
                    // Show error message
                    Swal.fire({
                        title: 'Error!',
                        text: xhr.responseJSON?.message || 'An error occurred while deleting the course.',
                        icon: 'error',
                        timer: 3000,
                        showConfirmButton: false,
                    });
                },
            });
        }
    });
});


    // Format Date for Input
    function formatDateForInput(dateString) {
        const date = new Date(dateString);
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return `${year}-${month}-${day}`;
    }
});
