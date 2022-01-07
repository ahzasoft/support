<?php

use Illuminate\Support\Facades\Route;





/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/clear-cache', function () {
    $exitCode = Artisan::call('cache:clear');
    $exitCode = Artisan::call('view:clear');
    $exitCode = Artisan::call('route:clear');
    $exitCode = Artisan::call('config:clear');
    echo 'DONE'; //Return anything
});


Route::middleware(['auth','AdminSidebarMenu'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');



Route::middleware(['auth','AdminSidebarMenu'])->get('/','MainController@index')->name('startup');
Route::middleware(['auth','AdminSidebarMenu'])->get('/startup','Maincontroller@index' )->name('startup');

/* users */
Route::middleware(['auth','AdminSidebarMenu'])->resource('/users','UsersController' );





/*
Route::middleware(['auth','AdminSidebarMenu'])->get('/users/add/{id?}','clinic\UsersController@addnew' )->name('newuser');
Route::middleware(['auth','AdminSidebarMenu'])->post('/users/add/{id?}','clinic\UsersController@store' )->name('saveuser');
Route::middleware(['auth','AdminSidebarMenu'])->post('/users/delete','clinic\UsersController@delete' )->name('deleteuser');
Route::middleware(['auth','AdminSidebarMenu'])->get('/users/edit/{id}','clinic\UsersController@edit' )->name('editauser');*/


/* Roles */
Route::middleware(['auth','AdminSidebarMenu'])->resource('/roles','Roles\RoleController' );
Route::middleware(['auth','AdminSidebarMenu'])->resource('/project','ProjectController' );

Route::middleware(['auth','AdminSidebarMenu'])->resource('/clients','ClientsController' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/client/payments/{id}','ClientsController@payments' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/client/addpayment','ClientsController@addpayment' );
Route::middleware(['auth','AdminSidebarMenu'])->post('/client/savepayment','ClientsController@savepayment' );

Route::middleware(['auth','AdminSidebarMenu'])->get('/client/clientproject','ProjectController@clientproject' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/client/asginproject','ProjectController@projects' );

/* Tickets section */
Route::middleware(['auth','AdminSidebarMenu'])->resource('/tickets','TicketsController' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/tickets/managment/{id}','TicketsController@managment' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/deletearchive','TicketsController@deletearchive' );
Route::middleware(['auth','AdminSidebarMenu'])->get('/addtoclient/{id}','TicketsController@addtoclient' );
Route::middleware(['auth','AdminSidebarMenu'])->post('/addtoclient','TicketsController@savetickettoclient' );







Route::get('/test/print','PrintController@index');
