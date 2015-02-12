<?php echo CHtml::beginForm(); ?>
	<?php echo CHtml::activeTextField($form_model,'name',
    array('class' => 'edit-title','placeholder' => 'Dc Name')); ?>
	<div class="key-holder clearfix">
    IP:&nbsp;
        
    	<?php echo CHtml::activeTextField($form_model,'ip1',array('class'=>'edit-ip','maxlength'=>3, 'placeholder' =>'XXX')) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip2',array('class'=>'edit-ip','maxlength'=>3, 'placeholder' =>'XXX')) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip3',array('class'=>'edit-ip','maxlength'=>3, 'placeholder' =>'XXX')) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip4',array('class'=>'edit-ip','maxlength'=>3, 'placeholder' =>'XXX')) ?>
    </div>
     <?php echo CHtml::error($form_model,'full_ip'); ?>
	<div class="btn-holder"><a data-lng="<?php echo $lng?>"  data-new="1" class="button save-data">Save</a></div>
<?php echo CHtml::endForm(); ?>     

