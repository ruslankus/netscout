<?php
class ResetPassForm extends CFormModel
{
    public $temp_pass;
    public $new_pass;
    public $repeat_pass;
    
    
    private $_objCust;
    
    public function __construct($objCust){
        parent::__construct();
        $this->_objCust = $objCust;
    }
    
    
    public function rules()
	{
        return array(
            // username and password are required
            array('temp_pass, new_pass, repeat_pass', 'required'),
            array('temp_pass','check_temp_pass'),
            array('new_pass,','compare', 'compareAttribute'=>'repeat_pass')
        );
    }
    
    
    
    public function check_temp_pass(){
        
         if(crypt($this->temp_pass,$this->_objCust->password) != $this->_objCust->password){
            $this->addError('temp_pass','Wrong password');
            return false;   
         }   
       
    }    
}    