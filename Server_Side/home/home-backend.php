<?php 

include "../../Connection/connection.php";

class Count extends DatabaseConnection{

    public function Show_Course(){

        $show_course = "SELECT * FROM `tbl_course`";
        $stmt = $this->conn->prepare($show_course);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        
        $this->conn = null;
        return $data;
        
          
    }


    
    public function Count_Inquiries(){

        $show_inquiry = "SELECT * FROM `tbl_inquiry` WHERE inquiry_status = 'Pending'";
        $stmt = $this->conn->prepare($show_inquiry);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        
        $this->conn = null;
        return $data;
      
          
    }

    public function Count_Student(){

        $show_Student = "SELECT * FROM `tbl_student_info` WHERE Student_Type = 'E'";
        $stmt = $this->conn->prepare($show_Student);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        
        $this->conn = null;
        return $data;
       
          
    }

    public function Count_admission(){

        $show_admission = "SELECT * FROM `tbl_admission` WHERE status = 'Pending'";
        $stmt = $this->conn->prepare($show_admission);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        
        $this->conn = null;
        return $data;
    
          
    }


    public function Student_Records(){

        $student_record = "SELECT * FROM (SELECT * FROM tbl_student_info WHERE Student_Type = 'E' ) tbl_student_info
        INNER JOIN (SELECT enrollment_id,student_id,date,Year,Sem,Remark,
        @Sid:= Section as Section,
        (SELECT `section_name` from tbl_section where section_id = @Sid) as section_name,
        (SELECT `schedule_id` from tbl_section where section_id = @Sid) as schedule_id
         FROM tbl_enrollment order by date desc ) 
         tbl_enrollment on tbl_student_info.student_id = tbl_enrollment.student_id 
        LIMIT 7
         ";
        $stmt = $this->conn->prepare($student_record);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;
      


    }

    
    



}




