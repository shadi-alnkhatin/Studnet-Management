<!-- Add Course Modal -->
<div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="courseModalLabel">Add Course</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="courseForm">
                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>
                    <div class="mb-3">
                        <label for="duration" class="form-label">Duration (in weeks)</label>
                        <input type="number" class="form-control" id="duration" name="duration" required>
                    </div>
                    <div class="mb-3">
                        <label for="start_at" class="form-label">Start Date</label>
                        <input type="date" class="form-control" id="start_at" name="start_at" required>
                    </div>
                    <div class="mb-3">
                        <label for="end_at" class="form-label">End Date</label>
                        <input type="date" class="form-control" id="end_at" name="end_at" required>
                    </div>
                    <input type="hidden" id="courseId" name="courseId">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="saveCourse">Save changes</button>
            </div>
        </div>
    </div>
</div>
