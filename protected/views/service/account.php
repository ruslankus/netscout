<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/useracc.css');
?> 	
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Your Account</h1></div>
    <div class="hr"></div>
    <!--<div class="content-block login-block">-->
		
		<h2>Quisque augue tortor</h2>
        <p class="in-login-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
		<a class="button download-button buttons-backgrounds" href="#" >Download</a>
		<div class="hr"></div>
		<div id="add-new-key">
			<h2>Add new key</h2>
			<form action="" method="post">
				<input type="text" name="new-key" id="add-new-key-input-field" value="Product key(12 symbols)" />
				<input type="submit" class="button buttons-backgrounds" id="add-new-key-submit" value="Add">
			</form>
		</div>
		<!--
				end of id="add-new-key"
		-->
		<div class="hr"></div>
	
		<div id="current-keys">
			<h2>Your key(s)</h2>
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
						<a href="/service/genlic/<?php echo $data['lic_id']?>" class="button buttons-backgrounds">Download licence</a>
					</div>
					<div class="user-key-dates">
						<text>Activation date: 16.10.2014</text>
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
