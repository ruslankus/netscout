
 <div class="lang-hlder">Lang:
 <?php $string = ''; foreach($objLngs as $lng):?>
     <?php
      $params['language'] = $lng->lng_prefix;
      if($current == $lng->lng_prefix){
        $link = "<span>". strtoupper($lng->lng_prefix) ."</span>";   
      }else{
        $link = '<a href="'.Yii::app()->createUrl('/'.$controller.'/'.$action , $params).'">'.
         strtoupper($lng->lng_prefix).'</a>';
      }  
        
     
     ?>
      
    <?php if($objLngs[0] == $lng): ?>
        <?php $string .=  $link . '&nbsp;/' ?>
    <?php else:?>
        <?php $string .=  '&nbsp;'.$link ?>
    <?php endif;?>
 <?php endforeach?> 
 <?php echo $string;  ?>
 </div>
