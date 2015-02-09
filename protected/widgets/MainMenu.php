<?php
class MainMenu extends CWidget
{
    public function run(){
        $current_lng = Yii::app()->language;
        $objMenu = Menu::model()->findAll();
        
        $this->render('main_menu',array('objMenu' =>$objMenu, 'current_lng' => $current_lng));
    }//run   
}    