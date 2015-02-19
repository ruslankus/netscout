<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_server.css');
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/js/charts/c3.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/charts/c3.js',CClientScript::POS_END);
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/charts/d3.js',CClientScript::POS_END);
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/data-server.js',CClientScript::POS_END);
?>
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data room</h1></div>
    <div class="hr"></div>
	
	<div id="data-room-report">

		<h2>Mega server</h2>
		<div id="links">
			<a class="button buttons-backgrounds" href="/service/datacentr" >Go Back</a>
			<a id="btn-refresh" class="button buttons-backgrounds" data-ip='<?php echo $ip ?>' data-dc='<?php echo $objDc->id?>' href="#" >Refresh</a>
		</div>
        
		<p class="p-chart">
            The Data Chart dashboard provides informative graphs to understand your memory usage. Scroll on the time-memory graph to instantly get the percentage of CPU and memory use on the server
		</p>
        <div class="table-box">
            <table>
                <tr>
                    <th>
                        Address
                    </th>
                    <td>
                        <?php echo $ip?>
                    </td>
                </tr>
                <tr>
                    <th>
                        Status
                    </th>
                    <td>
                        Online
                    </td>
                </tr>
                <tr>
                    <th>
                        Operation system
                    </th>
                    <td>
                        <?php echo $opSys;?>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="hr"></div>
    <div id="chart_box">
        <h2>Server Status</h2>
        
        <div id="charts-holder" class="hidden">
    		 <p>Please press refressh to get data</p>
        </div><!--/ charts-holder -->
        
	</div><!-- /data-server-report -->
	
    <div style="clear: both;"></div>
</div><!--/main-wrapper -->
