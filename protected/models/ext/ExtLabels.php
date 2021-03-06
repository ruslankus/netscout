<?php
Class ExtLabels extends Labels
{
    public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
    
    public function getLabels($currLng = 'en') {
        
      $arrLabels = array();
      $sql  = "SELECT t2.label,t1.value FROM labels_trl t1 ";
      $sql .= "JOIN labels t2 ON t1.label_id = t2.id ";
      $sql .= "JOIN languages t3 ON t1.language_id = t3.id ";
      $sql .= "WHERE t3.lng_prefix = :prefix";
        
        $params[':prefix'] = $currLng;
        
        $con = $this->dbConnection;
        $data=$con->createCommand($sql)->queryAll(true,$params);
        
        foreach($data as $row){
            $arrLabels[$row['label']] = $row['value'];
        }
        
        return $arrLabels;
    }//getLabels
    
    
    /**
     * Function add label for all avialable
     * languages
     * @param $label string label
     * @param $arrLng array all languages in sistem 
     */
    public function addLabel($label,$arrLng){
        
       $sql = "INSERT INTO labels ('label')
	    VALUES (:label)";
        
        $sql_param[':label'] = $label;
        
        $con = $this->dbConnection;
        $con->createCommand($sql)->execute($sql_param);
        $labelId = $con->getLastInsertID('labels');
        
        $sql = "INSERT INTO labels_trl ('label_id', 'language_id', 'value') VALUES ";
        foreach($arrLng as $key => $lng){           
            if($key == 0){
                $sql .= "($labelId, {$lng['id']}, ' ')";    
            }else{
                 $sql .= ",($labelId, {$lng['id']}, ' ')"; 
            }
            
        }
        
        $con->createCommand($sql)->execute();
        $labelTrl[] = $con->getLastInsertID('labels_trl');
        /*
        foreach($arrLng as $lng){
           
            $sql = "INSERT INTO labels_trl ('label_id', 'language_id', 'value') VALUES ";
            $sql .= "($labelId, {$lng['id']}, ' ')";
            
            $con->createCommand($sql)->execute();
            $labelTrl[] = $con->getLastInsertID('labels_trl');
        }
        */
        
        return true;
    }
    
    public function deleteLabel($id){
        $sql = "PRAGMA foreign_keys = ON";
        
        $con = $this->dbConnection;
        $con->createCommand($sql)->execute();
        
        $sql = "DELETE FROM labels
                WHERE id = ".(int)$id;
        
        $con->createCommand($sql)->execute();
        
        return true;
    }
    
       
}