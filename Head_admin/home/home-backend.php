<?php 

include "../../Connection/connection.php";

class Count extends DatabaseConnection{

    // COUNT COURSE
    public function Show_Course(){

        $countCourse = "SELECT * FROM `tbl_course`";
        $stmt = $this->conn->prepare($countCourse);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }
    
    // COUNT INQUIRIES
    public function Count_Inquiries(){

        $countInquiry = "SELECT * FROM `tbl_inquiry` WHERE inquiry_status = 'Pending'";
        $stmt = $this->conn->prepare($countInquiry);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        
        $this->conn = null;
        return $data;
    }

    // COUNT STUDENTS
    public function Count_Student(){

        $countStudent = "SELECT * FROM `tbl_student_info` WHERE Student_Type = 'E'";
        $stmt = $this->conn->prepare($countStudent);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;

    }

    // COUNT ADMISSION
    public function Count_admission(){

        $countAdmission = "SELECT * FROM `tbl_admission` WHERE status = 'Pending'";
        $stmt = $this->conn->prepare($countAdmission);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }

    // COUNT SCHEDULE
    public function Count_schedules(){

        $countSchedule = "SELECT * FROM `tbl_schedule`";
        $stmt = $this->conn->prepare($countSchedule);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }

    // COUNT SECTIONS
    public function Count_sections(){

        $countSection = "SELECT * FROM `tbl_section`";
        $stmt = $this->conn->prepare($countSection);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }

    // COUNT SUBJECTS

    public function Count_subjects(){

        $countSubject = "SELECT * FROM `tbl_subject`";
        $stmt = $this->conn->prepare($countSubject);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }

    // COUNT ACCOUNT
    public function Count_accounts(){

        $countAccount = "SELECT * FROM `tbl_account`";
        $stmt = $this->conn->prepare($countAccount);
        $stmt->execute(); 
        $data = $stmt->rowCount();
        $this->conn = null;
        return $data;
          
    }

    // DISPLAY RECENT STUDENT
    public function Student_Records(){

        $student_record = "SELECT * FROM (SELECT * FROM tbl_student_info WHERE Student_Type = 'E' ) tbl_student_info
        INNER JOIN (SELECT enrollment_id,student_id,date,Year,Sem,Remark,
        @Sid:= Section as Section,
        (SELECT `section_name` from tbl_section where section_id = @Sid) as section_name,
        (SELECT `schedule_id` from tbl_section where section_id = @Sid) as schedule_id
         FROM tbl_enrollment order by date desc ) 
         tbl_enrollment on tbl_student_info.student_id = tbl_enrollment.student_id 
        LIMIT 10
         ";
        $stmt = $this->conn->prepare($student_record);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;

    }

    // DISPLAY AVERAGE OF ENROLLED EVERYMONTH
    public function Enrolled_StudentAvePerMonth(){
        $avarage = "SELECT 
            months.month,
            COUNT(i.student_id) AS total_enrolled
            FROM 
                (SELECT 1 AS month UNION ALL 
                SELECT 2 UNION ALL 
                SELECT 3 UNION ALL 
                SELECT 4 UNION ALL 
                SELECT 5 UNION ALL 
                SELECT 6 UNION ALL 
                SELECT 7 UNION ALL 
                SELECT 8 UNION ALL 
                SELECT 9 UNION ALL 
                SELECT 10 UNION ALL 
                SELECT 11 UNION ALL 
                SELECT 12) AS months
            LEFT JOIN tbl_enrollment i 
            ON MONTH(i.date) = months.month 
            AND YEAR(i.date) = 2024
            AND i.date BETWEEN '2024-01-01' AND '2024-12-31'
        GROUP BY 
            months.month
        ORDER BY 
            months.month;";
        $stmt = $this->conn->prepare($avarage);
        $stmt->execute();
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;

    }

}




