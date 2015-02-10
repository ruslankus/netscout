
$( document ).ready(function() {
    
    $('.edit-data').click(function(){
        $cont = $(this).parent();
        $cont.load('/ajax/LoadForm');
        
        return false;
    });
    
    $(document).on('click','.save-data',function(){
        
        $form = $(this).parent();
        postData = $form.serializeArray();
        $cont =  $(this).parent().parent();
        //gruzim
        saveData($cont,postData);
        
        return false;
    });
    

});

/*---------------------   obrabotchiki  ----------------------------------*/
function saveData($objContaier, postData){
    $objContaier.load("/ajax/savedata",postData);
}//saveData