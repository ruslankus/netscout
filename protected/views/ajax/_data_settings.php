<?php echo CHtml::beginForm(); ?>	
	<?php echo CHtml::activeTextField($form_model,'ip',array('class' => 'edit-title')); ?>
	
    <?php echo CHtml::activeTextField($form_model,'ip',array('class'=>'edit-ip')); ?>
    
    <?php echo CHtml::error($form_model,'ip'); ?>
	<a class="button save-data">Save</a>
<?php echo CHtml::endForm(); ?>   