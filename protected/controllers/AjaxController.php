<?php

class AjaxController extends Controller
{
    
    public function actionLoadForm(){
        
        $form_model = new DataCentrForm();
        $lng = Yii::app()->language;
        $this->renderPartial('_data_settings',array('form_model' => $form_model, 'lng' => $lng));
        Yii::app()->end();
    }
    
    /**
     * @param int $id Int - Id Datacentr
     */
    public function actionLoadEditForm($id){
        $form_model = new DataCentrForm();
        $objDc = Datacentres::model()->findByPk($id);
        $lng = Yii::app()->language;
        if(!empty($objDc)){
            $strIp = $objDc->ip_address;
            $arrIp = explode('.',$strIp);
            $this->renderPartial('_data_edit_settings',array('form_model' => $form_model,
            'arrIp' => $arrIp, 'name'=> $objDc->datacenter_name, 'dc_id' => $objDc->id, 'lng' => $lng));    
        }
        
    }//actionLoadEditForm
    
    
    public function actionSavedata(){
        $request = Yii::app()->request;
        $userId = Yii::app()->user->id;
        $lng = Yii::app()->language;
        
        if($request->isAjaxRequest){
           
            $form_model = new DataCentrForm();
            $form_model->attributes = $_POST['DataCentrForm'];
            if($form_model->validate()){
                $objDc = new Datacentres();
                $objDc->ip_address = $form_model->full_ip;
                $objDc->datacenter_name = $form_model->name;
                if($objDc->save()){
                    $objUserDc = new DcUser();
                    $objUserDc->user_id = $userId;
                    $objUserDc->dc_id = $objDc->id;
                    if($objUserDc->save()){
                        $this->renderPartial('_data_succ',array('name'=> $form_model->name,
                         'ip' => $form_model->full_ip,'dc_id' => $objDc->id, 'lng' => $lng));
                        Yii::app()->end();
                    }else{
                        Debug::d($objUserDc);
                    }
                }else{
                    
                }
                
                
            }else{
                $this->renderPartial('_data_settings',array('form_model'=>$form_model));
            }
            
        }else{
            
            //exception
        }
    }//actionSavedata
    
    
    public function actionSaveEditData($id){
        
        $request = Yii::app()->request;
        $userId = Yii::app()->user->id;
        $objDc = Datacentres::model()->findByPk((int)$id);
        $lng = Yii::app()->language;
        
        if($request->isAjaxRequest){
            
            $form_model = new DataCentrForm();
            $form_model->attributes = $_POST['DataCentrForm'];
            
            if($form_model->validate()){
                $objDc->ip_address = $form_model->full_ip;
                $objDc->datacenter_name = $form_model->name;
                if($objDc->update()){
                     $this->renderPartial('_data_succ',array('name'=> $form_model->name,
                         'ip' => $form_model->full_ip,'dc_id' => $objDc->id,'lng' => $lng));
                     Yii::app()->end();        
                }
            }else{
                $this->renderPartial('_data_edit_settings',array('form_model' => $form_model,'dc_id' => $objDc->id , 'lng' => $lng ));
            }//end: if($form_model->validate())
                
        }else{
            //exception
        }
        
        
    }//actionSaveEditData 
    
    /**
     * @param int $id - Data centres Id
     */
    public function actionLoadCompList($id){
        $lng = Yii::app()->language;
        $objDc = Datacentres::model()->findByPk($id);
        //$objXml = simplexml_load_file('all_comps_sql.xml');
        if(!empty($objDc)){
            $resXml = $this->curl_get_data($objDc->ip_address);
            @$objXml = simplexml_load_string($resXml);
            
            $this->renderPartial('_comp_list',array('objDc' => $objDc , 'objXml' =>$objXml, 'lng' => $lng ));   
           
        }else{
            //error
        }
  
    }//actionLoadCompList
    
    
    public function actionGetCompInfo(){
        $lng = Yii::app()->language;
        $request = Yii::app()->request;
        if($request->isAjaxRequest){
            
            $arrMemory = array('Memory usage');
            $arrCpu = array('CPU usage');
            $arrTemp = array('Temp C');
            $arrSpace = array('Space Free Gb');
            
            $dcId = $request->getPost('dc');
            $ip = $request->getPost('ip');
            $objDc = Datacentres::model()->findByPk($dcId);
            if(!empty($objDc)){
                $resXml = $this->curl_get_data($objDc->ip_address,$ip);
                @$objXml = simplexml_load_string($resXml);
                //Debug::d($objXml->dynamic);
                if($objXml){
                    
                    foreach($objXml->dynamic->item as $item){
                      //Debug::d($item);
                        $arrMemory[] = (int)$item->memusedp;
                        $arrCpu[] = (int)$item->cpu; 
                        $arrTemp[] = (int)$item->cputempcelsius;
                        $arrSpace[] = ((int)$item->spacefree)/1000;
                    }
                    
                    
                    $arrJson['space_total'] = ((int)$objXml->dynamic->item[0]->spacetotal)/ 1000;
                    $arrJson['memory'] = $arrMemory;
                    $arrJson['average_mem'] = $this->_array_average($arrJson['memory']);
                    $arrJson['cpu'] = $arrCpu;
                    $arrJson['average_cpu'] = $this->_array_average($arrJson['cpu']);
                    $arrJson['temp'] = $arrTemp;
                    $arrJson['average_temp'] = $this->_array_average($arrJson['temp']);
                    $arrJson['space_free'] = $arrSpace;
                    $arrJson['average_space'] = $this->_array_average($arrJson['space_free']);
                    
                    
                    echo json_encode($arrJson);
                    //Debug::d($arrJson);
                    Yii::app()->end();
                }//end if($objXml)
                
            }
            
        }else{
            //exception
        }
    }
    
    
 /*--------- private  parts ---------------------- */
     
    private function _array_average($array) {
        return (int)(array_sum($array) / count($array));
    }//everage  
    
 
    private $allCompAct = '/?action=last';
    private $getCompAct = '/?action=single&ip=';
    
    private function curl_get_data($dc_ip, $comp_ip = null){
        
        if(!empty($comp_ip)){
            $url = 'http://'.$dc_ip.$this->getCompAct.$comp_ip;
        }else{
            $url = 'http://'.$dc_ip.$this->allCompAct;
        }
        
          
        $curl = curl_init(); //инициализация сеанса
        curl_setopt($curl, CURLOPT_URL, $url); //урл сайта к которому обращаемся 
        curl_setopt($curl, CURLOPT_HEADER,false); //выводим заголовки
        curl_setopt($curl, CURLOPT_POST, true); //передача данных методом POST
        curl_setopt($curl, CURLOPT_RETURNTRANSFER,true); //теперь curl вернет нам ответ, а не выведет
        
            
        
        curl_setopt($curl, CURLOPT_USERAGENT, 'MSIE 5'); //эта строчка как-бы говорит: "я не скрипт, я IE5" :)
                
        $res = curl_exec($curl);
        curl_close($curl);
       
        return $res;

    }// curl_get_data   
    
    
    
    
    
    
       
    
}//end:class    