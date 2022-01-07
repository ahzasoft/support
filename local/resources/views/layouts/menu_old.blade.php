<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    {{--<a href="../../index3.html" class="brand-link">
        <img src="../../dist/img/AdminLTELogo.png"
             alt="AdminLTE Logo"
             class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">AZHA Soft</span>
    </a>--}}

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="image">
                    <img src="{{asset('assets/dist/img/user.png')}}" class="img-circle elevation-2" alt="User Image">
                </div>
                <div class="info">
                      <a  href="http://laravel_auth.local/user/profile" class="d-block"> {{auth()->user()->name}}</a>
                </div>
            </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">


                <li class="nav-item has-treeview @if(in_array($currentpath,$users)) menu-open @endif">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                           إدارة المستخدمين
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item2 @if(strpos($currentpath,'users') !== false) menu-select @endif">
                            <a href="{{url('/users')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>المستخدمين</p>
                            </a>
                        </li>

                        <li class="nav-item2 @if(strpos($currentpath,'roles') !== false) menu-select @endif">
                            <a href="{{url('/roles')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>الصلاحيات</p>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item has-treeview @if(in_array($currentpath,$setting)) menu-open @endif">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            إعدادات
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item2  @if(strpos($currentpath,'clinic') !== false) menu-select @endif" >
                            <a href="{{ url('/clinic') }}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                   <p>العيادات</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(strpos($currentpath,'doctors') !== false) menu-select @endif">
                            <a href="{{url('/doctors')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                     <p>الأطباء</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(strpos($currentpath,'actions') !== false) menu-select @endif">
                            <a href="{{url('/actions')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>الإجراءات</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(strpos($currentpath,'dosages') !== false) menu-select @endif">
                            <a href="{{url('/dosages')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                   <p>الجرعات</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(strpos($routename,'prescriptionseting') !== false) menu-select @endif">
                            <a href="{{url('/prescriptionseting')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>الروشتة</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(strpos($routename,'contracts') !== false) menu-select @endif">
                            <a href="{{url('/contracts')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                  <p>التعاقدات</p>
                            </a>
                        </li>

                        <li class="nav-item2 @if(strpos($routename,'contractprice') !== false) menu-select @endif">
                            <a href="{{url('/contracts/price')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>أسعار التعاقدات</p>
                            </a>
                        </li>

                        <li class="nav-item2 @if(strpos($currentpath,'expenses-cat') !== false) menu-select @endif">
                            <a href="{{url('/expenses-cat')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                 <p>فئات المصروفات</p>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item has-treeview @if(in_array($currentpath,$patient)) menu-open @endif">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                          المرضي
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item2 @if(Request::route()->getName()=='patients') menu-select @endif ">
                            <a href="{{route('patients')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>المرضي</p>
                            </a>
                        </li>
                        <li class="nav-item2">
                            <a href="{{route('newpatients')}}" class="nav-link">
                                 <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>إضافة مريض</p>
                            </a>
                        </li>
                        <li class="nav-item2">
                            <a href="../layout/fixed-sidebar.html" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>حسابات المرضي</p>
                            </a>
                        </li>
                        <li class="nav-item2">
                            <a href="../layout/fixed-topnav.html" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>سجلات المرضي</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item has-treeview @if(in_array($currentpath,$appointment)) menu-open @endif">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                         الحجوزات
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item2 @if(Request::route()->getName()=='newappointment') menu-select @endif ">
                            <a href="{{route('newappointment')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>تسجيل حجز</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(Request::route()->getName()=='appointment') menu-select @endif ">
                            <a href="{{route('appointment')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>اليومية</p>
                            </a>
                        </li>

                    </ul>
                </li>
                <li class="nav-item has-treeview @if(in_array($currentpath,$examin)) menu-open @endif">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-copy"></i>
                        <p>
                           الطبيب
                            <i class="fas fa-angle-left right"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item2 @if(in_array(Request::route()->getName(),['examin.add','examin']))  menu-select @endif ">
                            <a href="{{route('examin')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>الكشف</p>
                            </a>
                        </li>
                        <li class="nav-item2 @if(Request::route()->getName()=='appointment') menu-select @endif ">
                            <a href="{{route('appointment')}}" class="nav-link">
                                <i class="fas fa-arrow-alt-circle-left  nav-icon"></i>
                                <p>الأدوية</p>
                            </a>
                        </li>

                    </ul>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
