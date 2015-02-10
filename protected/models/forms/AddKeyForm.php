<?php
class AddKeyForm extends CFormModel
{
    public $newkey;
    public $keyId;
    
    public function rules()
	{
        return array(
            // username and password are required
            array('newkey', 'required'),
            array('newkey','check_number')
            
        );
    }
    
    
    public function check_number()
    {
    
        $objKey = Numbers::model()->findByAttributes(array('lic_number'=>$this->newkey));
        $usrId = Yii::app()->user->id;
        
        if(empty($objKey)){
            $this->addError('newkey',"Key invalid, or wrong format, XXXX-XXXX-XXXX");            
            return false;    
        
        }else{
        
            $arrUsrData = ExtUserLicence::model()->get_user_license_info($usrId);
            foreach($arrUsrData as $row){
                if($row['lic_id'] == $objKey->id){
                    $this->addError('newkey',"Key used");            
                    return false;       
                }
            } 
           
        }//end: if(empty($objKey)) 
       
        $this->keyId = $objKey->id;
    
    }//end:check_number
}    