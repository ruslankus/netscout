<?php

class PageController extends Controller
{
    private $_defoult_teplate = 'page';
    
    public function actionIndex($id = 1)
    {
        $objPage = Pages::model()->findByAttributes(array('menu_id' => $id));
        $template = (!empty($objPage->template))? $objPage->template : $this->_defoult_teplate;
        
        $this->render($template);
    }
    
    
    
    

}    