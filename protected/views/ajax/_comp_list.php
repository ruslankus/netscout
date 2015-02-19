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
<?php if(!empty($objXml)):?>
    <?php $n =1; foreach($objXml as $rowXml):?>        
	<tr>
		<td><?php echo $n ?>.</td>
		<td>
        <?php if(!empty($rowXml->name)):?>    
            
                <?php echo $rowXml->name; ?>
            
        <?php else:?>
           Generic compiuter
        <?php endif;?>
        </td>
		<td>
            <?php if($rowXml->netscout == 1): ?>
            <a href="/service/compinfo?ip=<?php echo $rowXml->ip?>&dc=<?php echo $objDc->id; ?>&ops=<?php echo $rowXml->os; ?>">
                <?php echo $rowXml->ip ?>
            </a>
            <?php else:?>
                <?php echo $rowXml->ip ?>
            <?php endif; ?>
        </td>
		<td><?php echo ($rowXml->netscout == 1)? "Online" : "Offline"?></td>
		<td><?php echo $rowXml->cpu?>%</td>
		<td><?php echo $rowXml->memusedp; ?>%</td>
		<td>
        <?php echo (!empty($rowXml->os))? $rowXml->os : "Unknown OS"?>  
        </td>
	</tr>
    <?php $n++; endforeach; ?>
<?php else:?>
     <tr>
    	<td class="no-data" colspan="7"> No data or no connection to Data Center  </td>
    </tr>        
<?php endif;?>			
			
</table>