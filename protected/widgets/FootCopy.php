<?php
class FootCopy extends CWidget
{
    public function run(){
        $lng = Yii::app()->language;
        
        $this->render($lng . '_foot_copy');
    }//run   
}  