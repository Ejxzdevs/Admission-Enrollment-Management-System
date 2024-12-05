<?php 
include "subject_backend.php";

if(isset($_POST['src-submit'])){
    // FILTER SEARCH SPECIFIC SUBJECT
    $name = $_POST['search_name'];
    $subject_list = new Subject();
    $result_list  = $subject_list->Search_Subject($name);
}else{
    // DEFAULT SHOW ALL SUBJECT
    $subject_list = new Subject();
    $result_list  = $subject_list->Show_Subject();
}

// INSERT SUBJECT
if(isset($_POST['submit-subject'])){

    $subject = new Subject();
    $sub_name = $_POST['sub-name'];
    $sub_unit = $_POST['sub-unit'];
    $sub_code = $_POST['sub-code'];
    $sub_description = $_POST['sub-description'];
    $res_subject_insert = $subject->Insert_Subject($sub_name,$sub_unit,$sub_code,$sub_description);
    
    if($res_subject_insert == 200){
        echo "
        <script>
            alert('The Data is already inserted')
            window.location.href = 'subject.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'subject.php'
        </script>";
    }
}

// UPDATE SUBJECT
if(isset($_POST['update-subject'])){

    $subject_update = new Subject();
    $sub_id = $_POST['sub-id'];
    $sub_name = $_POST['sub-name'];
    $sub_unit = $_POST['sub-unit'];
    $sub_code = $_POST['sub-code'];
    $sub_description = $_POST['sub-description'];

    $res_subject_insert = $subject_update->update_Subject($sub_id,$sub_name,$sub_unit,$sub_code,$sub_description);
    
    if($res_subject_insert == 200){
        echo "
        <script>
            alert('The Data is already Updated')
            window.location.href = 'subject.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'subject.php'
        </script>";
    }
}

// DELETE SUBJECT
if(isset($_GET['subject_id'])){

    $id = $_GET['subject_id'];
    $delete_subject = new Subject();
    $result_delete  = $delete_subject->delete_Subject($id);

    if($result_delete == 200){
        echo "
        <script>
            alert('The Data is already Deleted')
            window.location.href = 'subject.php'
        </script>";
    }else{
        echo "
        <script>
            alert('ERROR')
            window.location.href = 'subject.php'
        </script>";
    }
}

?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div class="admission-application-container">
    <div class="sub-admission-container">
        <div class="admission-header">
            <label for="">List of Subjects</label>
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
                    href="#" onclick="open_course()">New Subject</a>  
                </div> 
                <form action="subject.php" method="POST">
                    <input type="text" name="search_name" placeholder="Search Subject: ">
                    <button type="submit" name="src-submit"><i class="bi bi-search"></i></button>
                </form>
            </div>
            <div class="admission-content-body">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th >Subject Name</th>
                            <th >Subject Code</th>
                            <th >Description</th>
                            <th >Unit</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <?php foreach($result_list as $data){?>
                    <tbody>
                        <tr>
                            <td><?php echo $data['subject_id']; ?></td>
                            <td><?php echo $data['subject_name']; ?></td>
                            <td><?php echo $data['subject_code']; ?></td> 
                            <td><?php echo $data['subject_description']; ?></td>
                            <td><?php echo $data['subject_unit']; ?></td>
                            <td>
                                <a href="#" onclick="update_subject(
                                '<?php echo $data['subject_id']; ?>',
                                '<?php echo $data['subject_name']; ?>',
                                '<?php echo $data['subject_code']; ?>',
                                '<?php echo $data['subject_description']; ?>',
                                '<?php echo $data['subject_unit']; ?>'
                                )">
                                <img class="act-icons" src="../../Icons/edit.png" alt="" srcset=""></a>
                                <a href="subject.php?subject_id=<?php echo $data['subject_id']; ?>"><img class="act-icons" src="../../Icons/delete.png" alt="" srcset=""></a>
                            </td>
                        </tr>
                    </tbody>
                    <?php  } ?>
                
                   
                </table>
            </div>
        </div> 
    </div> 
</div>

<!-- CREATE SUBJECT MODAL -->
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
                        '>Create a Subject</label>
            </div>
            <form action="subject.php" method="POST">
                <div class="con-inp-sub">
                    <input type="text" class="sub-name" name="sub-name" placeholder="Subject Name:"> 
                </div>
                <div class="con-inp-sub" id="con-sub">
                    <input type="text" class="sub-code" name="sub-code" placeholder="Subject Code:"> 
                    <input type="text" class="sub-unit" name="sub-unit" placeholder="Subject Unit:"> 
                </div>
                <div class="con-inp-sub" id="sub-textarea">
                    <textarea name="sub-description" id="" cols="30" rows="10" placeholder="Description: "></textarea>
                </div>
                <div class="con-inp-sub" id="btn-subj">
                    <button type="submit" name="submit-subject">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- UPDATE SUBJECT MODAL -->
<div class="modal" id="update-subject">
    <div class="modal-container"> 
        <div class="header-course">
             <a href="javascript: close_subject_update()"><img class="close-course" src="../../Icons/close.png" alt="" srcset=""></a>
        </div>
        <div class="body-course">
             <div style=" padding: 1rem 0 0 0 ; display: flex; justify-content: center; align-items: end; " >
                        <label 
                        style='
                        font-size: 16px;
                        font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-weight: bold;
                        '>Update Subject</label>
            </div>
            <form action="subject.php" method="POST">
                <div class="con-inp-sub">
                    <input type="text" class="sub-name" id="sub-name" name="sub-name" placeholder="Subject Code:">
             
                </div>
                <div class="con-inp-sub" id="con-sub">
                     <input type="text" class="sub-id" id="sub-id" name="sub-id" hidden > 
                    <input type="text" class="sub-code" id="sub-code" name="sub-code" placeholder="Subject Code:"> 
                    <input type="text" class="sub-unit" id="sub-unit" name="sub-unit" placeholder="Subject Unit"> 
                </div>
                <div class="con-inp-sub" id="sub-textarea">
                    <textarea name="sub-description" class="description" id="sub-des" cols="30" rows="10" placeholder="Description: "></textarea>
                </div>
                <div class="con-inp-sub" id="btn-subj">
                    <button type="submit" name="update-subject" >Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>


<script>
    // CREATE MODAL
    let openModal = document.querySelector('.modal');
    function open_course(){
        openModal.style.display ="Flex";
    }
    function close_course(){
        openModal.style.display ="None";
    } 

    let SubjectUpdate = document.querySelector('#update-subject');
    function update_subject(id,name,code,description,unit){
        SubjectUpdate.style.display ="Flex";
        let Sname = document.querySelector('#sub-name');
        let Scode = document.querySelector('#sub-code');
        let Sunit = document.querySelector('#sub-unit');
        let Sdescription = document.querySelector('#sub-des');
        let Sid = document.querySelector('#sub-id');
        
        Sid.value = id;
        Sname.value = name;
        Scode.value = code;
        Sunit.value = unit;
        Sdescription.value = description;
    }

    function close_subject_update(){
        SubjectUpdate.style.display ="None";
    } 
</script>




