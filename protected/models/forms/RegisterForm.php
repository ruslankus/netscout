<?php
class RegisterForm extends CFormModel
{
    public $login;
    public $password;
    public $reg_number;
    
    public function rules()
	{
        return array(
            // username and password are required
            array('login', 'required'),
        );
    }
    
    
}//end:class RegisterForm extends CFormModel