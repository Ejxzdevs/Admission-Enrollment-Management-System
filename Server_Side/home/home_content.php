<?php 
include 'home-backend.php';


$display_course = new Count();
$result_course  = $display_course ->Show_Course();

$display_inquiry = new Count();
$Count_Inquiries = $display_inquiry->Count_Inquiries();

$display_Student = new Count();
$Count_student = $display_Student->Count_Student();

$display_admission = new Count();
$Count_admission = $display_admission->Count_Admission();

$display_recentStudents = new Count();
$data = $display_recentStudents->Student_Records();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
</head>
<body>
    <div class="dashboard-container">
        <!-- Label -->
        <div class="Dashboard-Label" >
            <label>Dashboard</label>
        </div>
        <!-- Count -->
        <div class="count-items">
            <a href="../Student_Record/student.php" class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/student.png" alt="">
                        <p>Total Students</p>
                    </div>
                    <label for=""><?PHP echo $Count_student; ?></label>  
            </a>

            <a class="count-data">
                    <div class="iconContainer" > 
                        <img class="icons" src="../../Icons/homework.png" alt="">
                        <p>Total Courses</p>
                    </div>
                    <label for=""><?php echo $result_course ?></label>
            </a>

            <a href="../Admission/admission.php" class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/email.png" alt="">
                        <p>Total Admission</p>
                    </div>
                    <label for=""><?php echo $Count_admission; ?></label>
                    
            </a>

            <a href="../Inquiry/inquiry.php" class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/conversation.png" alt="">
                        <p>Total Inquiries</p>
                    </div>
                    <label for=""><?php echo $Count_Inquiries; ?></label>  
            </a>
        </div>

        <!-- Recent Enrolled -->
        <div class="ThirdContainer" >
        
            <div class="recentStundentContainer">
                <label for="">Recent Students</label>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Year</th>
                            <th>Semester</th>
                            <th>Section</th>
                        </tr>
                    </thead>
                    <?php foreach($data as $student): ?>
                    <tbody>
                        <tr>
                           <td><p><?php echo $student['student_id'] ?></p></td>
                           <td><p><?php echo $student['firstName'] . " " . $student['lastName'] ?></p></td>
                           <td><p><?php echo $student['Year'] ?></p></td>
                           <td><p><?php echo $student['Sem'] ?></p></td>
                           <td><p><?php echo $student['section_name'] ?></p></td> 
                        </tr>
                    </tbody>
                    <?php endforeach; ?>
                </table>
            </div>
            <div class="" >

            </div>
        </div>
        
    </div>
</body>
</html>