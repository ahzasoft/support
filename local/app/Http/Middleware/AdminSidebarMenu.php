<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Menu;

class AdminSidebarMenu
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->ajax()) {
            return $next($request);
        }

        Menu::create('admin-sidebar-menu', function ($menu) {

            $menu->dropdown('الإعدادات',
                function ($sub) {
                                    $sub->url(
                                        action('Roles\RoleController@index'),
                                       'الصلاحيات',
                                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'roles']
                                    );

                                    $sub->url(
                                        action('UsersController@index'),
                                        'المستخدمين',
                                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'users']
                                    );
                                 },
                ['icon' => 'nav-icon fas fa-copy'] )->order(10);

            $menu->dropdown('المشروعات',
                function ($sub) {
                    $sub->url(
                        action('ProjectController@index'),
                        'عرض المشروعات',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'projects']
                    );

                    $sub->url(
                        action('ProjectController@create'),
                        'إضافة مشروع',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'project' && request()->segment(2)=='create']
                    );

                    $sub->url(
                        action('MainController@index'),
                        'تخصيص',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon']
                    );

                },
                ['icon' => 'nav-icon fas fa-copy'] )->order(20);

            $menu->dropdown('العملاء',
                function ($sub) {
                    $sub->url(
                        action('ClientsController@index'),
                        'العملاء',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'projects']
                    );

                    $sub->url(
                        action('ProjectController@create'),
                        'مدفوعات العملاء',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'project' && request()->segment(2)=='create']
                    );

                    $sub->url(
                        action('ProjectController@clientproject'),
                        ' مشروعات العملاء',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon']
                    );

                    $sub->url(
                        action('MainController@index'),
                        'تقرير عميل',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon']
                    );

                },
                ['icon' => 'nav-icon fas fa-user'] )->order(30);

            $menu->dropdown('التذاكر',
                function ($sub){
                    $sub->url(
                        action('TicketsController@index'),
                        'عرض التذاكر',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'tickets']
                    );
                    $sub->url(
                        action('TicketsController@create'),
                        'إضافة تذكرة',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'tickets' && request()->segment(2)=='create']
                    );
                    $sub->url(
                        action('TicketsController@index'),
                        'الردود الجاهزة',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'projects']
                    );

                    $sub->url(
                        action('TicketsController@index'),
                        'تخصيص تذكرة',
                        ['icon' => 'fas fa-arrow-alt-circle-left  nav-icon','active' => request()->segment(1) == 'projects']
                    );

                },


                ['icon' => 'nav-icon fas fa fa-ambulance'] )->order(40);




        });

        return $next($request);
    }
}
