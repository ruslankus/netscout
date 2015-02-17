<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/mail.css');  

?> 
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Having trouble signing in?</h1></div>
    <div class="hr"></div>
    <p>
    Norėdami nustatyti slaptažodį iš naujo, įveskite savo elektroninio pašto adresą, kuris yra susietas su jūsų Netscout paskyra. Tai el. pašto adresas, kurį naudojate jungdamiesi prie paskyros.
    </p>

    
    <div id="data-mail" class="clearfix">
    		
      <?php $form = $this->beginWidget('CActiveForm',array('enableAjaxValidation'=>false,'htmlOptions'=>array('class'=>'clearfix','id' => 'mail-form'))); ?>
        	<?php echo $form->label($form_model,'email');?>
            <?php echo $form->textField($form_model,'email');?>
            <button class="button">Send</button>
    
      <?php $this->endWidget(); ?>          
    </div><!--/data-room-report --> 
    <?echo CHtml::error($form_model,'email');?>
    
    
	
	
	<div style="clear: both;"></div>
</div><!--/main-wrapper -->
