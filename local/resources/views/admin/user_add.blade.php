@extends('layouts.main')

@section('title','إضافة مستخدم')

@section('maincontent')
    <div class="content-wrapper">
        <div class="pagecontainer">
            <div>
                <form method="POST" action="{{'/users' }}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" value="{{$user->id}}" name="userid">
                    <div class="form-group">
                        <label for="name">إسم المستخدم</label>
                        <input type="text" id="name" name="name" class="form-control" value="{{$user->name}}"
                               required autofocus autocomplete="name"/>
                        <small class="text-danger">{{ $errors->first('name') }}</small>
                    </div>

                    <div class="form-group">
                        <label for="price">رقم الموبيل(سوف يكون إسم المستخدم)</label>
                        <input type="text" id="mobile" name="mobile" class="form-control integr"
                               value="{{$user->mobile}}"/>
                        <small class="text-danger">{{ $errors->first('mobile') }}</small>
                    </div>


                    <div class="form-group">
                        <label for="password">كلمة المرور</label>
                        <input type="password" name="password" class="form-control"
                                @if(!$user->id) required  @endif   value="" autocomplete="new-password" />
                        <small class="text-danger">{{ $errors->first('password') }}</small>
                    </div>



                    <div class="form-group">
                        <label for="sessions">ايميل</label>
                        <input type="text" name="email" class="form-control "
                              value="{{$user->email}}"/>
                        <small class="text-danger">{{ $errors->first('email') }}</small>
                    </div>

                    <div class="form-group">
                        <label for="sessions">العنوان </label>
                        <input type="text" name="address" class="form-control "
                               value="{{$user->address}}"/>
                        <small class="text-danger">{{ $errors->first('address') }}</small>
                    </div>

                    <div class="form-group">
                        <label for="status">حالة المستخدم </label>
                        <select id="status" name="status" class="form-control">
                            <option value="0" @if($user->status==0) selected @endif>غير نشط</option>
                            <option value="1"  @if($user->status==1) selected @endif > نشط</option>
                        </select>
                    </div>

                    <div style="padding: 10px 10px 25px 10px" >
                        <label >الصلاحيات </label>

                        <select id="role" name="role" class="form-control" >
                            <option value="0">بدون صلاحية</option>
                            @foreach($roles as $role)
                                <option value="{{$role->id}}" @if($user->hasrole($role->name)) selected @endif    >{{$role->name}}</option>
                            @endforeach

                        </select>

                    </div>
                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">
                    </div>
                </form>
            </div>
        </div>

    </div>
@endsection

@section('javascript')

@endsection
