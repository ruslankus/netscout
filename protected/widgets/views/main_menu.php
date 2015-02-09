    <ul class="menu">
        <?php foreach($objMenu as $obj):?>
        <?php if(!empty($obj->route)):?>
        <li><a href="/<?php echo $current_lng ?>/<?php echo $obj->route ?>"><?php echo Trl::t()->getLabel($obj->label ); ?></a></li>
        <?php else:?>
        <li><a href="/<?php echo $current_lng ?>/page/index/<?php echo $obj->id ?>"><?php echo Trl::t()->getLabel($obj->label ) ?></a></li>
        <?php endif;?>
        <?php endforeach;?>        
    </ul>