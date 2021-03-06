<?php

/**
 * UserIdentity represents the data needed to identity a user.
 * It contains the authentication method that checks if the provided
 * data can identity the user.
 */
class UserIdentity extends CUserIdentity
{
	/**
	 * Authenticates a user.
	 * The example implementation makes sure if the username and password
	 * are both 'demo'.
	 * In practical applications, this should be changed to authenticate
	 * against some persistent user identity storage (e.g. database).
	 * @return boolean whether authentication succeeds.
	 */
	public function authenticate()
	{
            /*
		$users=array(
			// username => password
			'demo'=>'demo',
			'adm  in'=>'admin',
		);
		if(!isset($users[$this->username]))
			$this->errorCode=self::ERROR_USERNAME_INVALID;
		elseif($users[$this->username]!==$this->password)
			$this->errorCode=self::ERROR_PASSWORD_INVALID;
		else
			$this->errorCode=self::ERROR_NONE;
		return !$this->errorCode;
             * 
             */
            
            $objUsr = Customers::model()->findByAttributes(array('login'=>$this->username));
            
            if(!empty($objUsr)){
                
                $hashedPswd = $objUsr->password;
                if(crypt($this->password,$hashedPswd) == $hashedPswd){
	                $this->errorCode = self::ERROR_NONE;
                    
                     //write params to session
                    $this->setState('id',$objUsr->id);                   
                    $this->setState('login',$objUsr->login);
                    $this->setState('fname',$objUsr->f_name);
                    $this->setState('lname',$objUsr->l_name);

                }else{
	                $this->errorCode = self::ERROR_PASSWORD_INVALID;                    
                }
                
            }else{
                $this->errorCode = self::ERROR_USERNAME_INVALID;
            }
            
            return !$this->errorCode;
	}
        
        
}