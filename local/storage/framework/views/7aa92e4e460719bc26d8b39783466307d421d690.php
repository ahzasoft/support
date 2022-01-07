<?php $__env->startSection('title','إضافة مشروع'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div>
                <?php if($project->id): ?>
                    
                    <?php echo Form::open(['url' => action('ProjectController@update', [$project->id]), 'id' => 'role_form' ]); ?>

                        <input name="_method" type="hidden" value="PUT">
                    <?php else: ?>
                        
                    <?php echo Form::open(['url' => action('ProjectController@store'), 'method' => 'post' ]); ?>

                <?php endif; ?>
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

                    <input type="hidden" name="project_id" value="<?php echo e($project->id); ?>">
                    <div class="row">


                        <div class="col-4">
                            <div class="form-group">
                                <label for="name">إسم المشروع</label>
                                <input type="name" id="name" name="name" class="form-control"  value="<?php echo e($project->name); ?>">
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >حالة المشروع</label>
                                <select class="form-control" name="status">
                                    <?php $__currentLoopData = $project_status; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                       <option value="<?php echo e($status->id); ?>" <?php if($project->status==$status->id): ?> selected <?php endif; ?> >     <?php echo e($status->project_status); ?></option>
                                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >المسئول : </label>
                                <select class="form-control" name="responsble">
                                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                       <option value="<?php echo e($status->id); ?>"  <?php if($project->responsible==$status->id): ?> selected <?php endif; ?>><?php echo e($status->name); ?></option>
                                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>

                        <div class="col-lg-4">
                            <div class="form-group">
                                <label for="" >صاحب المشروع : </label>
                                <select class="form-control" name="owner">
                                    <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($status->id); ?>"    <?php if($project->owner==$status->id): ?> selected <?php endif; ?>  ><?php echo e($status->name); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>ملاحظات</label>
                        <textarea id="notes"  class="form-control" name="notes" rows="4" cols="50">
                            <?php echo $project->notes; ?>}
                        </textarea>


                    </div>


                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">

                    </div>
                    <?php echo Form::close(); ?>

            </div>
        </div>
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
    <script>








    </script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/projects/create.blade.php ENDPATH**/ ?>