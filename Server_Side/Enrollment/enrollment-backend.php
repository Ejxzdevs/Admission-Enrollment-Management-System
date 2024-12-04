<?php 
include "../../Connection/connection.php";

class Show_admission extends DatabaseConnection{
    public function Show_Pending_admission(){

    $admissiom_list = "SELECT * FROM (SELECT * FROM tbl_admission order by date ASC ) tbl_admission 
    JOIN (SELECT * FROM tbl_student_info WHERE Student_Type = 'NE') tbl_student_info on tbl_admission.id = tbl_student_info.student_id ";
    $stmt = $this->conn->prepare($admissiom_list);
    $stmt->execute(); 
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
    $this->conn = null;
    return $data;
      
    }

    public function Search_Pending_admission($search_name){

        $admissiom_list = "SELECT * FROM (SELECT * FROM tbl_admission ) tbl_admission 
        JOIN (SELECT * FROM tbl_student_info WHERE firstName LIKE '$search_name%' AND Student_Type = 'NE' or lastName LIKE '$search_name%' AND Student_Type = 'NE' ) tbl_student_info on tbl_admission.id = tbl_student_info.student_id GROUP BY tbl_admission.id";
        $stmt = $this->conn->prepare($admissiom_list);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;

    
   
          
    }


    
}


class Enrollment extends DatabaseConnection{ 
    public function enrollment($student_id,$items,$year,$semester,$section,$remark){

        // tbl enrollment

            $enroll = "INSERT INTO `tbl_enrollment`(`student_id`,`Section`, `Year`, `Sem`, `Remark`,`Cor`) VALUES (:student_id,:section,:year,:semester,:remark,:cor)";
            $stmt = $this->conn->prepare($enroll);

            $cor = "Not Generated";
            $stmt->bindParam(':student_id', $student_id);
            $stmt->bindParam(':year', $year);
            $stmt->bindParam(':semester', $semester);
            $stmt->bindParam(':section', $section);
            $stmt->bindParam(':remark', $remark);
            $stmt->bindParam(':cor', $cor);
            $stmt->execute(); 
            $lastInsertedId = $this->conn->lastInsertId();


        // tbl requirements
        foreach($items as $requirements){

            $insert_requirements = "INSERT INTO `tbl_requirements`(`student_id`, `requirement_name`) VALUES (:student_id,:requirements)";
            $stmt2 = $this->conn->prepare($insert_requirements);

            $stmt2->bindParam(':student_id', $student_id);
            $stmt2->bindParam(':requirements', $requirements);
            $stmt2->execute(); 

        }   

        // tbl student info

            $update_enrolled = "UPDATE `tbl_student_info` SET `Student_Type` = 'E' WHERE student_id = :student_id";
            
            $stmt4 = $this->conn->prepare($update_enrolled);
            $stmt4->bindParam(':student_id', $student_id);
            $stmt4->execute(); 

        // admission

            $update_admission = "UPDATE `tbl_admission` SET `status` = 'Read' WHERE id = :student_id";
            $stmt5 = $this->conn->prepare($update_admission);
            $stmt5->bindParam(':student_id', $student_id);
            $stmt5->execute(); 
            $this->conn = null;
            return 200;
            
    }


    public function returnee_enrollment($student_id,$year,$semester,$section){

        // tbl enrollment
            $enroll = "INSERT INTO `tbl_enrollment`(`student_id`,`Section`, `Year`, `Sem`,`Cor`) VALUES (:student_id,:section,:year,:semester,:cor)";
            $stmt = $this->conn->prepare($enroll);
            $cor = "Not Generated";
            $stmt->bindParam(':student_id', $student_id);
            $stmt->bindParam(':year', $year);
            $stmt->bindParam(':semester', $semester);
            $stmt->bindParam(':section', $section);
            $stmt->bindParam(':cor', $cor);
            $stmt->execute();

        // tbl student info

            $update_enrolled = "UPDATE `tbl_student_info` SET `Student_Type` = 'E' WHERE student_id = :student_id";
            $stmt4 = $this->conn->prepare($update_enrolled);
            $stmt4->bindParam(':student_id', $student_id);
            $stmt4->execute(); 

            $update_admission = "UPDATE `tbl_admission` SET `status` = 'Read' WHERE id = :student_id";
            $stmt5 = $this->conn->prepare($update_admission);
            $stmt5->bindParam(':student_id', $student_id);
            $stmt5->execute(); 
            $this->conn = null;
            return 200;
    }
 
    public function Show_Section(){

        $show_section= "SELECT * FROM ( SELECT * FROM tbl_section ) tbl_section JOIN 
        ( SELECT * FROM tbl_schedule ) tbl_schedule on  tbl_section.schedule_id = tbl_schedule.schedule_id ";
       $stmt = $this->conn->prepare($show_section);
       $stmt->execute(); 
       $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
       $this->conn = null;
       return $data;  
    }
}
