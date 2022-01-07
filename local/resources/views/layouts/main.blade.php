<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>@yield('title','azha')</title>



    <meta name="description" content=" إدارت العيادات من شركة أزهي جروب ">
    <meta name="author" content="أزهي جروب" >
    <meta name="keywords" content="برنامج أزهي فارم , أزهي فارم لإدارة الصيدليات ,
		مخازن , مخزون , مستودعات , حسابات , مشتريات , مبيعات , عملاء , موردين , عملاء وموردين , محلات ، إدارة محلات ،
		برنامج مخازن , برنامج حسابات , برنامج مستودعات , برنامج مشتريات , برنامج عملاء , برنامج موردين , برنامج عملاء وموردين , برنامج محلات , برنامج مخزون , إدارة مستودعات ،برنامج محلات ،برنامج مخازن مجانى ,
		برنامج المخازن , برنامج الحسابات , برنامج المستودعات , برنامج المشتريات , برنامج العملاء , برنامج الموردين , برنامج العملاء والموردين ، برنامج المحلات , برنامج المخزون , برنامج إدارة المستودعات ، برنامج المحلات ،برنامج للمخازن مجانى ,
		برنامج للمخازن , برنامج للحسابات , برنامج للمستودعات , برنامج للمشتريات , برنامج للعملاء , برنامج للموردين , برنامج للعملاء والموردين ، برنامج للمحلات , برنامج للمخزون , برنامج لإدارة المستودعات ، برنامج للمحلات ،
		برنامج عربى ,
		 pharmacy , drugs , ERP , store , customers , clients , suppliers , sales , stores , store , point of sale , pos , pos system , supermarket system ,
		" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="{{asset('assets/css/Aleart.css')}}" >
        <link rel="stylesheet" href="{{asset('assets/css/messagebox.css')}}" >

    <!-- bootstrap -->
    <link rel="stylesheet" href="{{asset('assets/plugins/bootstrap/css/bootstrap.min.css')}}">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/all.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/plugins/fontawesome-free/css/fontawesome.css')}}">

    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bbootstrap 4 -->
    {{--<link rel="stylesheet" href="{{ asset('assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css')}}">--}}


    <!-- Select drop down with search -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/selectdropdown/css/jquery-customselect-1.9.1.css')}}">

    <!-- Select 2 -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/select2/css/select2.min.css')}}">

    <!-- daterange picker -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/daterangepicker/daterangepicker.css')}}">
    <!-- iCheck -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css')}}">
    <!-- JQVMap -->
   {{-- <link rel="stylesheet" href="{{ asset('assets/plugins/jqvmap/jqvmap.min.css')}}">--}}
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/adminlte.min.css')}}">
    <!-- overlayScrollbars -->
   {{-- <link rel="stylesheet" href="{{ asset('assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css')}}">--}}
    <!-- Daterange picker -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/daterangepicker/daterangepicker.css')}}">

    <!-- summernote  editor -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/summernote/summernote-bs4.css')}}">
    <!-- Google Font: Source Sans Pro -->
   {{-- <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">--}}
    <link rel="stylesheet" href="{{ asset('assets/css/app.css')}}">

    <link rel="stylesheet" href="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.css')}}">
<!-- Bootstrap 4 RTL -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/rtlcss/bootstrap.min.css')}}">

    <!-- Custom style for RTL -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/custom.css')}}">

    <!--jquery  -->
    <link rel="stylesheet" href="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.css')}}">


   <!--My style -->
    <link rel="stylesheet" href="{{ asset('assets/css/site.css')}}">
</head>
<?php
$currenturl=explode('/',Request::path());
$currentpath=$currenturl[0];
$users=['users','roles'];
$setting=['clinic','doctors','actions','dosages','contracts','expenses-cat'];
$patient=['patients'];
$appointment=['appointment'];
$examin=['examin'];
$routename=request::route()->getName();

?>
<body class="hold-transition sidebar-mini ">
<div class="wrapper">

    <!-- Navbar -->
    @include('layouts.navebar')
    @include('layouts.menu')


    <div id="loading" style="display: none; width: 100%; height: 100%; margin: 0em;left: 0em; top: 0em;position: fixed;background: #605e5e4a;z-index: 999">
        <div class="loader"></div>
    </div>

@yield('maincontent')
    <footer class="main-footer">


        <div class="footer-bottom clearfix">

            <div class="row" style="margin: 0px;">
                <div class="col-lg-3 col-md-6 footer-links">
                    <div class="footer-top">
                        <div class="container">
                            <div class="social-links mt-3">
                                <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                                <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                                <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                                <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                                <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>



            <div class="copyright" style="color: #FFFFFF;text-align: left;">
                &copy; Copyright <strong><span>AZHASoft </span></strong>. All Rights Reserved
            </div>
        </div>

    </footer>

</div>

<div class="modal fade " tabindex="-1" role="dialog" id="pagemodal" ></div>
<a id="back2Top" title="Back to top" href="#">&#10148;</a>


<!-- jQuery -->
<script src="{{ asset('assets/plugins/jquery/jquery.min.js')}}"></script>
<!-- jQuery UI 1.11.4 -->
<script src="{{ asset('assets/plugins/jquery-ui/jquery-ui.min.js')}}"></script>

<script src="{{ asset('assets/plugins/popper/popper.js')}}"></script>

<script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.min.js')}}"></script>


<script src="{{asset('assets/css/Aleart.js')}}"></script>
<script src="{{asset('assets/css/messagebox.js')}}"></script>
    <!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
    <script>
        $.widget.bridge('uibutton', $.ui.button)
    </script>
    <!-- Bootstrap 4 rtl -->
    <script src="{{ asset('assets/plugins/rtlcss/bootstrap.min.js')}}"></script>
    <!-- Bootstrap 4 -->
    <script src="{{ asset('assets/plugins/bootstrap/js/bootstrap.bundle.min.js')}}"></script>

<script src="{{ asset('assets/js/bootstrap3-typeahead.min.js')}}"></script>
    <!-- Select drop down with search -->
    <script src="{{ asset('assets/plugins/selectdropdown/js/jquery-customselect-1.9.1.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.js')}}"></script>



<!--Select 2 form select -->
    <script src="{{ asset('assets/plugins/select2/js/select2.min.js')}}"></script>
        <!-- AdminLTE App -->
    <script src="{{ asset('assets/dist/js/adminlte.js')}}"></script>

    <!-- My java script     -->
   <script src="{{ asset('assets/js/site.js')}}"></script>



  @yield('javascript')

<script>
       var notifier = new AWN();
 </script>
</body>
</html>
