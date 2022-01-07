<?php $__env->startSection('title','إضافة تذكرة'); ?>

<?php $__env->startSection('maincontent'); ?>
    <div class="content-wrapper" >
        <div class="pagecontainer">
          <input type="hidden" id="token" value="<?php echo e(csrf_token()); ?>">
             <input type="hidden" value="<?php echo e($ticket->id); ?>" name="ticket_id">
                <?php if($errors->any()): ?>
                    <div class="alert alert-danger">
                        <ul>
                            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                <li><?php echo e($error); ?></li>
                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        </ul>
                    </div>
                <?php endif; ?>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="title">عنوان التذكرة</label>
                            <input type="text" id="title" name="title" class="form-control" value=" <?php echo e($ticket->title); ?> " autofocus autocomplete="name"/>
                            

                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="price">نوع التذكرة</label>
                            <select class="form-control" name="ticket_type">
                                <option value="0">إختر نوع التذكرة</option>
                                <?php $__currentLoopData = $ticket_type; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $type): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($type->id); ?>" <?php if($ticket->type==$type->id): ?> selected <?php endif; ?>     ><?php echo e($type->type); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>

                        </div>
                    </div>





                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="status">حالة التذكرة </label>
                            <select id="status" name="status" class="form-control">
                                <?php $__currentLoopData = $ticket_status; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $status): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($status->id); ?>" <?php if($status->id==$ticket->status): ?> selected <?php endif; ?> ><?php echo e($status->ticket_status); ?></option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="project">المشروع </label>
                            <select id="project" name="project" class="form-control">
                                <option value="0" >مشروع جديد</option>
                                <?php $__currentLoopData = $projects; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $project): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <option value="<?php echo e($project->id); ?>" <?php if($project->id==$ticket->project_id): ?> selected <?php endif; ?>     >
                                        <?php echo e($project->name); ?>-
                                        <span style="display: block;color: #FFFFFF;background-color: #ee3148"><?php echo e($project->project_status); ?></span>
                                    </option>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>تفاصيل التذكرة </label>
                            <textarea class="form-control" name="notes" id="notes" ><?php echo e(old('notes')); ?></textarea>


                        </div>

                    </div>
                    <div class="col-lg-12">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <table class="table myGridClass table-hover ">
                            <thead>
                            <tr>
                                <th>Name</th>
                                <th>ticket_id</th>
                                <th>action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php $__currentLoopData = $clients; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $client): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <tr>
                                <td><?php echo e($client->name); ?></td>
                                <td><?php echo e($client->id); ?></td>
                                <td>
                                   <?php if($ticket->id ==$client->ticket_id): ?>
                                       <button class="btn btn-danger" onclick="addtoclient(<?php echo e($client->id,$ticket->id); ?>)" >Delete</button>
                                    <?php else: ?>
                                       <button type="button" class="btn btn-primary" onclick="addtoclient(<?php echo e($client->id,$ticket->id); ?>)" >add</button>
                                       <?php endif; ?>
                                </td>
                            </tr>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

                            </tbody>
                        </table>

                    </div>
                </div>





        </div>
    </div>


    <div class="modal fade brands_modal" tabindex="-1" role="dialog"
         aria-labelledby="gridSystemModalLabel">
    </div>

<?php $__env->stopSection(); ?>

<?php $__env->startSection('javascript'); ?>
    <script>

        function addtoclient(client_id,ticket_id) {
            var token=$('#token').val();

            $.ajax({
                type: 'POST',
                url: '/addtoclient',
                data: {
                    _token:token
                    ,client_id:client_id
                    ,ticket_id:ticket_id
                },
                success: function(result) {
                       alert('Ticket add to client'+result);

                },
            });
        }




    </script>


<?php $__env->stopSection(); ?>

<?php echo $__env->make('layouts.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laragon\www\azha-support\local\resources\views/tickets/addtoclient.blade.php ENDPATH**/ ?>