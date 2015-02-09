
 <div class="lang-hlder">Lang:
 <?php $string = ''; foreach($objLngs as $lng):?>
     <?php $params['language'] = $lng->lng_prefix;?> 
    <?php if($objLngs[0] == $lng): ?>
        <?php $string .=  '<a href="'.Yii::app()->createUrl('/'.$controller.'/'.$action , $params).'">'.
         strtoupper($lng->lng_prefix).'</a>&nbsp;/' ?>
    <?php else:?>
        <?php $string .=  '&nbsp;<a href="'.Yii::app()->createUrl('/'.$controller.'/'.$action , $params).'">'
        . strtoupper($lng->lng_prefix).'</a>' ?>
    <?php endif;?>
 <?php endforeach?> 
 <?php echo $string;  ?>
 </div>
