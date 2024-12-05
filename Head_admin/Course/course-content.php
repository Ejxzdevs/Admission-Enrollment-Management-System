<?php 
include "course_backend.php";

error_reporting(0);

if(isset($_POST['submit-course'])){

    $course = new Course();
    $course_title = $_POST['course-title'];
    $course_description = $_POST['course-description'];

    $res_course_insert =  $course->Insert_Course($course_title,$course_description);
    
    if($res_course_insert == 200){
        echo "
        <script>
            alert('The Data is already inserted')
            window.location.href = 'course.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'course.php'
        </script>";
    }
}

// update course

if(isset($_POST['update-course'])){

    $update_course = new Course();

    $course_name = $_POST['course-name'];
    $course_description = $_POST['course-description'];
    $course_id = $_POST['course-id'];

    $res_course_update = $update_course->Update_Course($course_name,$course_description,$course_id);
    
    if($res_course_update == 200){
        echo "
        <script>
            alert('The Data is already Updated')
            window.location.href = 'course.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'course.php'
        </script>";
    }
}


// select course

$select_course = new Course();
$result_list  = $select_course->Show_Course();

// delete course

if(isset($_GET['course_id'])){

    $id = $_GET['course_id'];
    $delete_course = new Course();
    $result_delete  = $delete_course->delete_Course($id);

    if($result_delete == 200){
        echo "
        <script>
            alert('The Data is already Deleted')
            window.location.href = 'course.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'course.php'
        </script>";
    }
}

?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div class="admission-application-container">
    <div class="sub-admission-container">
        <div class="admission-header">
            <label for="">List of Courses</label>
        </div>
        <div class="admission-content">
            <div class="admission-content-header">
                <div class="label-container">
                    <label for=""><a 
                    style="
                            background-color: #0879BB;
                            text-decoration: none;
                            color:#FFFFFF;
                            padding: .8em 2em;
                            border-radius: 5px;
                            font-size: 13px;
                            "
                    href="#" onclick="open_course()">New Course</a>
                </div> 
                <form action="inquiry.php" method="POST">
                    <input type="text" name="search_name" placeholder="Search Course: ">
                    <button type="submit" name="src-submit"><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="admission-content-body">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th >Course Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <?php foreach($result_list as $data){?>
                    <tbody>
                        <tr>
                            <td><?php echo $data['course_id']; ?></td>
                            <td><?php echo $data['course_name']; ?></td> 
                            <td>
                                <a href="#" onclick="update_course(
                                '<?php echo $data['course_id']; ?>',
                                '<?php echo $data['course_name']; ?>',
                                '<?php echo $data['course_description']; ?>'
                                )">
                                <img class="act-icons" src="../../Icons/edit.png" alt="" srcset=""></a>
                                <a href="course.php?course_id=<?php echo $data['course_id']; ?>"><img class="act-icons" src="../../Icons/delete.png" alt="" srcset=""></a>
                            </td>
                        </tr>
                    </tbody>
                    <?php  } ?>
                
                   
                </table>
            </div>
        </div> 
    </div> 
</div>
<!-- CREATE MODAL -->
<div class="modal">
    <div class="modal-container"> 
        <div class="header-course">
             <a href="javascript: close_course()"><img class="close-course" src="../../Icons/close.png" alt="" srcset=""></a>
        </div>
        <div class="body-course">
        <div style="padding: 1rem 0 0 1rem;" >
                        <label 
                        style='
                        font-size: 22px;
                        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-weight: bold;
                        '>Create a Course</label>
                        </div>
            <form action="course.php" method="POST">
                <input type="text" name="course-title" placeholder="Course Name:">
                <textarea name="course-description" id="" cols="30" rows="10" placeholder="Description: "></textarea>
                <button type="submit" name="submit-course">SUBMIT</button>
            </form>
        </div>
    </div>
</div>
<!-- UPDATE -->

<div class="modal" id="update-course">
    <div class="modal-container"> 
        <div class="header-course">
             <a href="javascript: close_course_update()"><img class="close-course" src="../../Icons/close.png" alt="" srcset=""></a>
        </div>
        <div class="body-course">
            <div style="padding: 1rem 0 0 1rem;" >
                        <label 
                        style='
                        font-size: 22px;
                        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-weight: bold;
                        '>Update Course</label>
                </div>
            <form action="course.php" method="POST">
                <input type="text" name="course-id" placeholder="Course Name:" id="course_id" hidden>
                <input type="text" name="course-name" placeholder="Course Name:" id="course_name">
                <textarea name="course-description" id="course_description" cols="30" rows="10" placeholder="Description: " ></textarea>
                <button type="submit" name="update-course">SUBMIT</button>
            </form>
        </div>
    </div>
</div>


<script>
    // create
    let openModal = document.querySelector('.modal');
    function open_course(name,messages,id){
        
        let a = document.querySelector('#message-content');
        let b = document.querySelector('#name');
        let message = messages;
        let Uname = name;
        openModal.style.display ="Flex";
        a.textContent = message;
        b.textContent = Uname;
        console.log(id);
    
    }

    function close_course(){
        openModal.style.display ="None";
    } 




    let CourseUpdate = document.querySelector('#update-course');
    function update_course(id,name,description){
        CourseUpdate.style.display ="Flex";

        let course_name = document.querySelector('#course_name');
        let course_description = document.querySelector('#course_description');
        let course_id = document.querySelector('#course_id');

        course_name.value = name;
        course_description.value = description;
        course_id.value = id;


    }

    function close_course_update(){
        CourseUpdate.style.display ="None";
    } 


</script>




