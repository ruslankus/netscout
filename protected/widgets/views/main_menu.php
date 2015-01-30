    <ul class="menu">
        <?php foreach($objMenu as $obj):?>
        <?php if(!empty($obj->route)):?>
        <li><a href="<?php echo $obj->route ?>"><?php echo $obj->label ?></a></li>
        <?php else:?>
        <li><a href="/page/index/<?php echo $obj->id ?>"><?php echo $obj->label ?></a></li>
        <?php endif;?>
        <?php endforeach;?>        
    </ul>