<?php

class AjaxController extends Controller
{
    
    public function actionLoadForm(){
        
        $form_model = new DataCentrForm();
        
        $this->renderPartial('_data_settings',array('form_model' => $form_model));
        Yii::app()->end();
    }
    
    
    public function actionSavedata(){
        
    }    
    
}    