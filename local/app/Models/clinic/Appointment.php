<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class Appointment extends Model
{
    use HasFactory;
    protected $guarded =[];


    public function getappointmentstatus(){

        $data=DB::table('appointment_status')->get();
        return $data;
    }

    public function getappointments($clinic=0,$patient=0,$doctor=0,$datefrom=NULL,$datato=NULL,$status=0,$patient_id=0,$source=1,$order='asc'){

           $data=Appointment::select('patients.name as patient'
                                    ,'patients.id as patient_id'
                                    ,'patients.attention as attention'
                                    ,'appointments.id as id'
                                    ,'appointments.status as statusid'
                                    ,'appointments.price as price'
                                    ,'appointments.Paid_val as Paid_val'
                                    ,'appointments.rem_val as rem_val'
                                    ,'appointments.appoint_date as appoint_date'
                                    ,'appointments.appoint_houre as appoint_houre'
                                    ,'appointments.appoint_time as appoint_time'
                                    ,'appointment_status.appointstatus  as status'
                                    ,'actions.name as action'
                                    ,'doctors.name as doctor'
                                    ,'clinics.code as clinic'
                                    ,'users.name as user'
                                  )
                        ->leftjoin('patients','appointments.patient_id','=','patients.id')
                        ->leftjoin('appointment_status','appointments.status','=','appointment_status.id')
                        ->leftjoin('actions','appointments.action_id','=','actions.id')
                        ->leftjoin('doctors','appointments.doctor_id','=','doctors.id')
                        ->leftjoin('clinics','appointments.clinic_id','=','clinics.id')
                        ->leftjoin('users','appointments.user_id','=','users.id')
                       ->where(function ($query) use ($clinic,$patient,$doctor,$datefrom,$datato,$status,$patient_id,$source){
                           $query->where('appointments.busines_id','=',auth()->user()->business_id);
                           if($clinic>0)
                              $query->where('appointments.clinic_id','=',$clinic);
                           if($patient>0)
                               $query->where('appointments.patient_id','=',$patient);
                           if($doctor>0)
                               $query->where('appointments.doctor_id','=',$doctor);
                           if($status>0)
                               $query->where('appointments.status','=',$status);
                           if($status>0)
                               $query->where('appointments.source','=',$source);
                          if($datefrom && $datato)
                               $query->whereBetween('appointments.appoint_date',[$datefrom,$datato]);


                       })
                        ->orderby('appointments.id', $order)
                        ->get();




              return ($data);
    }




}
