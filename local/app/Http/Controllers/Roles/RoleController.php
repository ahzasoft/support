<?php

namespace App\Http\Controllers\Roles;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;


class RoleController extends Controller
{
    public function index(){
      /*if(!auth()->user()->can('roles.view')){
          abort(403, 'Unauthorized action.');
         }*/
       $roles = Role::where('busines_id','=',auth()->user()->business_id)->get();
        return view('roles.roles',['roles'=>$roles]);
    }

    public function show(){
        $role =new Role();
        $role_permissions = [];
        return view('roles.roles_edit',['role'=>$role,'permissions'=>$role_permissions]);

    }

    public function create(){
        return view('roles.role_test',['myname'=>'Mohamed ali']);
    }


    public function edit($id){
      /*if (!auth()->user()->can('roles.edit')) {
            abort(403, 'Unauthorized action.');
        }*/
        $role = Role::with(['permissions'])
            ->find($id);

        $role_permissions = [];
        foreach ($role->permissions as $role_perm) {
            $role_permissions[] = $role_perm->name;
        }
        return view('roles.roles_edit',['role'=>$role,'permissions'=>$role_permissions]);

    }


    public function store(Request $request){
       /*if (!auth()->user()->can('roles.create')) {
            abort(403, 'Unauthorized action.');
        }*/

        $permission=$request->input('permissions');

       if(!empty($permission))
            $this->__createPermissionIfNotExists($permission);


        if(isset($request->roleid))
        {
            $roleid=$request->roleid;
            $role_name = $request->input('name');
            $data=$request->validate([

                'name'=> ['required', 'string', 'max:255','min:3',Rule::unique('roles')->ignore($roleid)-> where('busines_id',auth()->user()->business_id)] ,

            ],
                [
                    'name.unique'=>'عفوا الصلاحية موجودة قبل ذلك 1',
                    'name.required'=>'عفوا برجاء إدخال إسم الصلاحية'
                ]);

            $role = Role::findOrFail($roleid);
            $role->name =$role_name;
            $role->guard_name='web';
            $role->save();
            $role->syncPermissions($request->input('permissions'));
        }
        else {
            $role_name = $request->input('name');
            $data=$request->validate([
                'name'=> ['required', 'string', 'max:255','min:3',Rule::unique('roles')->where('busines_id',auth()->user()->business_id)],

            ],
                [
                    'name.unique'=>'عفوا الصلاحية موجودة قبل ذلك ',
                    'name.required'=>'عفوا برجاء إدخال إسم الصلاحية'
                ]);
            $role = Role::create([
                                   'name' => $request->input('name'),
                                   'guard_name'=>'web',
                                   'busines_id'=>auth()->user()->business_id,

                                         ]);

            $role->syncPermissions($request->input('permissions'));
        }
        return redirect('roles');
    }

    public function update(){
        return redirect('roles');
    }

    public function destroy(Request $request){

        DB::table("roles")->where('id',$request->roleid)->delete();
        return 'تم حذف الصلاحية بنجاح!';
    }

    private function __createPermissionIfNotExists($permissions)
    {
        $exising_permissions = Permission::whereIn('name', $permissions)
            ->pluck('name')
            ->toArray();

        $non_existing_permissions = array_diff($permissions, $exising_permissions);


        if (!empty($non_existing_permissions)) {
            foreach ($non_existing_permissions as $new_permission) {
               $time_stamp =Carbon::now()->toDateTimeString();
                Permission::create([
                    'name' => $new_permission,
                    'guard_name' => 'web'
                ]);
            }
        }

    }
}
