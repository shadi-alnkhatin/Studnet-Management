<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Main</div>
                    <a class="nav-link" href="/admin/index">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Dashboard
                    </a>

                    <div class="sb-sidenav-menu-heading">Manage</div>
                    <a class="nav-link" href="{{route('admin.users.index')}}">
                        <div class="sb-nav-link-icon"><i class="fas fa-users"></i></div>
                        Students
                    </a>
                    <a class="nav-link" href="{{route('admin.courses.index')}}">
                        <div class="sb-nav-link-icon"><i class="fas fa-book"></i></div>
                        Courses
                    </a>
                    <a class="nav-link" href="{{route('chat.index')}}">
                        <div class="sb-nav-link-icon"><i class="fas fa-book"></i></div>
                        Chat
                    </a>
                </div>

            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Logged in as:</div>
                ADMIN
            </div>

    </div>

    <div id="layoutSidenav_content">
        <main>
            @yield('content')
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                    <div>
                        <a href="#">Privacy Policy</a>
                        &middot;
                        <a href="#">Terms &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
