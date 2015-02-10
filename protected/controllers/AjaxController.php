<?php

class AjaxController extends Controller
{
    
    public function actionLoadForm(){
        
        $form_model = new DataCentrForm();
        
        $this->renderPartial('_data_settings',array('form_model' => $form_model));
        Yii::app()->end();
    }
    
    
    public function actionSavedata(){
        $request = Yii::app()->request;
        $userId = Yii::app()->user->id;
        
        if($request->isAjaxRequest){
            
            $form_model = new DataCentrForm();
            $form_model->attributes = $_POST['DataCentrForm'];
            if($form_model->validate()){
                $objDc = new Datacentres();
                $objDc->ip_address = $form_model->ip;
                $objDc->datacenter_name = $form_model->name;
                if($objDc->save()){
                    $objUserDc = new DcUser();
                    $objUserDc->user_id = $userId;
                    $objUserDc->dc_id = $objDc->id;
                    if($objUserDc->save()){
                        $this->renderPartial('_data_succ',array('name'=> $form_model->name, 'ip' => $form_model->ip));
                        Yii::app()->end();
                    }else{
                        Debug::d($objUserDc);
                    }
                }else{
                    
                }
                
                
            }else{
                $this->renderPartial('_data_settings',array('form_model'=>$form_model));
            }
            
        }else{
            
            //exception
        }
    }    
    
}//end:class    