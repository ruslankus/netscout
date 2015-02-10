<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data.css');
?> 	
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data room</h1></div>
    <div class="hr"></div>
	
	<div id="data-room-report">
	
		<h2>Data centre name</h2>
		<div id="links">
			<a class="button buttons-backgrounds" href="/service/datacentr" >Go Back</a>
			<a class="button buttons-backgrounds" href="#" >Refresh</a>
		</div>
        <p class="in-login-p">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
		
		
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
               <td class="no-data" colspan="7">  Refresh data fo you  </td>
           </tr>        
       		
			
        </table>
	</div><!-- /data-roam-report -->
	
    <div style="clear: both;"></div>
</div>


