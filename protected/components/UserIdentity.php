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
			'admin'=>'admin',
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
                if(!$this->_hash_equals($hashedPswd,$this->password)){
                    $this->errorCode = self::ERROR_PASSWORD_INVALID;
                }else{
                    $this->errorCode = self::ERROR_NONE;
                    
                     //write params to session
                    $this->setState('id',$objUsr->id);                   
                    $this->setState('login',$objUsr->login);
                }
                
            }else{
                $this->errorCode = self::ERROR_USERNAME_INVALID;
            }
            
            return !$this->errorCode;
	}
        
        
        private function _hash_equals($known_string, $user_string)
	{
		// We jump trough some hoops to match the internals errors as closely as possible
		$argc = func_num_args();
        $params = func_get_args();
        
        if ($argc < 2) {
            trigger_error("hash_equals() expects at least 2 parameters, {$argc} given", E_USER_WARNING);
            return null;
        }
        
        if (!is_string($known_string)) {
        	trigger_error("hash_equals(): Expected known_string to be a string, " . gettype($known_string) . " given", E_USER_WARNING);
            return false;
        }

        if (!is_string($user_string)) {
        	trigger_error("hash_equals(): Expected user_string to be a string, " . gettype($user_string) . " given", E_USER_WARNING);
            return false;
        }
        
        if (strlen($known_string) !== strlen($user_string)) {
        	return false;
        }

		$len = strlen($known_string);
		$result = 0;
        for ($i = 0; $i < $len; $i++) {
            $result |= (ord($known_string[$i]) ^ ord($user_string[$i]));
        }

        // They are only identical strings if $result is exactly 0...
        return 0 === $result;
	}
}