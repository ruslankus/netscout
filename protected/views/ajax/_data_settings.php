<?php echo CHtml::beginForm(); ?>	
	<?php echo CHtml::activeTextField($form_model,'name',
    array('class' => 'edit-title','placeholder' => 'Dc Name')); ?>
	
    <?php echo CHtml::activeTextField($form_model,'ip',
    array('class'=>'edit-ip', 'placeholder' => 'Ip address')); ?>
    
    <?php echo CHtml::error($form_model,'ip'); ?>
	<a class="button save-data">Save</a>
<?php echo CHtml::endForm(); ?>   