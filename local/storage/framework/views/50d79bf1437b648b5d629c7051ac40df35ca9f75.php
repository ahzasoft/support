<?php $__env->startSection('title','إضافة مستخدم'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper">
        <div class="pagecontainer">
            <div>
                <form method="POST" action="<?php echo e('/users'); ?>" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <input type="hidden" value="<?php echo e($user->id); ?>" name="userid">
                    <div class="form-group">
                        <label for="name">إسم المستخدم</label>
                        <input type="text" id="name" name="name" class="form-control" value="<?php echo e($user->name); ?>"
                               required autofocus autocomplete="name"/>
                        <small class="text-danger"><?php echo e($errors->first('name')); ?></small>
                    </div>

                    <div class="form-group">
                        <label for="price">رقم الموبيل(سوف يكون إسم المستخدم)</label>
                        <input type="text" id="mobile" name="mobile" class="form-control integr"
                               value="<?php echo e($user->mobile); ?>"/>
                        <small class="text-danger"><?php echo e($errors->first('mobile')); ?></small>
                    </div>


                    <div class="form-group">
                        <label for="password">كلمة المرور</label>
                        <input type="password" name="password" class="form-control"
                                <?php if(!$user->id): ?> required  <?php endif; ?>   value="" autocomplete="new-password" />
                        <small class="text-danger"><?php echo e($errors->first('password')); ?></small>
                    </div>



                    <div class="form-group">
                        <label for="sessions">ايميل</label>
                        <input type="text" name="email" class="form-control "
                              value="<?php echo e($user->email); ?>"/>
                        <small class="text-danger"><?php echo e($errors->first('email')); ?></small>
                    </div>

                    <div class="form-group">
                        <label for="sessions">العنوان </label>
                        <input type="text" name="address" class="form-control "
                               value="<?php echo e($user->address); ?>"/>
                        <small class="text-danger"><?php echo e($errors->first('address')); ?></small>
                    </div>

                    <div class="form-group">
                        <label for="status">حالة المستخدم </label>
                        <select id="status" name="status" class="form-control">
                            <option value="0" <?php if($user->status==0): ?> selected <?php endif; ?>>غير نشط</option>
                            <option value="1"  <?php if($user->status==1): ?> selected <?php endif; ?> > نشط</option>
                        </select>
                    </div>

                    <div style="padding: 10px 10px 25px 10px" >
                        <label >الصلاحيات </label>

                        <select id="role" name="role" class="form-control" >
                            <option value="0">بدون صلاحية</option>
                            <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <option value="<?php echo e($role->id); ?>" <?php if($user->hasrole($role->name)): ?> selected <?php endif; ?>    ><?php echo e($role->name); ?></option>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                        </select>

                    </div>
                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">
                    </div>
                </form>
            </div>
        </div>

    </div>
<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>

<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/admin/user_add.blade.php ENDPATH**/ ?>