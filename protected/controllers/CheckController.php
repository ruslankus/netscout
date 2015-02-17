<?php

class CheckController extends Controller
{
    public function actionIndex(){
        
        echo $_SERVER['REMOTE_ADDR'];
    }   
}