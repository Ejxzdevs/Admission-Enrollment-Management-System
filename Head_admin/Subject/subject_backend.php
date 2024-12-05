<?php 
include "../../Connection/connection.php";

class Subject extends DatabaseConnection{

     // READ SUBJECT
     public function Show_Subject(){

        $show_course = "SELECT * FROM `tbl_subject`";
        $stmt = $this->conn->prepare($show_course);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;
        
    }

    // SERCH SUBJECT

    public function Search_Subject($name){

        $show_course = "SELECT * FROM `tbl_subject` WHERE subject_name LIKE '%$name%'";
        $stmt = $this->conn->prepare($show_course);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;
        
    }

    // Insert Subject
    public function Insert_Subject($sub_name,$sub_unit,$sub_code,$sub_description){

        $insert_subject = "INSERT INTO `tbl_subject` (`subject_name`,`subject_code`,`subject_description`, `subject_unit`) VALUES (:sub_name,:sub_code,:sub_description,:sub_unit)";
        $stmt = $this->conn->prepare($insert_subject);
        $stmt->bindParam(':sub_name', $sub_name);
        $stmt->bindParam(':sub_code', $sub_code);
        $stmt->bindParam(':sub_unit', $sub_unit);
        $stmt->bindParam(':sub_description', $sub_description);
        $this->conn = null;
        $stmt->execute();
        return 200;
   
    }

    // UPDATE SUBJECT
    public function update_Subject($sub_id,$sub_name,$sub_unit,$sub_code,$sub_description){

        $update_subject = "UPDATE `tbl_subject` SET `subject_name`=:sub_name,`subject_code`=:sub_code,`subject_description`=:sub_description,`subject_unit`=:sub_unit WHERE subject_id = :sub_id ";
        $stmt = $this->conn->prepare($update_subject);
        $stmt->bindParam(':sub_id', $sub_id);
        $stmt->bindParam(':sub_name', $sub_name);
        $stmt->bindParam(':sub_code', $sub_code);
        $stmt->bindParam(':sub_unit', $sub_unit);
        $stmt->bindParam(':sub_description', $sub_description);
        $stmt->execute(); 
        $this->conn = null;
        return 200;
    }

    // DELETE SUBJECT
    public function delete_Subject($id){

        $delete_subject = "DELETE FROM `tbl_subject` WHERE subject_id = :id";
        $stmt = $this->conn->prepare($delete_subject);
        $stmt->bindParam(':id',$id);
        $stmt->execute(); 
        $this->conn = null;
        return 200;
       
    }
    
}
