
$(document).ready(function () {
    const csrfToken = $('meta[name="csrf-token"]').attr('content'); // Fetch CSRF token
    let courseId = $('#course-id').val();
    // Initialize DataTable
    $('#lessonsTable').DataTable({
        processing: true,
        serverSide: true,
        ajax: `/admin/courses/lessons-table/${courseId}`, 
        columns: [
            { data: 'id', title: 'ID' },
            { data: 'title', title: 'Lesson Title' },
            { data: 'order', title: 'Order' },
            { 
                data: 'video_url',
                title: 'Video',
                render: function (data, type, row) {
                    return `<a href="${data}" target="_blank" class="btn btn-sm btn-primary">View Video</a>`;
                }
            },
            { 
                data: null,
                title: 'Actions',
                orderable: false,
                searchable: false,
                render: function (data, type, row) {
                    return `
                        <button class="btn btn-sm btn-warning edit-btn" data-id="${row.id}" data-title="${row.title}" data-order="${row.order}" data-video="${row.video_url}">Edit</button>
                        <button class="btn btn-sm btn-danger delete-btn" data-id="${row.id}">Delete</button>
                    `;
                }
            },
        ],
    });
    
    //Handle Add Button Click
    $('#savelesson').on('click', function(event) {
        event.preventDefault();
        const title = $('#add-title').val();
        const order = $('#add-order').val();
        const videoFile = $('#add-video-url')[0].files[0]; // Get the file from the file input

        const formData = new FormData();
        formData.append('title', title);
        formData.append('order', order);
        formData.append('video', videoFile); // Append the file here

        
        $.ajax({
            url: `/admin/courses/add-lesson/${courseId}`,
            method: 'POST',
            contentType: false, // Required for FormData
            processData: false, // Required for FormData
            headers: {
                'X-CSRF-TOKEN': csrfToken // Include CSRF token
            },
            data: formData,
            success: function(response) {
                alert('Lesson added successfully');
                $('#addModal').modal('hide');
                $('#lessonsTable').DataTable().ajax.reload();
            },
            error: function(xhr) {
                console.error(xhr.responseText);
                const errors = xhr.responseJSON?.errors;
                if (errors) {
                    alert(Object.values(errors).flat().join('\n')); // Display validation errors
                } else {
                    alert('An error occurred while adding the lesson');
                }
            }
        });
        
        
    });
    
    // Handle Edit Form Submit

    // Handle Edit Button Click
    $('#lessonsTable').on('click', '.edit-btn', function() {
        const lessonId = $(this).data('id');
        const title = $(this).data('title');
        const order = $(this).data('order');
        const video = $(this).data('video');
    
        // Open your edit modal or populate form fields for editing
        $('#editModal').modal('show');
        $('#edit-title').val(title);
        $('#edit-order').val(order);
        $('#edit-video-url').val(video);
        $('#edit-form').attr('action', `/admin/courses/lessons/${lessonId}`);
    });
    
    // Handle Delete Button Click
    $('#lessonsTable').on('click', '.delete-btn', function() {
        const lessonId = $(this).data('id');
    
        if (confirm('Are you sure you want to delete this lesson?')) {
            $.ajax({
                url: `/admin/courses/lessons/${lessonId}`,
                method: 'DELETE',
                success: function(response) {
                    alert('Lesson deleted successfully');
                    $('#lessonsTable').DataTable().ajax.reload();
                },
                error: function(xhr) {
                    console.error(xhr.responseText);
                    alert('An error occurred while deleting the lesson');
                }
            });
        }
    });
    
});












$('#add-lesson').submit(function(event) {
    event.preventDefault(); // Prevent form submission
    let form = $(this);
    let formData = new FormData(form[0]); // Serialize form data
    let courseId = $('#course-id').val(); // Get course ID

    $.ajax({
        url: `/admin/courses/add-lesson/${courseId}`, // Correct URL for the request
        method: 'POST',
        data: formData,
        contentType: false, // Required for file uploads
        processData: false, // Required for file uploads
        success: function(response) {
            console.log(response);
            alert('Lesson added successfully!');
            location.reload(); // Reload the page to show the new lesson
        },
        error: function(xhr, status, error) {
            console.error(xhr.responseText);
            alert('Error adding lesson. Please try again.');
        }
    });
});