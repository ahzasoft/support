<?php $__env->startSection('title','إضافة صلاحية'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div style="display: inline-block;" >
                <a href="<?php echo e(url('roles/add')); ?>" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة صلاحية </a>
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
                  <th>الصلاحية</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              <?php $__currentLoopData = $roles; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $role): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <tr id="<?php echo e($role->id); ?>">
                      <td>
                          <?php echo e($loop->iteration); ?>

                      </td>
                      <td><?php echo e($role->name); ?></td>
                      <td>
                          <a href="roles/<?php echo e($role->id); ?>/edit" class="btn btn-primary" >  <i class="fas fa-edit"></i> تعديل </a>
                          <button class="btn btn-danger"   onclick="deleteConfirm(<?php echo e($role->id); ?>)" ><i class="fas fa-trash-alt"></i>  حذف </button>

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
            message     : "هل أنت متأكد من حذف الصلاحية ؟",
            speed       : 500
        }).done(function() {

            var _token = $("input[name='_token']").val();
            $.ajax({
                url: "<?php echo e(url('roles/1')); ?>",
                type:'DELETE',
                data: {
                    _token:_token
                    ,roleid:row

                },
                success: function(data) {
                    notifier.success(data);
                    var drow = document.getElementById(row);
                    drow.parentNode.removeChild(drow);
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

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/roles/roles.blade.php ENDPATH**/ ?>