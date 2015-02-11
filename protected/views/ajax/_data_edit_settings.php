<?php echo CHtml::beginForm(); ?>
	<?php echo CHtml::activeTextField($form_model,'name',
    array('class' => 'edit-title','placeholder' => 'Dc Name','value' => $name)); ?>
	<div class="key-holder clearfix">
    IP:&nbsp;
        
    	<?php echo CHtml::activeTextField($form_model,'ip1',array('class'=>'edit-ip',
        'maxlength'=>3, 'placeholder' =>'XXX','value' => $arrIp[0] )) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip2',array('class'=>'edit-ip',
        'maxlength'=>3, 'placeholder' =>'XXX', 'value' => $arrIp[1])) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip3',array('class'=>'edit-ip',
        'maxlength'=>3, 'placeholder' =>'XXX','value' => $arrIp[2])) ?>&nbsp;.&nbsp;
        <?php echo CHtml::activeTextField($form_model,'ip4',array('class'=>'edit-ip',
        'maxlength'=>3, 'placeholder' =>'XXX', 'value' => $arrIp[3])) ?>
    </div>
     <?php echo CHtml::error($form_model,'full_ip'); ?>
	<div class="btn-holder"><a  data-new="0" data-dc="<?php echo $dc_id?>" class="button save-data">Save</a></div>
<?php echo CHtml::endForm(); ?>     

