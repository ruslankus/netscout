
$( document ).ready(function() {
    
    $(document).on('click','.edit-data',function(){
        $cont = $(this).parent();
        status = $(this).data('new');
        
        if(status == 0){
            dcId = $(this).data('dc')
            $cont.load('/ajax/LoadEditForm?id='+dcId);    
        }else{
            $cont.load('/ajax/LoadForm');
        }
      ;
        
        return false;
    });
    
    $(document).on('click','.save-data',function(){
        
        $form = $(this).parent().parent();
        postData = $form.serializeArray();
        $cont =  $(this).parent().parent().parent();
        //gruzim
        saveData($cont,postData);
        
        return false;
    });
    

});

/*---------------------   obrabotchiki  ----------------------------------*/
function saveData($objContaier, postData){
    $objContaier.load("/ajax/savedata",postData);
}//saveData