<?php
class RegisterForm extends CFormModel
{
    public $login;
    public $password;
    public $email;
    public $f_name;
    public $l_name;
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
            array('login, password, email,f_name, l_name', 'required'),
            array('key1,key2,key3','check_number')
        );
    }
    
    /**
    * Declares attribute labels.
    */
   public function attributeLabels()
   {
       return array(
           'f_name' => 'Name',
           'l_name' => 'Surname',
           'login' => Trl::t()->getLabel('login'),
           'password' => Trl::t()->getLabel('password')
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