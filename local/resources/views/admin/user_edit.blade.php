@extends('layouts.main')

@section('title','تعديل ')

@section('maincontent')
    <div class="content-wrapper" >
        <div class="pagecontainer">
            <div>
                <form method="POST" action="{{url('roles')}}" enctype="multipart/form-data">
                    @csrf
                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif



                    <div class="row">
                        <div class="col-md-3">
                            <label>صلاحيات مستخدم </label>
                        </div>
                    </div>

                {{--Permission row 1--}}
                    <!-- Users  -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="20">
                                    <span class="ml-2 text-sm text-gray-600">المستخدم (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox"  class="form-checkbox input-icheck" name="permissions[]"
                                               value="user.add" @if(in_array('user.add',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة مستخدم جديد</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="user.edit"  @if(in_array('user.edit',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل بيانات مستخدم</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="user.delete"  @if(in_array('user.delete',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف بيانات مستخدم</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <!--Roles  2 -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="30">
                                    <span class="ml-2 text-sm text-gray-600">الصلاحيات (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.view1"  @if(in_array('role.view1',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">صلاحية 1</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.add1"  @if(in_array('role.add1',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.edit1"  @if(in_array('role.edit1',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل صلاحية</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete1"  @if(in_array('role.delete1',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>

                    <!--Roles  3 -->
                    <!--Template -->
                    <div class="row check_group">
                        <div class="col-md-3">
                            <div class="block">
                                <label class="flex items-center">
                                    <input type="checkbox" class="check_all  form-checkbox" name="remember" value="40">
                                    <span class="ml-2 text-sm text-gray-600">الصلاحيات (الكل)</span>
                                </label>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.view"  @if(in_array('role.view',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">عرض الصلاحيات</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="form-checkbox input-icheck" name="permissions[]"
                                               value="role.add"  @if(in_array('role.add',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">إضافة صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.edit"  @if(in_array('role.edit',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">تعديل صلاحية</span>
                                    </label>
                                </div>
                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" @if(in_array('role.delete',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" @if(in_array('role.delete',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" @if(in_array('role.delete',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>

                                <div class="col-md-6">
                                    <label class="flex items-center">
                                        <input type="checkbox" class="  form-checkbox input-icheck" name="permissions[]"
                                               value="role.delete" @if(in_array('role.delete',$permissions)) checked @endif>
                                        <span class="ml-2 text-sm text-gray-600 ">حذف صلاحية</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <hr>



                    <div style="margin: auto;width: 100%;text-align: center">
                        <input type="submit" value="حفظ" class="btn-save " style="width: 70%;text-align: center">

                    </div>
                </form>
            </div>
        </div>
    </div>

@endsection

@section('javascript')
    <script>








    </script>


@endsection
