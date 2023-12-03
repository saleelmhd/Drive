<?php
include 'connect.php';

$uid = $_POST['uid'];
$name = $_POST['name'];
$address = $_POST['address'];
$age = $_POST['age'];
$date = $_POST['date'];
$gender = $_POST['gender'];
$number = $_POST['number'];

$sql1 = mysqli_query($con, "UPDATE user_tb SET name='$name', age='$age', sex='$gender', phone='$number', address='$address', joineddate='$date' WHERE user_id='$uid'");

if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}

echo json_encode($my_array);
?>
