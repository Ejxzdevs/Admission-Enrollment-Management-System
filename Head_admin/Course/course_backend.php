<?php 
include "../../Connection/connection.php";

class Course extends DatabaseConnection{

      // SHOW ALL COURSE
      public function Show_Course(){

        $show_course = "SELECT * FROM `tbl_course`";
        $stmt = $this->conn->prepare($show_course);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;    
    }

    // SEARCH SPECIFIC COURSE
    public function Search_Course($name){

        $show_course = "SELECT * FROM `tbl_course` WHERE course_name LIKE '%$name%'";
        $stmt = $this->conn->prepare($show_course);
        $stmt->execute(); 
        $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->conn = null;
        return $data;    
    }

    // INSERT COURSE
    public function Insert_Course($title,$description){
        $insert_course = "INSERT INTO `tbl_course`(`course_name`, `course_description`) VALUES (:title,:description)";
        $stmt = $this->conn->prepare($insert_course);
        $stmt->bindParam(':description', $description);
        $stmt->bindParam(':title', $title);
        $this->conn = null;
        $stmt->execute();
        return 200;
    }

    // UPDATE COURSE
    public function Update_Course($course_title,$course_description,$course_id){

        $update_course = "UPDATE `tbl_course` SET `course_name`=:course_title,`course_description`=:course_description WHERE course_id = :course_id";
        $stmt = $this->conn->prepare($update_course);
        $stmt->bindParam(':course_id',$course_id);
        $stmt->bindParam(':course_description', $course_description);
        $stmt->bindParam(':course_title', $course_title);
        $stmt->execute(); 
        $this->conn = null;
        return 200;
    }

    // DELETE COURSE
    public function delete_Course($id){

        $delete_course = "DELETE FROM `tbl_course` WHERE course_id = :id";
        $stmt = $this->conn->prepare($delete_course);
        $stmt->bindParam(':id',$id);
        $stmt->execute(); 
        $this->conn = null;
        return 200;
    }
}