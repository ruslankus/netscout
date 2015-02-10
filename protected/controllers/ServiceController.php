<?php
class ServiceController extends Controller
{   
     public $layout='//layouts/main-logged';       
     
     protected function beforeAction($action) {
        
        $current_lng = Yii::app()->language;

        $objAction = Yii::app()->controller->action;
        $objUser = Yii::app()->user;
        if ($objAction->id !=='login' && $objAction->id !=='register')                       
            if ($objUser->isGuest){
                
                $this->redirect("/". $current_lng ."/service/login");
            }
     
        return parent::beforeAction($action);
    }

     
     
    public function actionIndex()
    {
        $objUsr = Yii::app()->user;
        $form_model = new AddKeyForm();
        
        if($_POST['AddKeyForm'])
        {
            $form_model->attributes = $_POST['AddKeyForm'];
            if($form_model->validate()){
                $objUsrLic = new UserLicence();
                $objUsrLic->user_id = $objUsr->id;
                $objUsrLic->lic_id = $form_model->keyId;
                $objUsrLic->activation_date = time();
                if($objUsrLic->save()){
                    $form_model->newkey = null;
                }              
            }        
        }
        
        $arrUsrData = ExtUserLicence::model()->get_user_license_info($objUsr->id);
            
        $this->render('account', array('arrUsrData' => $arrUsrData,'form_model' => $form_model));
    }
    
    
    public function actionDataCentr(){
        $objUsr = Yii::app()->user;
        
        $this->render('data_centr');
    }
    
    
    public function actionCompList(){
        
        $xmlData = $this->curl_get_data();
        $objXml = simplexml_load_string($xmlData); 
        
        //Debug::d($objXml);
        
        $this->render('comp_list',array('objXml' => $objXml));
    }//actionCompList
    
    
    public function actionCompInfo($ip){
        $xmlData = $this->curl_get_data($ip);
        $objXml = simplexml_load_string($xmlData);          
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
    
    
    
    
    /**
     * Function for generating license from key;
     * @param $id - key Id
     */
    public function actionGenLic($id){
        GenLic::generateLic($id);
    }// genLic
     
     
     
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
    
    
    
    public function actionDownload(){
        $filename = 'netscout.rar';
        header('Content-type: application/txt');//тут тип
        header('Content-Disposition: attachment; filename='.$filename);
        readfile($filename);
        Yii::app()->end();
    }
    
    
    
  /*------------------------------- private data -----------------------------------------*/
    
   
    private $ltGate = 'http://192.168.1.129/?action=last';
    private $flGate = 'http://192.168.1.129/?action=single&ip=';
    
    private function curl_get_data($comp_ip = null){
        
        if(!empty($comp_ip)){
            $url = $this->flGate.$comp_ip;
        }else{
            $url = $this->ltGate;
        }
           
        $curl = curl_init(); //инициализация сеанса
        curl_setopt($curl, CURLOPT_URL, $url); //урл сайта к которому обращаемся 
        curl_setopt($curl, CURLOPT_HEADER,false); //выводим заголовки
        curl_setopt($curl, CURLOPT_POST, true); //передача данных методом POST
        curl_setopt($curl, CURLOPT_RETURNTRANSFER,true); //теперь curl вернет нам ответ, а не выведет
        
            
        
        curl_setopt($curl, CURLOPT_USERAGENT, 'MSIE 5'); //эта строчка как-бы говорит: "я не скрипт, я IE5" :)
                
        $res = curl_exec($curl);
        curl_close($curl);
       
        return $res;

    }// curl_get_data
    
    
}