<?php 
class AccountController extends Controller
{
    public function actionIndex()
    {
        $lng = Yii::app()->language;
        $form_model = new MailForm();
        
        if($_POST['MailForm']){
            $form_model->attributes = $_POST['MailForm'];
            if($form_model->validate()){
                
                $defoult_pass = 'user12345';
                $objCust = $form_model->objCust;
                $hashed_pasw = crypt($defoult_pass);
                $objCust->password = $hashed_pasw;
                if($objCust->update()){
                    
                    $message_body = $this->renderPartial('_mail_message',array('pass'=> $defoult_pass,
                    'objCust' => $objCust, 'lng' => $lng),true);
                    $to = $objCust->email;
                    $subject = 'Recover password';
                    $result = mail($to,$subject,$message_body);
                    if($result){
                        $this->render('mail_sent');
                    }
                    
                }
            }
        }
        
        $this->render($lng . '_forget_password',array('lng' => $lng, 'form_model' => $form_model));    
    }//end password
    
    
    /**
     * @param int $id Cust - id
     */
    public function actionResetPass($id){
        
        $lng = Yii::app()->language;
        $objCust = Customers::model()->findByPk((int)$id);
        if(!empty($objCust)){
            
            $form_model = new ResetPassForm($objCust);
            if($_POST['ResetPassForm']){
                $form_model->attributes = $_POST['ResetPassForm'];
                if($form_model->validate()){
                    
                    $objCust->password = crypt($form_model->new_pass);
                    if($objCust->update()){
                        $this->render($lng . '_change_pass_succ');
                    }else{
                        //error massage
                        
                    }
                }
            }
            $this->render($lng.'_change_password',array('form_model' => $form_model));
        }
    }
    
    
}// end class