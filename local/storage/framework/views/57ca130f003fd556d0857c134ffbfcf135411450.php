<?php $__env->startSection('title','المستخدمين'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div style="display: inline-block;" >
                <a href="<?php echo e(url('users/create')); ?>" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة مستخدم </a>
            </div>

              <div>
                <?php if($message = Session::get('success')): ?>
                    <div class="alert alert-success">
                        <p><?php echo e($message); ?></p>
                    </div>
                <?php endif; ?>
          <table class="table  myGridClass table-hover ">
              <thead>
              <tr>
                  <th style="width: 80px;">م</th>
                  <th>إسم المستخدم</th>
                  <th>رقم الموبيل</th>
                  <th>اللإيميل</th>
                  <th>الحالة</th>
                  <th>الصلاحية</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              <?php $__currentLoopData = $users; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $user): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <tr id="<?php echo e($user->id); ?>">
                      <td>
                          <?php echo e($loop->iteration); ?>

                      </td>
                      <td><?php echo e($user->name); ?></td>
                      <td><?php echo e($user->mobile); ?></td>
                      <td><?php echo e($user->email); ?></td>
                      <td><?php if($user->status==1): ?> نشط  <?php else: ?>  غير نشط  <?php endif; ?> </td>
                      <td><?php echo e($user->roles()->pluck('name')->implode(' ')); ?></td>
                      <td>
                          <a href="users/<?php echo e($user->id); ?>/edit" class="btn btn-primary" >  <i class="fas fa-edit"></i> تعديل </a>
                          <button class="btn btn-danger"   onclick="deleteConfirm(<?php echo e($user->id); ?>)" ><i class="fas fa-trash-alt"></i>  حذف </button>

                      </td>
                  </tr>
                  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
              </tbody>
          </table>

            </div>
        </div>
    </div>


    <div class="modal fade brands_modal" tabindex="-1" role="dialog"
         aria-labelledby="gridSystemModalLabel">
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
<script>
    function deleteConfirm(row)
    {
        $.MessageBox({
            buttonDone  : "Yes",
            buttonFail  : "No",
            message     : "هل أنت متأكد من حذف المستخدم ؟",
            speed       : 500
        }).done(function() {

            var _token = $("input[name='_token']").val();
            $.ajax({
                url: "<?php echo e(url('users/1')); ?>",
                type:'DELETE',
                data: {
                    _token:_token
                    ,userid:row

                },
                success: function(result) {

                    if(result['status']) {
                        notifier.success(result['masseg']);
                        var drow = document.getElementById(row);
                        drow.parentNode.removeChild(drow);
                    }else {
                        notifier.alert(result['masseg']);
                    }
                }
            });

        });
    }

    $(document).on('click', '.btn-modal', function(e) {
        e.preventDefault();
        var container = $(this).data('container'); /*.brands_modal*/
        $.ajax({
            url: $(this).data('href'),
            dataType: 'html',
            success: function(result) {
                $(container)
                    .html(result)
                    .modal('show');
            },
        });
    });

</script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/admin/index.blade.php ENDPATH**/ ?>