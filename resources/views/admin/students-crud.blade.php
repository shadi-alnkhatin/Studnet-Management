
<!-- Modal -->
<div class="modal fade" id="userModal" tabindex="-1" aria-labelledby="userModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="userModalLabel">User Form</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="userForm">
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
              </div>
            <div class="mb-3">
              <label for="role" class="form-label">Role</label>
              <select class="form-select" id="role" name="role">
                <option value="student">Student</option>
                <option value="admin">Admin</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="status" class="form-label">Status</label>
              <select class="form-select" id="status" name="status">
                <option value="active">Active</option>
                <option value="pending">Pending</option>
              </select>
            </div>
            <input type="hidden" id="userId" name="userId">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="saveUser">Save changes</button>
        </div>
      </div>
    </div>
  </div>
<!-- Edit User Modal -->
<div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="editUserForm">
            <div class="mb-3">
              <label for="editName" class="form-label">Name</label>
              <input type="text" class="form-control" id="editName" name="name" required>
            </div>
            <div class="mb-3">
              <label for="editEmail" class="form-label">Email</label>
              <input type="email" class="form-control" id="editEmail" name="email" required>
            </div>

            <div class="mb-3">
              <label for="editRole" class="form-label">Role</label>
              <select class="form-select" id="editRole" name="role">
                <option value="student">Student</option>
                <option value="admin">Admin</option>
              </select>
            </div>
            <div class="mb-3">
              <label for="editStatus" class="form-label">Status</label>
              <select class="form-select" id="editStatus" name="status">
                <option value="active">Active</option>
                <option value="pending">Pending</option>
              </select>
            </div>
            <input type="hidden" id="editUserId" name="userId">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="saveEditUser">Save changes</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Assign/Unassign Courses Modal -->
<div class="modal fade" id="assignCoursesModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Manage Courses</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <form id="manageCoursesForm">
                    <input type="hidden" id="studentId">

                    <!-- Assign Courses -->
                    <div class="mb-3">
                        <label for="assignCourses" class="form-label">Assign Courses:</label>
                        <select id="assignCourses" name="assign_course_ids[]" class="form-select custom-select" multiple></select>
                    </div>

                    <!-- Unassign Courses -->
                    <div class="mb-3">
                        <label for="unassignCourses" class="form-label">Unassign Courses:</label>
                        <select id="unassignCourses" name="unassign_course_ids[]" class="form-select custom-select" multiple></select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" id="saveCoursesBtn" class="btn btn-primary">Save Changes</button>
            </div>
        </div>
    </div>
</div>
<!-- Set Mark Modal -->
<div class="modal fade" id="setMarkModal" tabindex="-1" aria-labelledby="setMarkModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="setMarkModalLabel">Set Mark</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form id="setMarkForm">
            <div class="mb-3">
              <label for="userSelect" class="form-label">Select User</label>
              <select id="userSelect" class="form-select" required>
                <option value="" selected disabled>Select a user</option>
                <!-- User options populated dynamically -->
              </select>
            </div>
            <div class="mb-3">
              <label for="courseSelect" class="form-label">Select Course</label>
              <select id="courseSelect" class="form-select" required>
                <option value="" selected disabled>Select a course</option>
                <!-- Course options populated dynamically -->
              </select>
            </div>
            <div class="mb-3">
              <label for="markInput" class="form-label">Set Mark</label>
              <input type="number" id="markInput" class="form-control" placeholder="Enter mark" min="0" max="100" required>
            </div>
            <button type="submit" class="btn btn-primary">Save Mark</button>
          </form>
        </div>
      </div>
    </div>
  </div>
