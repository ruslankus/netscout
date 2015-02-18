
Hi <?php echo $objCust->f_name." ".$objCust->l_name; ?>,
 
You recently requested a password reset.
You temprary password is <?php echo $pass; ?>
 
To change your Netscout account password, click here 
or paste the following link into your browser:  <?php echo Yii::app()->request->getHostInfo(); ?>/<?php echo $lng?>/account/resetpass/<?php echo $objCust->id ?> 
 
The link will expire in 24 hours, so be sure to use it right away.
 
Thanks for using Netscout!
The Netscout Team
