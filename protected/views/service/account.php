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
 <?php
$cs = Yii::app()->clientScript;
$cs->registerCssFile(Yii::app()->request->baseUrl.'/css/useracc.css');
?> 		
		<div id="current-keys">
			<h2>Your key(s)</h2>
			<ul id="current-user-keys-list">
				<li>
					<div class="user-key">
						<text>JA34 - KJ67 - GH61</text>
					</div>
					<div class="user-key-desc">
						<text class="desc-tittle" >Some title of software - Multi-device</text>
						<text class="desc-type">Key type: Commercial <b>[3 Devices]</b></text>
					</div>
					<div class="download-licence-button">
						<a href="#" class="button buttons-backgrounds">Download licence</a>
					</div>
					<div class="user-key-dates">
						<text>Activation date: 16.10.2014</text>
						<text>Exiration date: 10.10.2015</text>
					</div>
				</li>
				<div class="hr"></div><!-- This div appears after every list item-->
				
				<li>
					<div class="user-key">
						<text>FK46 - SN81 - 94AX</text>
					</div>
					<div class="user-key-desc">
						<text class="desc-tittle" >Some title of software - Multi-device</text>
						<text class="desc-type">Key type: Commercial <b>[3 Devices]</b></text>
					</div>
					<div class="download-licence-button">
						<a href="#" class="button">Download licence</a>
					</div>
					<div class="user-key-dates">
						<text>Activation date: 16.10.2014</text>
						<text>Exiration date: 10.10.2015</text>
					</div>
				</li>
				<div class="hr"></div><!-- This div appears after every list item-->
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
