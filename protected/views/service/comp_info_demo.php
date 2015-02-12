<?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/css/data_server.css');
    $cs->registerCssFile(Yii::app()->request->baseUrl.'/js/charts/c3.css');
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/charts/c3.js',CClientScript::POS_END);
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/charts/d3.js',CClientScript::POS_END);
    $cs->registerScriptFile(Yii::app()->baseUrl.'/js/charts-func-dinamic.js',CClientScript::POS_END);
?>
<div class="separator-gradient"></div>
<div class="main-wrapper">
    <div class="block-header"><h1>Data room</h1></div>
    <div class="hr"></div>
	
	<div id="data-room-report">

		<h2>Mega server</h2>
		<div id="links">
			<a class="button buttons-backgrounds" href="/service/complist" >Go Back</a>
			<a class="button buttons-backgrounds" href="#" >Refresh</a>
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
                        192.168.1.1
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
                        Windows 8.1
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="hr"></div>
    <div id="chart_box">
        <h2>Server Status</h2>
		<div class="chart cpu">
			<div class="chart-title">
				<h3>Processor usage: 34%</h3>
			</div>
			<div id="chart_cpu"></div>
		</div><!--/chart cpu -->
        
		<div class="chart memory">
			<div class="chart-title">
				<h3>Memory usage: 51%</h3>
			</div>
			<div id="chart_memory"></div>
		</div><!--/ chart memory -->

        <div class="chart cpu">
            <div class="chart-title">
                <h3>Temperature: 45C</h3>
            </div>
            <div id="chart_temp"></div>
        </div><!--/ chart memory -->
        
	</div><!-- /data-server-report -->
	
    <div style="clear: both;"></div>
</div><!--/main-wrapper -->
