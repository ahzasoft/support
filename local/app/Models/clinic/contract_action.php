<?php

namespace App\Models\clinic;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;


class contract_action extends Model
{
    use HasFactory;
    protected $guarded =[];

    public function getcontractaction($clinicid,$contractid){

            $actions=action::where('clinic_id','=',$clinicid)
                        ->get();

            $data='';
            foreach ($actions as $action){
                $data .='<tr>';
                $data .='<td>'. $action->id .'</td>';
                $data .='<td>'. $action->name .'</td>';
                $data .='<td><input type="text" value="'. $action->price .'" class="form-control decimal"  id="price_' .$action->id.'" readonly></td>';
                $data .='<td><input type="text" value="'. $this->getcontractprice($contractid,$action->id)['contract_val'] .'" class="form-control decimal"  id="contract_val_' .$action->id.'"></td>';
                $data .='<td><input type="text" value="'. $this->getcontractprice($contractid,$action->id)['patient_val'] .'" class="form-control decimal"  id="patient_val_' .$action->id.'"></td>';
                $data .='<td><button class="btn btn-primary"   onclick="save('. $action->id. ')" ><i class="fas fa-save"></i>  حفظ </button></td>';
                $data .='</tr>';
                   }


        return $data;

    }

    public function getcontractprice($contractid,$actionid){
        $contracts=DB::table('contract_actions')
                  ->where('action_id',$actionid)
                  ->where('contract_id',$contractid)
                  ->first();


        if(isset($contracts->action_id)){
                                        $data['patient_val']=$contracts->patient_val;
                                        $data['contract_val']=$contracts->contract_val;

                                       }
            else{
                $data['patient_val']=0;
                $data['contract_val']=0;
                }
            return  $data;

    }

    public function savecontractactionprice($request){

        contract_action::where('contract_id', $request->contract_id)->where('action_id' ,  $request->action_id)->delete();

       $row= contract_action::Create([
                                    'patient_val' => $request->patient_val,
                                    'contract_val' => $request->contract_val,
                                    'contract_id' => $request->contract_id,
                                    'action_id' =>  $request->action_id
                                   ]);

       $action=new action();
       $action->updateactionprice($request->action_id,$request->price);

         return 'تم حفظ أسعار التعاقد بنجاح';
    }
}
