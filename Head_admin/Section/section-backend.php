<?php 
include "../../Connection/connection.php";

class Section extends DatabaseConnection{
    
    // SHOW SECTIONS
    public function Show_Section(){

        $show_section= "SELECT * FROM ( SELECT * FROM tbl_section ) tbl_section LEFT JOIN 
         ( SELECT * FROM tbl_schedule ) tbl_schedule on  tbl_section.schedule_id = tbl_schedule.schedule_id ";
        $stmt = $this->conn->prepare($show_section);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;
    }
    // SEARCH SPECIFIC SECTION
    public function Search_Section($search_name){

        $search_inquiries = " SELECT * FROM ( SELECT * FROM tbl_section WHERE section_name LIKE '$search_name%') tbl_section LEFT JOIN 
         ( SELECT * FROM tbl_schedule ) tbl_schedule on  tbl_section.schedule_id = tbl_schedule.schedule_id "; 
        $stmt = $this->conn->prepare($search_inquiries);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;   
    }
    
    // SHOW SCHEDULE FOR OPTIONS
    public function Show_Schedule(){

        $show_sched= " SELECT * FROM tbl_schedule ";
        $stmt = $this->conn->prepare($show_sched);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;     
    }

    // INSERT SECTION
    public function Insert_Section($name,$sched,$room){

        $insert_section = "INSERT INTO `tbl_section`(`schedule_id`,`section_name`,`room`) VALUES (:sched,:name,:room)";
        $stmt = $this->conn->prepare($insert_section);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':sched', $sched);
        $stmt->bindParam(':room', $room);
        $stmt->execute();
        $this->conn = null;
        return 200;
    }

    // UPDATE SECTION
    public function Update_Section($name,$sched,$id,$room){

        $update_section = "UPDATE `tbl_section` SET `schedule_id`= :sched ,`section_name`= :name , `room` = :room WHERE section_id = :id";
        $stmt = $this->conn->prepare($update_section);
        $stmt->bindParam(':name', $name);
        $stmt->bindParam(':sched', $sched);
        $stmt->bindParam(':room', $room);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $this->conn = null;
        return 200;
       
    }
    // DELETE SECTION
    public function Delete_Section($id){

        $update_section = "DELETE FROM `tbl_section` WHERE section_id = :id ";
        $stmt = $this->conn->prepare($update_section);
        $stmt->bindParam(':id', $id);
        $stmt->execute();
        $this->conn = null;
        return 200;
    
    }

}