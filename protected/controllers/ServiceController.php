<?php

class ServiceController extends Controller
{   
     
     protected function beforeAction($action) {
        $objAction = Yii::app()->controller->action;
        $objUser = Yii::app()->user;
        if ($objAction->id !=='login' && $objAction->id !=='register')                       
            if ($objUser->isGuest || $objUser->getState('role') !== 'auth_user'){
                
                $this->redirect("/service/login");
            }
     
        return parent::beforeAction($action);
    }

     
     
     public function actionIndex()
     {
        echo "Account";
     }
     
     
     public function actionLogin()
     {
        $this->render('login');
     }
     
     public function actionRegister()
     {
        $this->render('register');
     }       
    
}