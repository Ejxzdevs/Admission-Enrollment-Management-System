<?php 
include 'home-backend.php';

// TOTAL STUDENTS
$display_Student = new Count();
$Count_student = $display_Student->Count_Student();

// TOTAL COURSES
$display_course = new Count();
$result_course  = $display_course ->Show_Course();

// TOTAL INQUIRIES
$display_inquiry = new Count();
$Count_Inquiries = $display_inquiry->Count_Inquiries();

// TOTAL ADMISSIONS
$display_admission = new Count();
$Count_admission = $display_admission->Count_Admission();

// TOTAL SCHEDULES
$display_schedule = new Count();
$totalSchedule = $display_schedule->Count_schedules();

// TOTAL SECTIONS
$display_section = new Count();
$totalSection = $display_section->Count_sections();

// TOTAL SUBJECTS
$display_subject = new Count();
$totalSubject = $display_subject->Count_subjects();

// TOTAL ACCOUNTS
$display_account = new Count();
$totalAccount = $display_account->Count_accounts();

// DISPLAY RECENT STUDENT
$display_recentStudents = new Count();
$data = $display_recentStudents->Student_Records();

// DISPLAY AVE STUDENT PER MONTH
$avarage = new Count();
$ave = $avarage->Enrolled_StudentAvePerMonth();
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

        <div class="scroll">
        <!-- Label -->
        <div class="Dashboard-Label" >
            <label>Dashboard</label>
        </div>
        <!-- Count -->
        <div class="count-items">
            <a class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/student.png" alt="">
                        <p>Total Students</p>
                    </div>
                    <label for=""><?PHP echo $Count_student; ?></label>  
            </a>

            <a href="../Course/course.php" class="count-data">
                    <div class="iconContainer" > 
                        <img class="icons" src="../../Icons/homework.png" alt="">
                        <p>Total Courses</p>
                    </div>
                    <label for=""><?php echo $result_course ?></label>
            </a>

            <a  class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/email.png" alt="">
                        <p>Total Admission</p>
                    </div>
                    <label for=""><?php echo $Count_admission; ?></label>
                    
            </a>

            <a  class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/inquiry.png" alt="">
                        <p>Total Inquiries</p>
                    </div>
                    <label for=""><?php echo $Count_Inquiries; ?></label>  
            </a>
        </div>

        <!--  -->

        <div class="count-items">
            <a href="../Schedule/schedule.php" class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/schedule.png" alt="">
                        <p>Total Schedule</p>
                    </div>
                    <label for=""><?PHP echo $totalSchedule; ?></label>  
            </a>

            <a href="../Section/section.php" class="count-data">
                    <div class="iconContainer" > 
                        <img class="icons" src="../../Icons/section.png" alt="">
                        <p>Total Sections</p>
                    </div>
                    <label for=""><?php echo $totalSection ?></label>
            </a>

            <a href="../Subject/subject.php" class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/book.png" alt="">
                        <p>Total Subjects</p>
                    </div>
                    <label for=""><?php echo $totalSubject; ?></label>
            </a>

            <a class="count-data">
                    <div class="iconContainer" >
                        <img class="icons" src="../../Icons/account.png" alt="">
                        <p>Total Account</p>
                    </div>
                    <label for=""><?php echo $totalAccount; ?></label>  
            </a>
        </div>

        <!-- Recent Enrolled -->
        <div class="ThirdContainer" >

            <div class="graphContainer" >
                <canvas id="myChart"></canvas>
            </div>
        
            <div class="recentStundentContainer">
                <label for="">Recent Students</label>
                <table>
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Year</th>
                        </tr>
                    </thead>
                    <?php foreach($data as $student): ?>
                    <tbody>
                        <tr>
                           <td><p><?php echo $student['firstName'] . " " . $student['lastName'] ?></p></td>
                           <td><p><?php echo $student['Year'] ?></p></td>
                        </tr>
                    </tbody>
                    <?php endforeach; ?>
                </table>
            </div>
            
        </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
  const ctx = document.getElementById('myChart');

  const months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sept','Oct','Nov','Dec']

  new Chart(ctx, {
    type: 'line',
    data: {
      labels: months,
      datasets: [{
        label: 'Enrolled Students',
        data: <?php echo json_encode(array_map(function($data) { return $data['total_enrolled']; }, $ave)); ?>,
        borderWidth: 1
      }]
    },
    options: {
      scales: {
        y: {
          beginAtZero: true
        }
      }
    }
  });
</script>
</html>