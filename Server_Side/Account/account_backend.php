<?php 
include "../../Connection/connection.php";

class Show_Inquiries extends DatabaseConnection{
    public function Show_Pending_Inquiries(){

    $admissiom_list = "SELECT * FROM `tbl_account` WHERE user_type = 'client' or user_type = 'student' ";
    $stmt = $this->conn->prepare($admissiom_list);
    $stmt->execute(); 
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    
    return $data;
    $this->conn = null;
      
    }

    public function Search_Pending_Inquiries($search_name){

        $search_inquiries = "SELECT * FROM `tbl_account` WHERE username LIKE '$search_name%' AND user_type = 'client' or user_type = 'student' "; 
        $stmt = $this->conn->prepare($search_inquiries);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        
    return $data;
    $this->conn = null;
          
    }



    
}






?>