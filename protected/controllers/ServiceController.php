<?php
class ServiceController extends Controller
{   
     public $layout='//layouts/main-logged';       
     
     protected function beforeAction($action) {
        $objAction = Yii::app()->controller->action;
        $objUser = Yii::app()->user;
        if ($objAction->id !=='login' && $objAction->id !=='register')                       
            if ($objUser->isGuest){
                
                $this->redirect("/service/login");
            }
     
        return parent::beforeAction($action);
    }

     
     
	public function actionIndex()
	{
		$objUsr = Yii::app()->user;
        
        $arrUsrData = ExtUserLicence::model()->get_user_license_info($objUsr->id);
                
        $this->render('account', array('arrUsrData' => $arrUsrData));
	}
     
     
	public function actionLogin()
	{
		$this->layout = '//layouts/main';  
        //if logged in - redirect to index
		if(!Yii::app()->user->isGuest){
		    $this->redirect('/service/index');
		}
		
		$form_model = New LoginForm();
		 //if post request
		if($_POST['LoginForm'])
		{
		    $form_model->attributes = $_POST['LoginForm'];
		    if($form_model->validate() && $form_model->login()){
		        $this->redirect('index');
		    }	
	    
		}    
		$this->render('login', array('form_model' => $form_model));
	}//end login
    
    
    public function actionGenLic($id){
        GenLic::generateLic($id);
    }
     
     
     
	public function actionRegister()
	{
		$this->layout = '//layouts/main';
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
                    //save lic detail
                    $objUsrLic = new UserLicence();
                    $objUsrLic->user_id = $objUser->id;
                    $objUsrLic->lic_id = $form_model->key_id;
                    $objUsrLic->save(); 
                  
		            $login_model = new LoginForm();
                    $login_model->username = $objUser->login;
                    $login_model->password = $form_model->password; 
		            if($login_model->login()){
		             $this->redirect('index');  
		            }    
		        }else{
                    //Debug::d($objUser);    		          
		            $form_model->addError('common',"Create user failed");
		        }
		        
		    }
		}
		
		$this->render('register',array('form_model' => $form_model));
	}//end Register
     
    /**
     * Does logout and redirects
     */
    public function actionLogout()
    {
        Yii::app()->user->logout(false);
        $this->redirect('login');
    }        
    
}