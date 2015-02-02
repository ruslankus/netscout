<?php
/**
 * Labels and messages translation
 */
class Trl
{
    private static $_instanse = false;   
    private $_arrLabels = array();
    private $_arrMessages = array();
    
    public static function t(){
        if(!self::$_instanse){
            self::$_instanse = new self();
        }
        return self::$_instanse;
    }
    
    private function __construct() {
        //$currLng = Yii::app()->language;
        $currLng = "en";
        $this->_arrLabels = ExtLabels::model()->getLabels($currLng);
        //$this->_arrMessages = ExtMessage::model()->getMessage($currLng);
    }
        
    private function __clone(){}
    
    public function getLabel($labelName)
    {
        if(array_key_exists($labelName,$this->_arrLabels)){
            if(empty( $this->_arrLabels[$labelName])){
                return '!_'.$this->_arrLabels[$labelName];                    
            }else{
                return $this->_arrLabels[$labelName];  
            }
            
        }else{
            return '*_'.$labelName;  
        }
    }//getLabel
    
    
    public function getMsg($message){
        
        if(array_key_exists($message,$this->_arrMessages)){
            return $this->_arrMessages[$message];
        }else{
            return $message;  
        }
    }//getMessage
 
    
}





