<?php

class PageController extends Controller
{
    private $_defoult_teplate = 'page';
   
    
    
    public function actionIndex($id = 1)
    {
        $current_lng = Yii::app()->language;
        $prefx = $current_lng.'_'; 
        
        $objPage = Pages::model()->findByAttributes(array('menu_id' => $id));
        $template = (!empty($objPage->template))? $prefx . $objPage->template : $prefx . $this->_defoult_teplate;
        
        $this->render($template);
    }
    
    
    
    

}    