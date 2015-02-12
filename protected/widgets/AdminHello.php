<?php
class AdminHello extends CWidget
{
    public function run(){
        $objUser = Yii::app()->user;
        $f_name = $objUser->getState('fname');
        $l_name = $objUser->getState('lname');
        $lng = Yii::app()->language;
                
        $this->render($lng . '_admin_hello',array('f_name' => $f_name, 'l_name' => $l_name));
    }//run   
}    