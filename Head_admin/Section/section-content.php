<?php 
include "section-backend.php";
// SHOW SCHEDULE AS OPTION FOR CREATE & UPDATE MODAL
$select_schedule = new Section();
$result_schedule  = $select_schedule->Show_Schedule();


if(isset($_POST['src-submit'])){
    // SEARCH SPECIFIC SECTION
    $name = $_POST['search_name'];
    $section_section = new Section();
    $result_section  = $section_section->Search_Section($name);
}else{
    // SHOW SECTIONS 
    $select_section = new Section();
    $result_section  = $select_section->Show_Section();

}

//  INSERT SECTION
if(isset($_POST['submit-section'])){

    $name = $_POST['section-name'];
    $sched = $_POST['schedule'];
    $room = $_POST['room'];

    
    $insert_section = new Section();
    $insert_result = $insert_section->Insert_Section($name,$sched,$room);

    if($insert_result == 200){
        echo "
        <script>
            alert('The Data is already inserted')
            window.location.href = 'section.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'section.php'
        </script>";
    }

}

// UPDATE SECTION 
if(isset($_POST['update-section'])){

    $id = $_POST['id'];
    $name = $_POST['section-name'];
    $sched = $_POST['schedule'];
    $room = $_POST['room'];
    
    $update_section = new Section();
    $update_result = $update_section->Update_Section($name,$sched,$id,$room);

    if($update_result == 200){
        echo "
        <script>
            alert('The Data is already updated')
            window.location.href = 'section.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'section.php'
        </script>";
    }

}

// DELETE SECTION
if(isset($_GET['delete'])){

    $id = $_GET['delete'];

    $delete_section = new Section();
    $result_delete  = $delete_section->Delete_Section( $id);

    if($result_delete == 200){
        echo "
        <script>
            alert('The Data is already deleted')
            window.location.href = 'section.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'section.php'
        </script>";
    }

}

?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div class="admission-application-container">
    <div class="sub-admission-container">
        <div class="admission-header">
            <label for="">List of Section</label>
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
                    href="#" onclick="open_course()">New Section</a>
                </div> 
                <form action="section.php" method="POST">
                    <input type="text" name="search_name" placeholder="Search Section: ">
                    <button type="submit" name="src-submit"><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="admission-content-body">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th >Section</th>
                            <th>Room</th>
                            <th >Schedule</th>
                            <th>Action</th>
                        </tr>
                    </thead>
        
                    <?php foreach($result_section as $section){ ?>
                    <tbody>
                        <tr>
                            <td><?php echo $section['section_id'] ?></td>
                            <td><p><?php echo $section['section_name'] ?></p></td>
                            <td><p><?php echo $section['room'] ?></p></td>
                            <td><p><?php echo $section['schedule_name'] ?></p></td>
                            <td>                              
                                <a href="javascript: update_section('<?php echo $section['section_id'] ?>','<?php echo $section['schedule_id'] ?>','<?php echo $section['section_name'] ?>','<?php echo $section['room'] ?>');"><img class="act-icons" src="../../Icons/edit.png" alt="" srcset=""></a>
                                <a href="section.php?delete=<?php echo $section['section_id'];  ?>"><img class="act-icons" src="../../Icons/delete.png" alt="" srcset=""></a>                     
                            </td>
                        </tr>
                    </tbody>
                    <?php } ?>
                
                   
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
        <div style=" padding: 1rem 0 0 0 ; display: flex; justify-content: center; align-items: end; " >
                        <label 
                        style='
                        font-size: 16px;
                        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-weight: bold;
                        '>Create a Section</label>
                        </div>
            <form action="section.php" method="POST">
                    <input type="text" name="section-name" placeholder="Section Name: ">
                    <input type="text" name="room" placeholder="Room: ">
                    <label for="">Choose Schedule</label>
                    <select name="schedule" id="">
                        <?php foreach($result_schedule as $sched_data){ ?>
                        <option value="<?php echo $sched_data['schedule_id'] ?>"><?php echo $sched_data['schedule_name'] ?></option>
                        <?php } ?>
                    </select>
                    <button type="submit" name="submit-section">Submit</button>
            </form>
        </div>
    </div>
</div>

<!-- UPDATE -->
<div class="modal" id="update-section">
    <div class="modal-container"> 
        <div class="header-course">
             <a href="javascript: close_section_update()"><img class="close-course" src="../../Icons/close.png" alt="" srcset=""></a>
        </div>
        <div class="body-course">
        <div style=" padding: 1rem 0 0 0 ; display: flex; justify-content: center; align-items: end; " >
                        <label 
                        style='
                        font-size: 16px;
                        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-weight: bold;
                        '>Update Section</label>
                        </div>
            <form action="section.php" method="POST">
                    <input type="text" name="section-name" placeholder="Section Name: " id="sec-name">
                    <input type="text" name="room" placeholder="Room: " id="room">
                    <input type="text" name="id" placeholder="Section Name: " id="sec-id" hidden>
                    <label for="">Choose Schedule</label>
                    <select name="schedule" id="">
                        <?php foreach($result_schedule as $sched_data){ ?>
                        <option value="<?php echo $sched_data['schedule_id'] ?>"><?php echo $sched_data['schedule_name'] ?></option>
                        <?php } ?>
                    </select>
                    <button type="submit" name="update-section">Submit</button>
            </form>
        </div>
    </div>
</div>


<script>
    // create
    let openModal = document.querySelector('.modal');
    function open_course(){
        openModal.style.display ="FLEX";
        
    }

    function close_course(){
        openModal.style.display ="None";
    } 



    // update modal
    let updateModal = document.querySelector('#update-section');
    function update_section(sec_id,sched_id,name,room){

        console.log(sec_id,sched_id,name);
        document.querySelector('#sec-name').value = name;
        document.querySelector('#room').value = room;
        document.querySelector('#sec-id').value = sec_id;
        updateModal.style.display = "FLEX";

    }

    function close_section_update(){
        updateModal.style.display = "NONE";
    }

</script>




