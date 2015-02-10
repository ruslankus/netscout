<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_center.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/data-center-edit.js',CClientScript::POS_END);

?> 
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data centre</h1></div>
    <div class="hr"></div>
    <div class="content-header"><h2>Some subtitle</h2></div>
	<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
    
	<div id="data-room-boxes-wrapper">
	
		<div class="data-room-box">
			<div class="image-wrapper">			
				<img src="<?php echo Yii::app()->request->baseUrl?>/img/server-icon.png" />
			</div>
			
			<div class="data-room-desc">	
				<h3>Data centre title</h3>
				<p>IP: 10.0.101.105</p>
				<a class="button edit-data">Edit</a>
			</div>
			
		
		</div>
			
		<div class="data-room-box">
			<div class="image-wrapper">
					<img src="<?php echo Yii::app()->request->baseUrl?>/img/server-icon.png" />
			</div>

			<div class="data-room-desc">
				<h3>Data centre title</h3>
				<p>IP: 10.0.101.105</p>
				<a class="button edit-data">Edit</a>
			</div>

		</div>
		
	
		
	</div><!-- /data-room-boxes-wrapper -->
	
	
	<div style="clear: both;"></div>
</div><!--/main-wrapper -->
