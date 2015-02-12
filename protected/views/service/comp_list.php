<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/complist.js',CClientScript::POS_END);
?> 	
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data room</h1></div>
    <div class="hr"></div>
	
	<div id="data-room-report" class="clearfix">
		<div class="left">	
            <h2><?php echo $objDc->datacenter_name ?></h2>
            <p><span>ip:</span> <?php echo $objDc->ip_address; ?></p>
        </div>
		<div id="links" class="clearfix" >
			<a class="button buttons-backgrounds" href="/service/datacentr" >Go Back</a>
			<a id="dc-refresh" class="button buttons-backgrounds" href="#" data-dc="<?php echo $objDc->id; ?>" >Refresh</a>
		</div>
    </div><!--/data-room-report -->    
        
        <p class="in-login-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
		
		<div id="complist-table-holder">
            <table>
                <tr>
                    <th>#</th>
                    <th>Server name</th>
                    <th>Address</th>
                    <th>Status</th>
                    <th>Proc. usage</th>
                    <th>Mem. usage</th>
                    <th>O. S.</th>
                </tr>
               
                <tr>
                    <td class="no-data" colspan="7"> No data or no connection to Data Center  </td>
                </tr>
            </table>
        </div><!--/data-room-boxes-wrapper -->
	
    <div style="clear: both;"></div>
</div><!--/main-wrapper -->



