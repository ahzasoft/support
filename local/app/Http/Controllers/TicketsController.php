<?php

namespace App\Http\Controllers;

use App\Models\Projects;
use App\Models\ticket;
use App\Models\ticket_archive;
use App\Models\ticket_status;
use App\Models\ticket_type;
use App\Models\User;
use Illuminate\Http\Request;

class TicketsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query=ticket::select('tickets.*','users.name as name','users.mobile','users.email','ticket_statuses.ticket_status')
                      ->join('users','tickets.user_id','=','users.id')
            ->join('ticket_statuses','tickets.status','=','ticket_statuses.id');

        /*dd(auth()->user()->roles->toArray());*/
        $tickets=$query->get();
        return view('tickets.index',['tickets'=>$tickets]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $ticket_type=ticket_type::get();
        $ticket_status=ticket_status::get();
        $projects=Projects::select('projects.*','project_statuses.project_status')
                            ->join('project_statuses','projects.status','project_statuses.id')
                            ->get();

        $ticket=new ticket();
       return view('tickets.create',['ticket_type'=>$ticket_type,'ticket_status'=>$ticket_status,'projects'=>$projects,'ticket'=>$ticket]);
    }

    public function managment($id){
        $ticket_type=ticket_type::get();
        $ticket_status=ticket_status::get();
        $projects=Projects::select('projects.*','project_statuses.project_status')
            ->join('project_statuses','projects.status','project_statuses.id')
            ->get();
        /* $ticket=new ticket();*/
        $ticket=ticket::findorfail($id);

        //dd($ticket);
              return view('tickets.create',['ticket'=>$ticket,'ticket_type'=>$ticket_type,'ticket_status'=>$ticket_status,'projects'=>$projects]);

    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
                        'title' => 'required|max:255',
                        'notes' => 'required|min:10',
                        'ticket_type'=>'required',
                      ],
            [
                'title.required'=>'عفوا برجاء إدخال عنوان التذكرة',
                'notes.required'=>'عفوا برجاء إدخال تفاصيل عن التذكرة',
                'notes.min'=>'برجاء إضافة المزيد من التفاصيل'
            ]);


    if($request->ticket_id)
        $tecket=ticket::findorfail($request->ticket_id);
    else
        $ticket=new ticket();
            $ticket->project_id=$request->project;
            $ticket->title=$request->title;
            $ticket->user_id=auth()->user()->id;
            $ticket->client_id=auth()->user()->id;
            $ticket->type=$request->ticket_type;
            $ticket->status=$request->status;
            $ticket->notes=$request->notes;

           $ticket->save();


        return redirect('/tickets');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
      $data=ticket::select('tickets.*','users.name as username','ticket_statuses.ticket_status')
          ->join('users','tickets.client_id','=','users.id')
          ->join('ticket_statuses','tickets.status','=','ticket_statuses.id')
          ->where('tickets.id',$id)
          ->first();

      $archive=ticket_archive::select('ticket_archives.*','users.name as username')-> where('tiket_id','=',$id)
          ->join('users','ticket_archives.user_id','=','users.id')
          ->get();

     return view('tickets.ticket_view',['data'=>$data,'archive'=>$archive]);
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

        if($request->id==0)
            $ticket=new ticket_archive();
        else
            $ticket=ticket_archive::findorfail($request->id);

        $ticket->tiket_id=$request->ticket_id;
        $ticket->notes=$request->notes;
        $ticket->user_id=auth()->user()->id;
        $ticket->save();

        $result=[
                 'success'=>true,
                  'mesg'=>'تم حفظ البيانات بنجاح',
                  'rec_id'=>$ticket->id
                 ];
       return $result;
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


    public function deletearchive(Request $request){

        $data=ticket_archive::findorfail($request->id)->delete();
        $result=[
            'success'=>true,
            'masseg'=>'تم حذف البيانات بنجاح',
            'rec_id'=>$request->id
        ];
        return $result;
    }

    public function addtoclient($id){

        $ticket_type=ticket_type::get();
        $ticket_status=ticket_status::get();
        $projects=Projects::select('projects.*','project_statuses.project_status')
            ->join('project_statuses','projects.status','project_statuses.id')
            ->get();
        /* $ticket=new ticket();*/
        $ticket=ticket::findorfail($id);

        $clients=User::select('users.name','users.id','client_tickets.ticket_id as ticket_id')
                       ->leftjoin('client_tickets','users.id','=','client_tickets.client_id')

                       ->get();



        return view('tickets.addtoclient',['ticket'=>$ticket,'ticket_type'=>$ticket_type,'ticket_status'=>$ticket_status,'projects'=>$projects,'clients'=>$clients]);
    }

    public function savetickettoclient(Request $request){


        return  'thi is add'.$request->client_id;
    }
}
