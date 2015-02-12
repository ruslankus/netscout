<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_center.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/data-center-edit.js',CClientScript::POS_END);

?> 
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data centre</h1></div>
    <div class="hr"></div>
    
    <div id="data-room-report" class="clearfix">
		<div class="left">	
            <h2>Data centre name</h2>
            
        </div>
		<div id="links" class="clearfix" >
			
			<a class="button buttons-backgrounds" href="/<?php echo $lng;?>/service/adddc">Add Dc</a>
		</div>
    </div><!--/data-room-report --> 

		<p class="in-login-p">If it is your first time setting up a connection with your servers,
		 click edit to enter the IP address of the servers you want to monitor.
		  Add a title and then press save. You will then have the ability to access that server.
		   You can add additional servers only if you have a unique verification key for each.  </p>
        
        <?php if($restrict):?>
            <p>Your licence ammount doesn't allow you to add DC</p>
        <?php endif;?>
  
    
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
                    <a data-new='0' data-lng="<?php echo $lng;?>"  data-dc="<?php echo $row['dc_id']?>" class="button edit-data">Edit</a>
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
                    <a data-new="1" data-lng="<?php echo $lng; ?>" class="button edit-data">Edit</a>
                </div>
            </div>
        <?php endif; ?>  
            
	</div><!-- /data-room-boxes-wrapper -->
	
	
	<div style="clear: both;"></div>
</div><!--/main-wrapper -->
