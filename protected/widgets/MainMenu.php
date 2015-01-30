<?php
class MainMenu extends CWidget
{
    public function run(){
        
        $objMenu = Menu::model()->findAll();
        
        $this->render('main_menu',array('objMenu' =>$objMenu));
    }//run   
}    