<?php
class ExtDatacentres extends Datacentres
{
    public static function model($className=__CLASS__)
    {
        return parent::model($className);
    }
    
    /**
     * 
     * @param int $id - User Id
     * @return array
     */
    public function get_users_dc($id)
    {
        $sql  = "SELECT t1.*, t2.* FROM dc_user t1 ";
	$sql .= "JOIN datacentres t2 ON t1.dc_id = t2.id ";
        $sql .= "WHERE t1.user_id = " . (int)$id;
        
        $con = $this->dbConnection;
        $retData=$con->createCommand($sql)->queryAll();
        
        return $retData;
    }
    
    
}//end: class

