<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class action extends Model
{
    use HasFactory;
    protected $guarded =[];

    public function GetactionbyClinic($clinic_id){
          return action::where('clinic_id','=', $clinic_id)->where('status',1)->get();
    }

    public function ListactionbyClinic($clinic_id){
        $data=action::where('clinic_id','=', $clinic_id)->get();
        $output='';
        foreach ($data as $row){
            $output .='<option value="'.$row->id.'">'.$row->name.'</option>';
        }
        return $output;
    }


    public function GetactionPrice($request){
        $data=action::where('id','=',$request->actionid)->first();
        $output=[];
        $price=$data->price;
        $data=contract_action::where('contract_id',$request->contractid)
                             ->where('action_id',$request->actionid)->first();
        if(isset($data->action_id)){
            $output=[
                'price'=>$price,
                'contract_val'=>$data->contract_val,
                'patient_val'=>$data->patient_val
                    ];
        }else{
            $output=[
                'price'=>$price,
                'contract_val'=>0,
                'patient_val'=>$price
                ];
        }



        return $output;
    }

    public function getcontractaction($contractid=0,$actionid=0,$clinicid=0){

        $data=action::join('clinics', 'actions.clinic_id', '=', 'clinics.id')
                    ->leftjoin('contract_actions', 'actions.id', '=', 'contract_actions.action_id')
                    ->get();
        return $data;

    }


    public function updateactionprice($actionid,$price){
        $action=action::find($actionid);
        $action->price =$price;
        $action->save();

    }

    public function getactions_busines($busines_id){
        return action::where('busines_id','=',$busines_id)->where('status',1)->get();
    }

}
