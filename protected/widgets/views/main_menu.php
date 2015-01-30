    <ul class="menu">
        <?php foreach($objMenu as $obj):?>
        <li><a href="/page/index/<?echo $obj->id?>"><?php echo $obj->label ?></a></li>
        <?php endforeach;?>        
    </ul>