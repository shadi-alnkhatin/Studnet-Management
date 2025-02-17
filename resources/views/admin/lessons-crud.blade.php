<!-- Add Course Modal -->
<div class="modal fade" id="lessonModal" tabindex="-1" aria-labelledby="lessonModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="lessonModalLabel">Add Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="AddLessonForm">
                    @csrf
                    <input id="course-id" type="hidden" value="{{$course->id}}">
                 <div class="mb-3">
                    <label for="title" class="form-label">Lesson Title</label>
                    <input type="text" id="add-title" name="title" class="form-control" placeholder="Enter lesson title" required>
                </div>
                    <div class="mb-3">
                        <label for="order" class="form-label">Lesson Order</label>
                        <input id="add-order" type="number" name="order" class="form-control" placeholder="Enter lesson order">
                    </div>
                    <div class="mb-3">
                        <label for="video" class="form-label">Upload Video</label>
                        <input id="add-video-url" type="file" name="video" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="savelesson">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- Add Course Modal -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="lessonModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="lessonModalLabel">Add Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="EditLessonForm">
                    @csrf
                    <input id="edit-lesson-id" type="hidden" value="">
                 <div class="mb-3">
                    <label for="title" class="form-label">Lesson Title</label>
                    <input type="text" id="edit-title" name="title" class="form-control" placeholder="Enter lesson title" required>
                </div>
                    <div class="mb-3">
                        <label for="order" class="form-label">Lesson Order</label>
                        <input id="edit-order" type="number" name="order" class="form-control" placeholder="Enter lesson order">
                    </div>
                    <div class="mb-3">
                        <label for="video" class="form-label">Upload Video</label>
                        <input id="add-video-url" type="file" name="video" class="form-control">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="editLesson">Save changes</button>
            </div>
        </div>
    </div>
</div>
