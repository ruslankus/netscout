<?php
class RegisterForm extends CFormModel
{
    public $login;
    public $password;
    public $email;
    public $key1;
    public $key2;
    public $key3;
    public $full_key;
    public $key_id;
    public $common;
    
    public function rules()
	{
        return array(
            // username and password are required
            array('login, password, email', 'required'),
            array('key1,key2,key3','check_number')
        );
    }
    
    
    public function check_number()
    {
        $key = $this->key1."-".$this->key2."-".$this->key3;
        
        $objKey = Numbers::model()->findByAttributes(array('lic_number'=>$key));
       
        if(empty($objKey)){
             $this->addError('full_key',"Key invalid");
             
             return false;    
             
        }elseif(!empty($objKey->used)){
             $this->addError('full_key',"Key used");
             return false;
        }
        
        $this->full_key = $key;
        $this->key_id = $objKey->id;           
        
    }//end:check_number
    
}//end:class RegisterForm extends CFormModel