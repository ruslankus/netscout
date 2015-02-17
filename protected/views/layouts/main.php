<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/fonts.css" rel="stylesheet">
    <link href="<?php echo Yii::app()->request->baseUrl; ?>/css/style.css" rel="stylesheet">    
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>Netscout</title>
</head>
<body>
<header class="header">
    <div class="header-internal">
        <a id="logo-block" href="/"></a>
        
         <?php $this->widget('application.widgets.MainMenu');?>
        
        <?php $this->widget('application.widgets.LngMenu');?>
    </div>
</header>

<?php echo $content;?>

<div style="clear: both;"></div>

<div class="footer-line">
    <div class="footer-internal">
         <?php $this->widget('application.widgets.FootMenu');?>
    </div>
</div>

<div class="under-footer">
    <div class="central-block">
        
         <?php $this->widget('application.widgets.FootCopy');?>
    </div>
</div>

</body>
<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-1.11.2.min.js">
</html>