<?php
class DataCentrForm extends CFormModel
{   
    public $ip;
    public $name;
    
    
    public function rules()
	{
        return array(
            // username and password are required
            array('ip', 'required'),
            
        );
    }
       
}//end class    