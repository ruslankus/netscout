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
        $lng = Yii::app()->language;
        
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
            
        $this->render($lng . '_account', array('arrUsrData' => $arrUsrData,'form_model' => $form_model));
    }
    
    
    public function actionDataCentr(){
        $objUsr = Yii::app()->user;
        $lng = Yii::app()->language;
        $arrDc = ExtDatacentres::model()->get_users_dc($objUsr->id);
        $lic_count = UserLicence::model()->countByAttributes(array('user_id' => $objUsr->id));
                        
        $dc_count = count($arrDc);
        
        if($dc_count > $lic_count){
	    	 $this->render('data_centr_delete',array('arrDc' => $arrDc,'lng' => $lng));    
        }else{
	      //Debug::d($arrDc);
		  $this->render($lng.'_data_centr',array('arrDc' => $arrDc,'lng' => $lng));  
        }

        
    }
    
    
    public function actionAddDc(){
        
        $usrId = Yii::app()->user->id;
        $lng = Yii::app()->language;
        $lic_count = UserLicence::model()->countByAttributes(array('user_id' => $usrId));
        $arrDc = ExtDatacentres::model()->get_users_dc($usrId);
        $dc_count = count($arrDc);
        
        if($lic_count > $dc_count){
            
            $this->render('data_centr_allow',array('arrDc' => $arrDc,'lng' => $lng));
          
        }elseif($lic_count < $dc_count){
            $this->render('data_centr_delete',array('arrDc' => $arrDc,'lng' => $lng));
        }else{             
            //Debug::d($arrDc);
            $this->render($lng . '_data_centr',array('arrDc' => $arrDc,'lng' => $lng,'restrict' => true));
        }
    }
    
    
    /**
     * @param $id int - Dc - id
     */
    public function actionDeleteDc($id){
        $lng = Yii::app()->language;
        $objDc = Datacentres::model()->findByPk($id);
        if(!empty($objDc)){
            $objDc->delete();
            $this->redirect('/'.$lng.'/service/datacentr');
        }
    }
    
    /**
     * 
     * @param int $id - Data centre id 
     */
    public function actionCompList($id = null){
	    $lng = Yii::app()->language;
        //$xmlData = $this->curl_get_data()        
        //$objXml = simplexml_load_string($xmlData);
        //$objXml = simplexml_load_file('all_comps_sql.xml');
        
        $objDc = Datacentres::model()->findByPk((int)$id);
       
        $this->render($lng . '_comp_list',array('objDc' => $objDc ));
    }//actionCompList
    
    
    public function actionCompInfo(){
        
        $request = Yii::app()->request;
        $dcId = $request->getParam('dc');
        $ip = $request->getParam('ip');
        $opSys = $request->getParam('ops');
        $lng = Yii::app()->language;
        
        $objDc = Datacentres::model()->findByPk((int)$dcId);
        if(!empty($objDc)){
            
            //$xmlData = $this->curl_get_data($ip);
            //$objXml = simplexml_load_string($xmlData);  
        
            
            $this->render('comp_info', array('objDc' => $objDc,
             'opSys' => $opSys, 'ip' => $ip, 'lng' => $lng));        
        }else{
            //error
        } 
        
           
    }
     
     
	public function actionLogin()
	{
		$this->layout = '//layouts/main';
		$lng = Yii::app()->language;
		  
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
		$this->render($lng . '_login', array('form_model' => $form_model,'lng' => $lng));
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
    
    
    /**
     * @param $id - int File type ID (32bit or 64bit ))
     */
    public function actionDownload($id){
        
        if($id == 1){
            $filename = 'download/netscoutsetup_monitor_x86.exe';    
        }elseif($id == 2){
            $filename = 'download/netscoutsetupt_monitor_x64.exe';   
        }elseif($id == 3){
            $filename = 'download/netscoutsetup_service.exe'; 
        }elseif($id == 4){
            $filename = 'download/guide.pdf';
       
        }else{
            //return false;
            Yii::app()->end();
        }
        
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename='.basename($filename));
        header('Cache-Control: must-revalidate');
        header('Pragma: public');
        header('Content-Length:' . filesize($filename));
        ob_clean();
        flush();
        readfile($filename);
        Yii::app()->end();
    }
    
    
    
  /*------------------------------- private data -----------------------------------------*/
  
  
    private function _array_average($array) {
        return array_sum($array) / count($array);
    }//everage  
    
   
    private $ltGate = 'http://192.168.1.135/?action=last';
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