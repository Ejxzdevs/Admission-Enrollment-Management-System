
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../Layout/Layout.css">
    <title>Enrollment Management System</title>
    <link rel="stylesheet" href="../sidebar/sidebar.css">
    <link rel="stylesheet" href="enrollment.css">
    <title>Enrollment_list</title>
<body>
    <div class="main-container">
        <div class="sidebar">
            <?php require_once "../sidebar/sidebar.php" ?>
        </div>
        <div class="header-content">
            <div class="header">
                <?php require_once "../navbar.php"; ?>
            </div>
            <div class="content">
                <?php include "enrollment-content.php"; ?>
            </div>
        </div>
    </div>
</body>

    <script src="../sidebar/sidebar.js"></script>
</html>