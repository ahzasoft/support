<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="<?php echo e('/'); ?>" class="nav-link">الرئيسية</a>
        </li>
      <li class="nav-item d-none d-sm-inline-block">
            <a href="/actions" class="nav-link"><?php echo e(Request::route()->getName()); ?></a>
        </li>

    </ul>
  <div style="position:absolute;left: 5px">
        <form method="POST" action="<?php echo e(route('logout')); ?>">
            <?php echo csrf_field(); ?>
            <div class="dropdown show">
                <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <?php echo e(auth()->user()->name); ?>

                </a>

                <div class="dropdown-menu" aria-labelledby="dropdownMenuLink" style="left: 0px;padding-right: 20px">
                    <div style="width: 265px">
                        <div class="row">
                            <div class="col-12">
                                <div class="image" style="padding-bottom: 30px">
                                    <img src="<?php echo e(asset('assets/dist/img/user.png')); ?>" class="img-circle elevation-2" alt="User Image" style="margin: auto">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <a class="btn btn-primary" style="background-color: #252525;border-color: #b0bac6;width: 100%;" href="/logout" onclick="event.preventDefault();
                                                            this.closest('form').submit();">تسجيل خروج</a>
                            </div>
                            <div class="col-6">
                                <a class="btn btn-primary" style="background-color: #252525;border-color: #b0bac6;width: 100%;" href="/logout" onclick="event.preventDefault();
                                                            this.closest('form').submit();">تعديل بيانات</a>
                            </div>
                        </div>
                        </div>
                    </div>


                </div>
        </form>



    </div>



</nav>

<?php /**PATH F:\laragon\www\azha-support\local\resources\views/layouts/navebar.blade.php ENDPATH**/ ?>