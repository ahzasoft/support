<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Diagnosis extends Model
{
    use HasFactory;
    protected $table='diagnosis';
    protected $guarded =[];

    public function patientdiagnosis($patientid){
        $data=Diagnosis::select('diagnosis.*','patients.name as patientname','doctors.name as doctorsname')
            ->leftjoin('patients','diagnosis.patient_id','=','patients.id')
            ->leftjoin('doctors','diagnosis.doctor_id','=','doctors.id')
            ->where('patient_id','=',$patientid)
            ->orderBy('date', 'desc')
            ->get();
        return $data;
    }
}
