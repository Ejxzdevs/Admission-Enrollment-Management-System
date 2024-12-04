<?php 
session_start();

if(!isset($_SESSION['id'])){
    header("Location: ../../User_Entry/login.php");
}


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../Layout/Layout.css">

    <link rel="stylesheet" href="../sidebar/sidebar.css">
    <link rel="stylesheet" href="public.css">
    <title>Public Notice</title>
<body>
    <div class="main-container">
        <div class="sidebar">
            <?php require_once "../sidebar/sidebar.php" ?>
        </div>
        <div class="header-content">
            <div class="header">
         
            </div>
            <div class="content">
                <?php include "public-content.php"; ?>
            </div>
        </div>
    </div>
    
</body>
    <script src="../sidebar/sidebar.js"></script>
   
</html>