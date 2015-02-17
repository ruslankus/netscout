<?php
class Banner extends CWidget
{
    public function run(){
         $current_lng = Yii::app()->language;
        
        $this->render($current_lng . '_banner', array('lng' =>$current_lng));
    }//run  
    
}