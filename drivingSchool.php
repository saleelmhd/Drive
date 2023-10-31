<?php
include 'connect.php';
// $name = $_POST['name'];
// $name = $_POST['place'];
// $mob = $_POST['phone'];

$sql1 = mysqli_query($con, "INSERT INTO driving_school_tb(name,address,phone_no)values('ABC','Palakkad','1234567890')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>