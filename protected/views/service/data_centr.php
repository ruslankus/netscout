<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_center.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/data-center-edit.js',CClientScript::POS_END);

?> 
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data centre</h1></div>
    <div class="hr"></div>
    
    <div id="data-room-report">
    	<h2>Some subtitle</h2>
		<div id="links">
        
			<a class="button buttons-backgrounds" href="#">add DC</a>
		
		</div>

		<p class="in-login-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
    </div><!--/data-room-report -->
    
	<div id="data-room-boxes-wrapper">
        <?php if(!empty($arrDc)):?>
            <?php foreach ($arrDc as $row):?>
            <div class="data-room-box">
                <div class="image-wrapper">			
                    <img src="<?php echo Yii::app()->request->baseUrl?>/img/server-icon.png" />
                </div>

                <div class="data-room-desc">	
                    <h3>
                        <a href="/<?php echo $lng?>/service/complist/<?php echo $row['dc_id']; ?>">
                            <?php echo $row['datacenter_name']; ?>
                        </a>
                    </h3>
                    <p><?php echo $row['ip_address']; ?></p>
                    <a data-new='0' data-dc="<?php echo $row['dc_id']?>" class="button edit-data">Edit</a>
                </div>		

            </div><!--/data-room-box -->
            <?php endforeach; ?>
        <?php else: ?>
            <div class="data-room-box">
                <div class="image-wrapper">
                    <img src="<?php echo Yii::app()->request->baseUrl?>/img/server-icon.png" />
                </div>

                <div class="data-room-desc">
                    <h3>Enter title DC</h3>
                    <p> Enter ip</p>
                    <a data-new="1" class="button edit-data">Edit</a>
                </div>
            </div>
        <?php endif; ?>  
            
	</div><!-- /data-room-boxes-wrapper -->
	
	
	<div style="clear: both;"></div>
</div><!--/main-wrapper -->
