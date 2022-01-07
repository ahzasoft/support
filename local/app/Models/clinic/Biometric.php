<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Biometric extends Model
{
    use HasFactory;
    protected $guarded =[];


    public function patientBiometric($patientid){

        $data=Biometric::select('biometrics.*','patients.name as patientname','users.name as username')
            ->leftjoin('patients','biometrics.patient_id','=','patients.id')
            ->leftjoin('users','biometrics.user_id','=','users.id')
            ->where('patient_id','=',$patientid)
            ->orderBy('date', 'desc')
            ->get();
        return $data;

    }
}
