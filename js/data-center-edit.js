
$( document ).ready(function() {
    
    $('.edit-data').click(function(){
        $cont = $(this).parent();
        $cont.load('/ajax/LoadForm');
        
        console.log(cont);
        return false;
    });

});