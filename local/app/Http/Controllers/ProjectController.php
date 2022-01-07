<?php

namespace App\Http\Controllers;

use App\Models\clientproject;
use App\Models\Project_status;
use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Projects;

class ProjectController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $projects=Projects::select('projects.*','users.name as responsible','project_statuses.project_status')
        ->join('users','projects.responsible','=','users.id')
            ->join('project_statuses','projects.status','=','project_statuses.id')
        ->get();
        return view('projects.index',['projects'=>$projects]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $project=new Projects();
        $project_status=Project_status::get();
        $users=User::get();
        return view('projects.create',['project'=>$project,'project_status'=>$project_status,'users'=>$users]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data=Projects::create([
            'name'=>$request->name,
            'status'=>$request->status,
            'responsible'=>$request->responsble,
            'owner'=>$request->owner,
            'notes'=>$request->notes
        ]);
        return redirect('/project');
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
        $project=Projects::findorfail($id);
        $project_status=Project_status::get();
        $users=User::get();
        return view('projects.create',['project'=>$project,'project_status'=>$project_status,'users'=>$users]);

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
        $data=Projects::findorfail($id);
        $data->name=$request->name;
            $data->status=$request->status;
            $data->responsible=$request->responsble;
            $data->owner=$request->owner;
            $data->notes=$request->notes;
            $data->save();
        return redirect('/project');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }


    public function clientproject(Request $request){

        // get client data
        $client=User::findorfail($request->id);
        //Get client with project

        $data=clientproject::select('projects.*','clientprojects.startdate','clientprojects.enddate','project_statuses.project_status')
            ->join('projects','clientprojects.project_id','projects.id')
           ->join('project_statuses','clientprojects.project_status','=','project_statuses.id')
            -> where('user_id','=',$request->id)
            ->get()  ;

        return view('clientes.clientproject',['data'=>$data,'client'=>$client]) ;
    }

    public function projects(Request $request){

        return 'add project to client'.$request->id;
    }
}
