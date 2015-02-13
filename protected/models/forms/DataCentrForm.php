<?php
class DataCentrForm extends CFormModel
{   
    public $full_ip;
    public $ip1;
    public $ip2;
    public $ip3;
    public $ip4;
    public $name;
    
    
    public function rules()
	{
        return array(
            // username and password are required
            array('ip1, ip2, ip3, ip4 ,name','default'),
            array('ip1, ip2, ip3, ip4','complex_validation'),
            array('name','default'),
            
        );
    }
    
    public function common_fields(){
        return array($this->ip1,$this->ip2,$this->ip3,$this->ip4);
    }
    
    
    public function attributeLabels() {
        return array(
            'ip1' =>'IP',
            'ip2' =>'IP',         
            'ip3' =>'IP',
            'ip4' =>'IP',
    
        );
    }
    
    
    public function complex_validation(){
        
        $arrVal = $this->common_fields();
        foreach($arrVal as $item){
            if(empty($item) && $item !=='0' ){
                $this->addError('full_ip','Ip can\'t be blank');
                return false;
            }elseif(!is_numeric($item)){    
                $this->addError("full_ip","Ip must be a number");
                return false;
            }elseif((int)$item > 255){
                $this->addError('full_ip','Octet more than 255');
                return false;
            }
        }
        
        $this->full_ip = implode('.',$arrVal);
        return true;           
    }
       
}//end class    