<?php
include 'connect.php';
// $type = $_POST['type'];
$name = $_POST['name'];
$model = $_POST['model'];
// $img = $_POST['img'];
$Lplate = $_POST['licenseplate'];
$year = $_POST['year'];
$vehicletype = $_POST['vehicletype'];
$AdminID = $_POST['AdminID'];

$img=$_FILES['image']['name'];
$imagepath='vehicles/'.$img;
$tmp_name=$_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagepath);

$userid = mysqli_insert_id($con);


$sql1 = mysqli_query($con,"INSERT INTO vehicle_tb(make,model,img,vehicle_type,year,license_plate,admin_id)values('$name','$model','$img','$vehicletype','$year','$Lplate','$AdminID')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>