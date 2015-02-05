<?php
Class ExtUserLicence extends UserLicence
{
    public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}
    
    
    /**
     * @param $id - Id user Id
     * @return array
     */
    public function get_user_license_info($id)
    {
        $sql  = "SELECT t1.lic_id, t1.user_id, t2.lic_number, t3.part_number,";
        $sql .= "t3.decription, t3.`comment`,t3.user_limit ";
        $sql .= "FROM user_licence t1 ";
	    $sql .= "JOIN numbers t2 ON t1.lic_id = t2.id ";
	    $sql .= "JOIN license_types t3 ON t2.type = t3.id ";
        $sql .= "WHERE t1.user_id = ".(int)$id;
        
        $con = $this->dbConnection;
        $retData=$con->createCommand($sql)->queryAll();
        
        return $retData;
    }
    
        
    /**
    * @param $id - Id licene Id
    * @return array
    */
    public function get_user_and_licence_info($id)
    {
        $sql =  "SELECT t2.f_name, t2.l_name, t3.lic_number, t4.part_number, t4.user_limit,t4.`comment` ";
        $sql .= "FROM user_licence t1 ";
        $sql .= "JOIN customers t2 ON t1.user_id = t2.id ";
        $sql .= "JOIN numbers t3 ON t1.lic_id = t3.id ";
        $sql .= "JOIN license_types t4 ON t3.type = t4.id ";
        $sql .= "WHERE t1.lic_id = ".(int)$id;
        
        $con = $this->dbConnection;
        $retData=$con->createCommand($sql)->queryRow();
        
        return $retData;
    
    }//get_user_and_licence_info

}//end class    