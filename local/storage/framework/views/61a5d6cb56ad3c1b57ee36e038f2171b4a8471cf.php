<?php $__env->startSection('titel','Login'); ?>;
<?php $__env->startSection('maincontent'); ?>
        <?php if(session('status')): ?>
            <div class="mb-4 font-medium text-sm text-green-600">
                <?php echo e(session('status')); ?>

            </div>
        <?php endif; ?>
    <div style="background: #FFFFFF;max-width:1000px;  margin: auto;padding: 20px;border-radius: 10px" >
            <div class="container h-100">
                <div class="d-flex justify-content-center h-100">
                    <div class="user_card">
                        <div class="d-flex justify-content-center">
                            <div class="brand_logo_container">
                                <img src="<?php echo e(asset('assets/images/logo.png')); ?>" class="brand_logo" alt="Logo">
                            </div>
                        </div>
                        <div class="d-flex justify-content-center form_container">
                            <form method="POST" action="<?php echo e(route('login')); ?>">
                                <?php echo csrf_field(); ?>
                                <div class="input-group mb-3">
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                                    </div>
                                    <input type="text" name="mobile" :value="old('mobile')"  autofocus  class="form-control input_user" value="" placeholder="username">
                                </div>
                                <div class="input-group mb-2">
                                    <div class="input-group-append">
                                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                                    </div>
                                    <input type="password"id="password" name="password" class="form-control input_pass" value="" placeholder="password">
                                </div>
                                <div class="form-group">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="remember_me" name="remember">
                                        <label class="custom-control-label" for="customControlInline">تذكرني </label>
                                    </div>
                                </div>
                                <div class="d-flex justify-content-center mt-3 login_container">
                                    <button type="submit" name="button" class="btn login_btn">تسجيل الدخول</button>
                                </div>
                            </form>
                        </div>

                        <div class="mt-4">
                            <div class="d-flex justify-content-center links">
                               لا تمتلك حساب ؟ <a href="/register" class="ml-2">تسجيل حساب</a>
                            </div>
                            <div class="d-flex justify-content-center links">
                                <a href="#">هل نسيت بيانات تسجيل الدخول ؟</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div style="width: 80%;display: none">
                <table class="table table-bordered ">
                    <tr>
                        <th>Type</th>
                        <th>User name</th>
                        <th>Password</th>
                    </tr>
                    <tr>
                        <td>Admin</td>
                        <td><input type="text" class="form-control" value="01024649844"></td>
                        <td><input type="text" class="form-control" value="123456"></td>
                    <tr>

                    <tr>
                        <td>تمريض</td>
                        <td><input type="text" class="form-control" value="01024649800"></td>
                        <td><input type="text" class="form-control" value="123456"></td>
                    <tr>

                    <tr>
                        <td>محاسب</td>
                        <td><input type="text" class="form-control" value="01024649801"></td>
                        <td><input type="text" class="form-control" value="123456"></td>
                    <tr>
                    <tr>
                        <td>محاسب</td>
                        <td><input type="text" class="form-control" value="01024649845"></td>
                        <td><input type="text" class="form-control" value="123456"></td>
                    <tr>

                </table>
            </div>
        </div>
<?php $__env->stopSection(); ?>


<?php echo $__env->make('layouts.guest', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/auth/login.blade.php ENDPATH**/ ?>