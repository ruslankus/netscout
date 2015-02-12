
$( document ).ready(function() {
    
    $(document).on('click','.edit-data',function(){
        $cont = $(this).parent();
        status = $(this).data('new');
        dcId = $(this).data('dc');
        lng = $(this).data('lng');
        
        $cont.html('<div class="server-preloader"><img src="/img/preloaders/server-preloader.gif"/></div');
         
        if(status == 0){
           
            $cont.load('/'+ lng +'/ajax/LoadEditForm?id='+dcId);    
        }else{
            $cont.load('/'+ lng +'/ajax/LoadForm');
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
        lng = $(this).data('lng');
        $cont.html('<div class="server-preloader"><img src="/img/preloaders/server-preloader.gif"/></div');
        //gruzim
        if(status == 0){
            
            saveEditData($cont,postData,dcId,lng); 
        }else{
            saveData($cont,postData,lng);    
        }        
        
        return false;
    });
    

});

/*---------------------   obrabotchiki  ----------------------------------*/
function saveData($objContaier, postData, lng){
    $objContaier.load("/"+ lng +"/ajax/savedata",postData);
}//saveData

function saveEditData($objContaier, postData,dcId ,lng){
    $objContaier.load('/'+ lng +'/ajax/saveEditData/?id='+ dcId, postData );
}