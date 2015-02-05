<?php
class AccountMenu extends CWidget
{
    public function run(){
        
        $objMenu = Menu::model()->findAll();
        
        $this->render('account_menu',array('objMenu' =>$objMenu));
    }//run   
}    