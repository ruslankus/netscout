<?php
class MailForm extends CFormModel
{
    public $email;
    public $cust_id;
    public $objCust;
    
    public function rules()
	{
        return array(
            // username and password are required
            array('email', 'required'),
            array('email', 'email'),
            array('email','check_mail')
         
        );
    }
    
    
    public function check_mail(){
        
        $objCust = Customers::model()->findByAttributes(array('email' => $this->email));
        if(!empty($objCust)){
            $this->cust_id = $objCust->id;
            $this->objCust = $objCust;
            return true;
        }else{
            $this->addError('email',"Mail not found");
            return false; 
        }
    }  
    
    
}    