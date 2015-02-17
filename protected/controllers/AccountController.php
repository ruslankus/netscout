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
                    
                    $message_body = $this->renderPartial('_mail_message',array('pass'=> $defoult_pass),true);
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
    
}// end class