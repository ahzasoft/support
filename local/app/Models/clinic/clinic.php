<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class clinic extends Model
{
    use HasFactory;
    protected $fillable=['code','type','status','address','notes','telephon1','telephon2','logo','busines_id'];

    public function getallclinics(){
        $busines_id=auth()->user()->business_id;

        $data=clinic::where('busines_id',$busines_id)->get();
        return $data;
    }

    public function getclinic($clinicid){

          $c=new clinic();

        $clinic=$c->select('clinics.*','clinic_types.type as types')
                ->leftjoin('clinic_types','clinics.type','=','clinic_types.id')
                ->where('clinics.id','=',$clinicid)->find(40);
        return $clinic;
    }

}
