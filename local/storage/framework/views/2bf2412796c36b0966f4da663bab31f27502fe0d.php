<?php $__env->startSection('title','التذاكر'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer" style="max-width: 100%">
            <div style="display: inline-block;" >
                <a href="<?php echo e(url('/tickets/create')); ?>" class="btn btn-primary ">  <i class="fa fa-plus"> </i> إضافة تذكرة </a>
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
                  <th>إسم العميل</th>
                  <th>رقم الموبيل</th>
                  <th>إيميل</th>
                  <th>التذكرة</th>
                  <th>تاريخ التسجيل</th>
                  <th>تاريخ التعديل</th>
                  <th>حالة التذكرة</th>
                  <th>خيارات</th>
              </tr>
              </thead>
              <tbody>
              <?php $pos=1; ?>
              <?php $__currentLoopData = $tickets; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $ticket): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                  <tr id="<?php echo e($ticket->id); ?>">
                      <td><?php echo e($loop->iteration); ?> </td>
                      <td>                     <?php echo e($ticket->name); ?>                      </td>
                      <td><?php echo e($ticket->mobile); ?></td>
                      <td><?php echo e($ticket->email); ?></td>
                      <td><?php echo e($ticket->title); ?></td>
                      <td><?php echo e($ticket->created_at); ?></td>
                      <td><?php echo e($ticket->updated_at); ?></td>
                      <td><?php echo e($ticket->ticket_status); ?> </td>

                       <td>
                           <div class="dropdown show">
                               <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                   الإجراء
                               </a>

                               <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                   <a class="dropdown-item" href="/tickets/<?php echo e($ticket->id); ?>/edit"><i class="fas fa-eye"></i> عرض </a>
                                   <a class="dropdown-item" href="<?php echo e(url('/tickets/managment',$ticket->id)); ?>" ><i class="fas fa-edit"></i> تعديل </a>
                                   <a class="dropdown-item" href="<?php echo e(action('TicketsController@addtoclient',$ticket->id)); ?>" ><i class="fas fa-user"></i> إضافة عميل </a>
                                   <button class="dropdown-item btn btn-danger"   onclick="deleteConfirm(<?php echo e($ticket->id); ?>)" ><i class="fas fa-trash-alt"></i>  حذف </button>

                               </div>
                           </div>
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
            message     : "هل أنت متأكد من حذف العميل ؟",
            speed       : 500
        }).done(function() {

            var _token = $("input[name='_token']").val();
            $.ajax({
                url: "<?php echo e(url('clients/1')); ?>",
                type:'DELETE',
                data: {
                    _token:_token
                    ,userid:row

                },
                success: function(result) {

                    if(result['success']==true) {
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

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/tickets/index.blade.php ENDPATH**/ ?>