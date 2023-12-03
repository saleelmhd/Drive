<?php
include 'connect.php';
$stud_id = $_POST['stud_id'];
$tutor_id = $_POST['tutor_id'];
$date = $_POST['date'];
$time = $_POST['time'];


// $userid = mysqli_insert_id($con);

$sql1 = mysqli_query($con, "INSERT INTO session_tb(student_id,tutor_id,date,time)values('$stud_id','$tutor_id','$date','$time')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>