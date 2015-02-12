$(document).ready(function(){
    
    $('#dc-refresh').click(function(){
        
        dcId = $(this).data('dc');
        $('#complist-table-holder').html('<div class="data-room-preloader"><img src="/img/preloaders/2.gif" /></div>');
            
        getData(dcId);
        return false;
    });
    
});//document ready



/*------------ handlers --------------*/
function getData(dc_id){
    $('#complist-table-holder').load('/ajax/loadcomplist?id='+dc_id);    
}