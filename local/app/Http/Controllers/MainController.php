<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use App\models\User;
use App\models\business;
use App\Models\clinic\clinic;
use Illuminate\Support\Facades\DB;

class MainController extends Controller
{

   public function index(Request $request)
   {

       //$data=$clinics->getallclinics();
       $busines_id=auth()->user()->business_id;


       return view('test',['busines_name'=>'test']);


   }

   public function test(Request $request){
       $user=auth()->user();


       /*
       * check if user is admin $user->hasRole('Admin')
       */
       $busines=business::where('id','=',$user->busines_id)->first();


       if($busines->is_active==0)
           return ('your Busines is not active');


       /*
       * User Status   0-New  1-active 2-blocked  3-deleted
       */
       if($user->status==2)
           return ('your account is not blocked');


       if($user->status==3)
           return ('your account is deleted');


       /* save session data */
       session(['busines_id'   => $user->busines_id]);
       session(['busines_name' => $busines->name]);
       /* Get data from Session */
       $busines_name = $request->session()->get('busines_name');
       if($user->hasRole('admin'))
           return view('clinic.index',['busines_name'=>$busines_name]);

       return ('your account is deleted');
   }
}
