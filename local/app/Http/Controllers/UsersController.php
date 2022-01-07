<?php

namespace App\Http\Controllers;

use App\Models\Roles\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class UsersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users=User::with('roles')->get();

        return view('admin.index',['users'=>$users]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user=new User();
        $roles=Role::get();
        return view('admin.user_add',['user'=>$user,'roles'=>$roles]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
      // add new user to database
        $busines_id=auth()->user()->business_id;
        $userid=$request->userid;
      if(empty($userid)){
             $data=$request->validate([
                'name'    => ['required', 'string', 'max:255','min:3'],
                'mobile'  =>['required', 'max:15','min:11','unique:users'],
                'password' =>['min:3|required'],
                'email'  => ['required', 'string', 'email', 'max:255', 'unique:users'],
            ],
                [
                    'name.min'=>'عفوا يجب أدخال إسم المستخدم ',
                    'mobile.required' =>'عفوا يجب إدخال رقم التليفون ',
                    'mobile.unique' =>'رقم التليفون مستخدم قبل ذلك ',
                    'password.required' =>'عفوا  يجب أدخال كلمة المرور',
                    'password.min'  =>' كلمة المرور يجب ألا تقل عن 6 أحرف'

                ]);

            $user=user::create([
                'name'        =>$request->name,
                'business_id'  =>$busines_id,
                'mobile'      =>$request->mobile,
                'password'    => Hash::make($request['password']),
                'email'       =>$request->email,
                'status'      =>$request->status,
            ]);


        }

        else
        {
            $user=user::find($userid);
            $data=$request->validate([
                'name'    =>['required', 'string', 'max:255','min:3'],
                'mobile'  =>['required', 'max:15','min:11',Rule::unique('users')->ignore($user->id)],
                'email'   => ['required', 'string', 'email', 'max:255', Rule::unique('users')->ignore($user->id)],

            ],
                [
                    'name.min'=>'عفوا يجب أدخال إسم الإجراء ',
                    'mobile.required' =>'عفوا يجب إدخال رقم التليفون ',
                    'mobile.unique' =>'رقم التليفون مستخدم قبل ذلك ',
                    'mobile.min' =>'عفوا أدخل رقم صحيح',
                    'email' =>'الإيميل غير صحيح',
            ]);

            $user->name=$request->name;
            $user->mobile=$request->mobile;
            $user->email =$request->email;
            $user->status =$request->status;
            if(!empty($request['password']))
               $user->password    = Hash::make($request['password']);


        }
        $user->save();
        $user->roles()->detach();
        if($request->role>0)
          $user->assignRole($request->role);

          return redirect()->action('UsersController@index');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user=User::find($id);
        $roles=Role::get();
        return view('admin.user_add',['user'=>$user,'roles'=>$roles]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $request)
    {

        $currentusre=auth()->user()->id;

        if($currentusre==$request->userid){
            $result=[
                'success'=>false,
                'masseg'=>'عفوا لايمكن حذف المستخدم الحالي !!'
            ];
            return $result;
        }
      $user=User::find($request->userid);
      $user->roles()->detach();
      $user->delete();
      $result=[
                 'success'=>true,
            'masseg'=>'user : '. $user->name.' delete successfuly'
        ];
        return $result;
    }



}
