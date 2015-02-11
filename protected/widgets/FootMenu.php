<?php
class FootMenu extends CWidget
{
    public function run(){
        $current_lng = Yii::app()->language;
        $objMenu = Menu::model()->findAll();
        
        $this->render('foot_menu',array('objMenu' =>$objMenu, 'current_lng' => $current_lng));
    }//run   
}  