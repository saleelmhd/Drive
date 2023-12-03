<?php
include 'connect.php';
$type = $_POST['type'];
$name = $_POST['name'];
$age = $_POST['age'];
$sex = $_POST['sex'];
$email = $_POST['email'];
$mob = $_POST['phone'];
$address = $_POST['address'];
$joineddate = $_POST['joineddate'];
$vehicle = $_POST['vehicle'];
$genID = $_POST['gen_ID'];
$AdminID = $_POST['AdminID'];



$userid = mysqli_insert_id($con);

$sql1 = mysqli_query($con, "INSERT INTO user_tb(role,name,age,sex,email,phone,address,password,joineddate,selected_veh,generated_id,driving_school_id,admin_id)values('$type','$name','$age','$sex','$email','$mob','$address','12345','$joineddate','$vehicle','$genID','$userid','$AdminID')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>