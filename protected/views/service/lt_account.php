<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/useracc.css');
?> 	
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Your Account</h1></div>
    <div class="hr"></div>
    <!--<div class="content-block login-block">-->
		
		<h2>Atsisiųskite naujausią versiją</h2>
        <p class="in-login-p">Čia galite parsisiųsti naujausią Netscout stebėsenos įrankio versiją.  Pradėkite stebėti serverius parsisiuntę mūsų programėlę ir įvedę patvirtinimo raktą.</p>
        
		<div class="download-holder clearfix">
        	<table width="100%">
            <tr>
                <td>Nestcout 32 bit version</td>
                <td><a class="button download-button buttons-backgrounds" href="/service/download?id=1" ><?php echo Trl::t()->getLabel('download'); ?></a></td>
                <td>Nestcout pdf </td>
                <td><a class="button download-button buttons-backgrounds" href="#" ><?php echo Trl::t()->getLabel('download'); ?></a></td>
            </tr>
            <tr>
                <td>Nestcout 64 bit version</td>
                <td><a class="button download-button buttons-backgrounds" href="/service/download?id=2" ><?php echo Trl::t()->getLabel('download'); ?></a></td>
                <td><td>
                <td></td>
            </tr>
            </table>
        </div><!--/download-holder--> 
	  
		<div class="hr"></div>
		<div id="add-new-key" class="clearfix">
			<h2>Pridėkite naują raktą</h2>
			 <?php $form=$this->beginWidget('CActiveForm', array('enableAjaxValidation'=>false)); ?>
                <?php echo $form->textField($form_model,'newkey',array('id' => 'add-new-key-input-field', 'placeholder' =>'12 simbolių XXXX-XXXX-XXXX'));?>    
				
				<input type="submit" class="button buttons-backgrounds" id="add-new-key-submit" value="<?php echo Trl::t()->getLabel('add');?>" />
                <?php echo $form->error($form_model,'newkey'); ?>
			<?php $this->endWidget();?>
		</div>
		<!--
				end of id="add-new-key"
		-->
		<div class="hr"></div>
	
		<div id="current-keys">
			<h2>Jūsų raktai</h2>
			<ul id="current-user-keys-list">
                <?php foreach($arrUsrData as $data):?>
				<li>
					<div class="user-key">
						<text><?php echo $data['lic_number']; ?></text>
					</div>
					<div class="user-key-desc">
						<text class="desc-tittle" ><?php echo $data['decription']?></text>
                        <text class="desc-tittle" ><?php echo $data['part_number']?></text>
                        <text class="desc-tittle" ><?php echo $data['comment']?></text><br />
						<text class="desc-type">Key Limit:<b>[<?php echo $data['user_limit'];?> users]</b></text>
					</div>
					<div class="download-licence-button">
						<a href="/service/genlic?id=<?php echo $data['lic_id']?>" class="button buttons-backgrounds lt_btn ?>">
                        <?php echo Trl::t()->getLabel('download_licence') ?>
                        </a>
					</div>
					<div class="user-key-dates">
						<text>Prisijungimo data: <?php echo date("d.m.Y",$data['activation_date']);?></text>
					</div>
				</li>
				<div class="hr"></div><!-- This div appears after every list item-->
				<?php endforeach; ?>
				
			</ul>
			<!--
				end of current-user-keys-list
			-->
		</div>
		<!--
			end of id="current-keys"
		-->
        
    <!--</div>-->
    <div style="clear: both;"></div>
</div><!-- /main-wrapperr -->
