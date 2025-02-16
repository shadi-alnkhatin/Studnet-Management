$(document).ready(function() {
    const csrfToken = $('meta[name="csrf-token"]').attr('content');  // Fetch CSRF token from meta tag
    const userSelect = $('#userSelect');
    const courseSelect = $('#courseSelect');
    const markInput = $('#markInput');
    const setMarkForm = $('#setMarkForm');
    // Store DataTable instance
    const userTable = $('#usersTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: '/admin/users/all',
        columns: [
            { data: 'name' },
            { data: 'email' },
            { data: 'status' },
            {
                data: 'created_at',
                render: function (data, type, row) {
                    const date = new Date(data);
                    return date.toLocaleDateString('en-GB'); // Format as DD/MM/YYYY
                }
            },
            { data: 'action', orderable: false, searchable: false }
        ],
        columnDefs: [
            {
                targets: 2,
                createdCell: function (td, cellData, rowData, row, col) {
                    if (cellData === 'active') {
                        $(td).addClass('text-success'); // Green text for 'Active'
                    } else if (cellData === 'pending') {
                        $(td).addClass('text-warning');
                    }
                }
            }
        ]
    });


    // Function to reload DataTable
    function reloadTable() {
        userTable.ajax.reload(null, false); // false ensures the table doesn’t reset pagination
    }

    // Add or Edit User
    function saveUser(url, method, formData) {
        $.ajax({
            url: url,
            type: method,
            data: JSON.stringify(formData),  // Convert formData to JSON
            processData: false,  // Don't process the data
            contentType: 'application/json',  // Use JSON content type
            headers: { 'X-CSRF-TOKEN': csrfToken }, // Add CSRF token to header
            success: function (response) {
                $('#userModal, #editUserModal').modal('hide');
                reloadTable(); // Reload DataTable with updated data
                toastr.success(response.message);
            },
            error: function (xhr) {
                console.error(xhr.responseJSON.message || 'An error occurred');
            },
        });
    }

    window.deleteUser = function (userId) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'You won\'t be able to revert this!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!',
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: `/admin/users/delete/${userId}`,
                    type: 'DELETE',
                    headers: { 'X-CSRF-TOKEN': csrfToken }, // Add CSRF token to header
                    success: function (response) {
                        reloadTable();
                        Swal.fire(
                            'Deleted!',
                            response.message,
                            'success'
                        );
                    },
                    error: function (xhr) {
                        console.error(xhr.responseJSON.message || 'An error occurred');
                        Swal.fire(
                            'Error!',
                            'An error occurred while deleting the user.',
                            'error'
                        );
                    },
                });
            }
        });
    };


    $('#saveUser').click(function () {
        const url = '/admin/users/create';
        const method = 'POST';
        const formData = {
            name: $('#name').val(),
            email: $('#email').val(),
            status: $('#status').val(),
            password: $('#password').val(),
            role: $('#role').val(),
        };
        saveUser(url, method, formData);
    });

    // Save Button Click (Edit User)
    $('#saveEditUser').click(function () {
        const userId = $('#editUserId').val();
        const url = `/admin/users/edit/${userId}`;
        const method = 'PUT';
        const formData = {
            name: $('#editName').val(),
            email: $('#editEmail').val(),
            status: $('#editStatus').val(),
            role: $('#editRole').val(),
        };
        saveUser(url, method, formData);
    });
    // Event Listener for Edit
    $(document).on('click', '.btn-edit', function () {
        const userId = $(this).data('id');
        $.get(`/admin/users/details/${userId}`, function (response) {
            $('#editUserId').val(response.data.id);
            $('#editName').val(response.data.name);
            $('#editEmail').val(response.data.email);
            $('#editStatus').val(response.data.status);
            $('#editRole').val(response.data.role);
            $('#editUserModal').modal('show');
        });
    });




  // Load courses for the modal
function loadCourses(studentId) {
    $.get(`/admin/courses/all/${studentId}`, function (data) {
        $('#assignCourses').empty();
        $('#unassignCourses').empty();

        // Handle unassigned courses
        if (data.unassigned.length === 0) {
            $('#assignCourses').append('<option>No courses available to assign</option>');
        } else {
            data.unassigned.forEach(course => {
                $('#assignCourses').append(`<option value="${course.id}">${course.title}</option>`);
            });
        }

        // Handle assigned courses
        if (data.assigned.length === 0) {
            $('#unassignCourses').append('<option>No courses to unassign</option>');
        } else {
            data.assigned.forEach(course => {
                $('#unassignCourses').append(`<option value="${course.id}">${course.title}</option>`);
            });
        }
    }).fail(function () {
        alert('Failed to load courses. Please try again.');
    });
}



  // Open Assign Courses Modal
  $('#usersTable').on('click', '.assign-courses-btn', function () {
      const studentId = $(this).data('id');
      $('#studentId').val(studentId);
      loadCourses(studentId);
      $('#assignCoursesModal').modal('show');
  });

  // Save Assigned Courses
  $('#saveCoursesBtn').click(function () {
      const studentId = $('#studentId').val();
       const assignCourseIds = $('#assignCourses').val();
       const unassignCourseIds = $('#unassignCourses').val();

       $.ajax({
           url: `http://127.0.0.1:8000/admin/courses/manage-courses/${studentId}`,
           method: 'POST',
           headers: { 'X-CSRF-TOKEN': csrfToken },
           data: {
               _token: '{{ csrf_token() }}',
               assign_course_ids: assignCourseIds,
               unassign_course_ids: unassignCourseIds
           },
           success: function (response) {
               toastr.success(response.message);
               $('#assignCoursesModal').modal('hide');
               $('#studentsTable').DataTable().ajax.reload();
           },
           error: function (xhr) {
               alert('Failed to update courses');
           }
       });
  });


  // Fetch users on modal open
  $('#setMarkModal').on('show.bs.modal', function () {
    $.ajax({
      url: '/admin/users/all',
      type: 'GET',
      success: function (response) {
        markInput.val('');
        console.log(response);
        userSelect.empty().append('<option value="" disabled selected>Select a user</option>');
        response.data.forEach((user) => {
          userSelect.append(`<option value="${user.id}">${user.name}</option>`);
        });
      },
      error: function () {
        alert('Failed to load users.');
      },
    });
  });

  userSelect.on('change', function () {
    const userId = $(this).val();
    courseSelect.empty().append('<option value="" disabled selected>Loading courses...</option>');

    $.ajax({
      url: `/admin/courses/all/${userId}`,
      type: 'GET',
      success: function (response) {
        markInput.val('');
        courseSelect.empty().append('<option value="" disabled selected>Select a course</option>');
        if(response.assigned.length==0){
            courseSelect.append('<option value="" disabled selected>No courses assigned yet</option>');
          return;
        }
        response.assigned.forEach((course) => {
          courseSelect.append(`<option value="${course.id}">${course.title}</option>`);
        });
      },
      error: function () {
        courseSelect.empty().append('<option value="" disabled selected>Failed to load courses</option>');
      },
    });
  });



  courseSelect.on('change', function(){
    const userId = userSelect.val();
    const courseId = courseSelect.val();
    console.log(courseId);
    $.ajax({
        url: `/admin/courses/get-mark`,
        type: 'GET',
        data: {
            course_id: courseId,
            user_id: userId,
          },
        success: function (response) {
            markInput.val('');
            console.log(response.mark);
            markInput.val(response.mark);
        },
        error: function (xhr) {
            markInput.val('');
            console.error('Error:', xhr.responseText);
        }
    });
});

  // Handle form submission
  setMarkForm.on('submit', function (e) {
    e.preventDefault();

    const userId = userSelect.val();
    const courseId = courseSelect.val();
    const mark = markInput.val();

    if (!userId || !courseId || !mark) {
        Swal.fire({
            title: 'Error!',
            text:  'All fields are required',
            icon: 'error',
            timer: 3000,
            showConfirmButton: true,
          });         return;
    }

    $.ajax({
      url: `/admin/courses/set-mark/${userId}`,
      type: 'POST',
      data: {
        course_id: courseId,
        mark: mark,
      },
      headers: { 'X-CSRF-TOKEN': csrfToken },
      success: function (response) {
        setMarkForm[0].reset();
        $('#setMarkModal').modal('hide');
        Swal.fire({
          title: 'Success!',
          text: response.message,
          icon: 'success',
          timer: 3000,
          showConfirmButton: false,
        });
      },
      error: function (xhr) {
        Swal.fire({
          title: 'Error!',
          text: xhr.responseJSON?.message || 'Failed to save the mark.',
          icon: 'error',
          timer: 3000,
          showConfirmButton: false,
        });
      },
    });
  });

});
