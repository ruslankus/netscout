<?php

class AjaxController extends Controller
{
    
    public function actionLoadForm(){
        
        $form_model = new DataCentrForm();
        
        $this->renderPartial('_data_settings',array('form_model' => $form_model));
        Yii::app()->end();
    }
    
    /**
     * @param int $id Int - Id Datacentr
     */
    public function actionLoadEditForm($id){
        $form_model = new DataCentrForm();
        $objDc = Datacentres::model()->findByPk($id);
        if(!empty($objDc)){
            $strIp = $objDc->ip_address;
            $arrIp = explode('.',$strIp);
            $this->renderPartial('_data_edit_settings',array('form_model' => $form_model,
            'arrIp' => $arrIp, 'name'=> $objDc->datacenter_name, 'dc_id' => $objDc->id));    
        }
        
    }//actionLoadEditForm
    
    
    public function actionSavedata(){
        $request = Yii::app()->request;
        $userId = Yii::app()->user->id;
        
        if($request->isAjaxRequest){
           
            $form_model = new DataCentrForm();
            $form_model->attributes = $_POST['DataCentrForm'];
            if($form_model->validate()){
                $objDc = new Datacentres();
                $objDc->ip_address = $form_model->full_ip;
                $objDc->datacenter_name = $form_model->name;
                if($objDc->save()){
                    $objUserDc = new DcUser();
                    $objUserDc->user_id = $userId;
                    $objUserDc->dc_id = $objDc->id;
                    if($objUserDc->save()){
                        $this->renderPartial('_data_succ',array('name'=> $form_model->name,
                         'ip' => $form_model->full_ip,'dc_id' => $objDc->id));
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
    }//actionSavedata
    
    
    public function actionSaveEditData($id){
        
        $request = Yii::app()->request;
        $userId = Yii::app()->user->id;
        $objDc = Datacentres::model()->findByPk((int)$id);
        
        if($request->isAjaxRequest){
            
            $form_model = new DataCentrForm();
            $form_model->attributes = $_POST['DataCentrForm'];
            
            if($form_model->validate()){
                $objDc->ip_address = $form_model->full_ip;
                $objDc->datacenter_name = $form_model->name;
                if($objDc->update()){
                     $this->renderPartial('_data_succ',array('name'=> $form_model->name,
                         'ip' => $form_model->full_ip,'dc_id' => $objDc->id));
                     Yii::app()->end();        
                }
            }else{
                $this->renderPartial('_data_edit_settings',array('form_model' => $form_model,'dc_id' => $objDc->id ));
            }//end: if($form_model->validate())
                
        }else{
            //exception
        }
        
        
    }//actionSaveEditData    
    
}//end:class    