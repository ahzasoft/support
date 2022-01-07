<?php

namespace App\Http\Controllers;
use App\Models\clinic\clinic;
use App\Models\payment;
use App\Models\product;
use App\Models\Roles\Role;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
class ClientsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // User type=3 only for clients
        $clients=User::where('type','=',3)->get();
        return view('clientes.index',['clients'=>$clients]);
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
        return view('clientes.create',['user'=>$user,'roles'=>$roles]);
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
                'mobile'  =>['required'],
                'password' =>['min:3|required'],
                'email'  => ['required', 'string', 'email', 'max:255'],

            ],
                [
                    'name.min'=>'عفوا يجب أدخال إسم العميل ',
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
                'type'        =>3,
            ]);


        }
        else
        {
            $user=user::find($userid);
            $data=$request->validate([
                'name'    => ['required', 'string', 'max:255','min:3'],
                'mobile'  =>['required', 'max:15','min:11'],
                'email'  => ['required', 'string', 'email'],

            ],
                [
                    'name.min'=>'عفوا يجب أدخال إسم العميل ',
                    'mobile.required' =>'عفوا يجب إدخال رقم التليفون ',
                    'mobile.unique' =>'رقم التليفون مستخدم قبل ذلك ',
                    'mobile.min' =>'عفوا أدخل رقم صحيح',
                    'email' =>'الإيميل غير صحيح',

                ]);


            $user->name=$request->name;
            $user->mobile=$request->mobile;
            $user->email =$request->email;
            $user->status =$request->status;


        }
        $user->save();
        $user->roles()->detach();
        if($request->role>0)
            $user->assignRole($request->role);

        return redirect()->action('ClientsController@index');

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
        return view('clientes.create',['user'=>$user,'roles'=>$roles]);
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
                'masseg'=>'عفوا لايمكن حذف العميل الحالي !!'
            ];
            return $result;
        }
        $user=User::find($request->userid);
        $user->roles()->detach();
        $user->delete();
        $result=[
            'success'=>true,
            'masseg'=>'Client : '. $user->name.' delete successfuly'
        ];
        return $result;
    }


    public  function payments(Request $request){

        $client=User::findorfail($request->id);

        $payments=payment::select('payments.*')-> where('payments.client_id',$request->id)
                          ->leftjoin('transactions','payments.transaction_id','=','transactions.id')
                          ->get();

        return view('clientes.payments',['client'=>$client,'payments'=>$payments]);
    }

    public function addpayment(Request $request){

        $client=User::findorfail($request->client_id);
        return view('clientes.partials.add_payment',['client'=>$client]);
    }

    public function savepayment(Request $request){
     $payment=payment::create([
            'transaction_id'=>0,
            'type'=>0,
            'value'=>$request->value,
            'client_id'=>$request->client_id,
            'notes'=>$request->notes,
            'user_id'=>\auth()->user()->id,
        ]);


    }
}
