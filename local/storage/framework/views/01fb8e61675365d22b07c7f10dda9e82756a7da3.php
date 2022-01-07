<?php $__env->startSection('title','تعديل صلاحية'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div>
                <form method="POST" action="<?php echo e(url('roles')); ?>" enctype="multipart/form-data">
                    <?php echo csrf_field(); ?>
                    <?php if($errors->any()): ?>
                        <div class="alert alert-danger">
                            <ul>
                                <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <li><?php echo e($error); ?></li>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </ul>
                        </div>
                    <?php endif; ?>

                    <input type="hidden" name="roleid" value="<?php echo e($role->id); ?>">
                    <div class="row">
                        <div class="col-4">
                            <div class="form-group">
                                <label for="name">إسم الصلاحية</label>
                                <input type="name" id="name" name="name" class="form-control"  value="<?php echo e($role->name); ?>">
                            </div>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-3">
                            <label>صلاحيات مستخدم </label>
                        </div>
                    </div>

                
                    <!-- Users  -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="20">
                                    <span class="ml-2 text-sm text-gray-600">المستخدم (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox"  class="form-checkbox input-icheck" name="permissions[]"
                                               value="user.add" <?php if(in_array('user.add',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة مستخدم جديد</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="user.edit"  <?php if(in_array('user.edit',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل بيانات مستخدم</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="user.delete"  <?php if(in_array('user.delete',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف بيانات مستخدم</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <!--Roles  2 -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="30">
                                    <span class="ml-2 text-sm text-gray-600">الصلاحيات (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.view1"  <?php if(in_array('role.view1',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">صلاحية 1</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.add1"  <?php if(in_array('role.add1',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.edit1"  <?php if(in_array('role.edit1',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل صلاحية</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete1"  <?php if(in_array('role.delete1',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <!--Roles  3 -->
                    <!--Template -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="40">
                                    <span class="ml-2 text-sm text-gray-600">الصلاحيات (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.view"  <?php if(in_array('role.view',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">عرض الصلاحيات</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.add"  <?php if(in_array('role.add',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.edit"  <?php if(in_array('role.edit',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل صلاحية</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" <?php if(in_array('role.delete',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" <?php if(in_array('role.delete',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" <?php if(in_array('role.delete',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" <?php if(in_array('role.delete',$permissions)): ?> checked <?php endif; ?>>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>



                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">

                    </div>
                </form>
            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
    <script>








    </script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/roles/roles_edit.blade.php ENDPATH**/ ?>