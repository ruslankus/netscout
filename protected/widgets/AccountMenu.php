<?php
class AccountMenu extends CWidget
{
    public function run(){
        $current_lng = Yii::app()->language;
       
        $this->render('account_menu',array('lng' => $current_lng));
    }//run   
}    