
$( document ).ready(function() {
    
    $(document).on('click','.edit-data',function(){
        $cont = $(this).parent();
        status = $(this).data('new');
        dcId = $(this).data('dc');
        
        $cont.html('<div class="server-preloader"><img src="/img/preloaders/server-preloader.gif"/></div');
         
        if(status == 0){
           
            $cont.load('/ajax/LoadEditForm?id='+dcId);    
        }else{
            $cont.load('/ajax/LoadForm');
        }
      ;
        
        return false;
    });
    
    $(document).on('click','.save-data',function(){
        
        status = $(this).data('new');
        
        $form = $(this).parent().parent();
        postData = $form.serializeArray();
        $cont =  $(this).parent().parent().parent();
        dcId = $(this).data('dc');
        $cont.html('<div class="server-preloader"><img src="/img/preloaders/server-preloader.gif"/></div');
        //gruzim
        if(status == 0){
            
            saveEditData($cont,postData,dcId); 
        }else{
            saveData($cont,postData);    
        }        
        
        return false;
    });
    

});

/*---------------------   obrabotchiki  ----------------------------------*/
function saveData($objContaier, postData){
    $objContaier.load("/ajax/savedata",postData);
}//saveData

function saveEditData($objContaier, postData,dcId){
    $objContaier.load('/ajax/saveEditData/?id='+ dcId, postData );
}