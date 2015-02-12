<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_center.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/data-center-edit.js',CClientScript::POS_END);

?> 
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Duomenų centras</h1></div>
    <div class="hr"></div>
    
    <div id="data-room-report" class="clearfix">
		<div class="left">	
            <h2>Serverio valdymo skydelis</h2>
            
        </div>
		<div id="links" class="clearfix" >
			
			<a class="button buttons-backgrounds" href="/<?php echo $lng;?>/service/adddc">Add Dc</a>
		</div>
    </div><!--/data-room-report --> 

		<p class="in-login-p">Jei pirmą kartą kuriate ryšį su savo serveriu,
		 spauskite „redaguoti“ ir įveskite norimų stebėti serverių IP adresus.
		  Parašykite serverio pavadinimą ir spauskite „išsaugoti“. Tada turėsite galimybę matyti šį serverį.
		   Turėdami daugiau patvirtinimo raktų galėsite pridėti daugiau serverių. </p>
        
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
