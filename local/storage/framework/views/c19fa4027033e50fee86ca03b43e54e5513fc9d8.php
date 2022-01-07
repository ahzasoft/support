<?php $__env->startSection('title','التذاكر'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer" style="max-width: 100%;background-color: #f4f0f0;">


           <input type="hidden" value="<?php echo e(csrf_token()); ?>" name="_token" id="_token">
           <input type="hidden" value="<?php echo e($data->id); ?>" name="ticket_id" id="ticket_id">

<div class="row">
    <div class="col-8">
        <div class="">
       <div class="row">
         <?php $__currentLoopData = $archive; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $data2): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
               <div class="col-12 mb-4">
                   <div class="ticket-nots">
                       <label>أضيفت بواسطة :<span><?php echo e($data2->username); ?></span></label>
                       <br>
                       <label>في :<span><?php echo e($data2->created_at); ?></span></label>
                       <input type="hidden" id="rec_<?php echo e($data2->id); ?>" value="<?php echo e($data2->id); ?>">
                       <textarea rows="10" class="form-control" name="notes_<?php echo e($data2->id); ?>" id="notes_<?php echo e($data2->id); ?>"><?php echo e($data2->notes); ?></textarea>
                       <div class="mt-4 text-left" style="width: 100%">
                           <button class="btn btn-primary" onclick="save(<?php echo e($data2->id); ?>)">حفظ</button>
                           <button class="btn btn-danger" onclick="deleteConfirm(<?php echo e($data2->id); ?>)">حذف</button>
                       </div>
                   </div>

               </div>

        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>


           <div class="col-12">
               <div class="ticket-nots">
                   <textarea class="form-control" name="notes_0" id="notes_0"></textarea>
                       <input type="hidden" id="rec_0" value="0">
                      <div class="mt-4 text-left" style="width: 100%">
                           <button class="btn btn-primary" onclick="save(0)">حفظ</button>
                           <button class="btn btn-danger" onclick="deleteConfirm(0)">حذف</button>
                       </div>
               </div>
           </div>
       </div>
        </div>
    </div>
    <div class="col-4">
        <div style="background-color: #fffefe;border: 1px solid #6E6E6E;border-radius: 10px;margin: 5px;padding: 5px">
            <div class="ticket-titel">
                <label>عنوان التذكرة : </label>
                <span><?php echo e($data->title); ?></span>
            </div>
            <div class="ticket-owner">
                <label>العميل : </label>
                <span><?php echo e($data->username); ?></span>
            </div>
            <div class="ticket-owner">
                <label>تاريخ الإضافة : </label>
                <span><?php echo e($data->created_at); ?></span>
            </div>
            <div class="ticket-owner">
                <label>أخر تعديل : </label>
                <span><?php echo e($data->updated_at); ?></span>
            </div>

            <div class="ticket-owner">
                <label>حالة التذكرة : </label>
                <span><?php echo e($data->ticket_status); ?></span>
            </div>
        </div>

    </div>

</div>








        </div>
    </div>
            <div class="modal fade " tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
            </div>

<?php $__env->stopSection(); ?>
    <?php $__env->startSection('javascript'); ?>
       <script>
           $(document).ready(function () {
              //do some thing
           });
        function deleteConfirm(row)
                    {
                        $.MessageBox({
                            buttonDone  : "Yes",
                            buttonFail  : "No",
                            message     : "هل أنت متأكد من حذف التذكرة ؟",
                            speed       : 500
                        }).done(function() {

                            var _token = $("input[name='_token']").val();
                            $.ajax({
                                url: "/deletearchive",
                                type:'GET',
                                data: {
                                    _token:_token
                                    ,id:row

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

     function save(id) {
         var notes=$('#notes_'+id).val();
         if(notes.trim()==''){
             alert('enter some data');
             return true;
         }

         var ticket_id=$('#ticket_id').val();
         var id=$('#rec_'+id).val();

         var _token=$('#_token').val();
         $.ajax({
             url: "/tickets/"+id,
             type:'PUT',
             data: {
                 _token:_token
                 ,ticket_id:ticket_id
                 ,id:id
                 ,notes:notes

             },
             success: function(result) {
                 if(result['success']){
                     alert(result['mesg']);
                     $('#rec_'+id).val(result['rec_id']);
                 }

                 else
                     alert('error');

             }


         });

     }


                </script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/tickets/ticket_view.blade.php ENDPATH**/ ?>