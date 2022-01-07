<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">

        <title> <?php echo $__env->yieldContent('titel'); ?></title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <!-- Styles -->
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/app.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/plugins/rtlcss/bootstrap.min.css')); ?>">

        <!-- Scripts -->

    </head>
    <body dir="rtl" style="background-color: #eeeeee">
    <div class="font-sans text-gray-900 antialiased">

    </div>
        <div class="font-sans text-gray-900 antialiased">
            <?php echo $__env->yieldContent('maincontent'); ?>
        </div>
        <div>

        </div>
    </body>
</html>
<?php /**PATH F:\laragon\www\azha-support\local\resources\views/layouts/guest.blade.php ENDPATH**/ ?>