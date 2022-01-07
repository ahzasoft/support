<!DOCTYPE html>
<html >
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title> @yield('titel')</title>

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" integrity="sha384-gfdkjb5BdAXd+lj+gudLWI+BXq4IuLW5IT+brZEZsLFm++aCMlF1V92rMkPaX4PP" crossorigin="anonymous">
        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
        <link rel="stylesheet" href="{{ asset('assets/plugins/rtlcss/bootstrap.min.css') }}">

        <!-- Scripts -->

    </head>
    <body dir="rtl" style="background-color: #eeeeee">
    <div class="font-sans text-gray-900 antialiased">

    </div>
        <div class="font-sans text-gray-900 antialiased">
            @yield('maincontent')
        </div>
        <div>

        </div>
    </body>
</html>
