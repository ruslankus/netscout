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
                
        <?php $this->widget('application.widgets.LngMenu');?>
                
        <?php $this->widget('application.widgets.AdminHello');?>
        <?php $this->widget('application.widgets.AccountMenu');?>
        
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
        <p>Suspendisse viverra, nunc in viverra vestibulum, urna tellus accumsan velit, eget faucibus ante libero et dolor. Nulla facilisi. Suspendisse tempor ultrices sem, sed aliquam sem tempor rutrum. Proin vel metus dolor. Aenean hendrerit neque ac mattis commodo. Vivamus id lacus elit. Maecenas massa justo, scelerisque quis facilisis et, malesuada a diam. Pellentesque at pulvinar sapien. Nam tincidunt ultrices lacus eu malesuada. Curabitur vel hendrerit leo. Morbi luctus nibh ligula, nec porta mi luctus ut. Integer sagittis justo at sollicitudin dictum. Aliquam blandit erat est, eget faucibus enim mattis nec.</p>
        <span class="copyright">© 2014 Lookout, Inc.  Lookout and the Shield Logo are registered trademarks</span>
    </div>
</div>

<script src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery-1.11.2.min.js"></script>
</body>
</html>