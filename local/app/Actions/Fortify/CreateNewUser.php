<?php

namespace App\Actions\Fortify;

use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Laravel\Fortify\Contracts\CreatesNewUsers;
use App\Models\business;
use Carbon\Carbon;


class CreateNewUser implements CreatesNewUsers
{
    use PasswordValidationRules;

    /**
     * Validate and create a newly registered user.
     *
     * @param  array  $input
     * @return \App\Models\User
     */
    public function create(array $input)
    {
        Validator::make($input, [
            'name'   => ['required', 'string', 'max:255','min:5'],
            'mobile' => ['required', 'string', 'max:15', 'unique:users'],
            'email'  => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => 'min:6|required_with:password_confirmation|same:password_confirmation',

        ],
        [
            'name.min'  =>'عفوا الإسم يجب ألا يقل عن 10 حروف !',
            'mobile.unique' =>'عفوا رقم الموبيل مسجل بالفعل !',
            'email.unique' =>' عفوا الإميل مستخدم قبل ذلك ! ',
            'password.same' =>'كلمة المرور غير متطابقة !',
            'password.min'  =>' كلمة المرور يجب ألا تقل عن 6 أحرف'
        ]
       )->validate();

        $Busines=business::create([
            'name'         =>'New Pharmacy',
            'start_date'   =>Carbon::now()
        ]);

      $user= User::create([
            'name' => $input['name'],
            'mobile' => $input['mobile'],
            'email' => $input['email'],
            'password' => Hash::make($input['password']),
            'business_id' =>$Busines->id,
        ]);

        $user->assignRole('Super Admin');

        return ($user);
    }


}
