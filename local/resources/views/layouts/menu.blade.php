<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{asset('assets/dist/img/user.png')}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a  href="http://laravel_auth.local/user/profile" class="d-block"> {{auth()->user()->name}}</a>
            </div>
        </div>
        <!-- Sidebar Menu -->
        <nav class="mt-2">
        {!! Menu::render('admin-sidebar-menu','adminltecustom'); !!}
        </nav>
    </div>
    <!-- end of sidebar -->
</aside>
