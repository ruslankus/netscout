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
	    //if logged in - redirect to index
        if(!Yii::app()->user->isGuest){
	        $this->redirect($this->createUrl('main/index'));
	    }
 
        $form_model = New LoginForm();
         //if post request
        if($_POST['LoginForm'])
        {
	        $form_model->attributes = $_POST['LoginForm'];
	        if($form_model->validate() && $form_model->login()){
		        
	        }	
	        
	    }    
        $this->render('login', array('form_model' => $form_model));
     }
     
     public function actionRegister()
     {
        $form_model = new RegisterForm();
        
        if($_POST['RegisterForm'])
        {
            //attributes
            $form_model->attributes = $_POST['RegisterForm'];
            
            //if form valid
            if($form_model->validate()){
                
                $objUser = new Customers();
                $objUser->attributes = $form_model->attributes;
                $objUser->password = crypt($form_model->password);
                
                if($objUser->save()){
                     Debug::d($objUser);
                    $this->redirect('index');    
                }else{
                    Debug::d($objUser);
                }
                
            }
        }
        
        $this->render('register',array('form_model' => $form_model));
     }       
    
}