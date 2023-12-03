<?php
include 'connect.php';
$uid = $_POST['uid'];

$img=$_FILES['image']['name'];
$imagepath='vehicles/'.$img;
$tmp_name=$_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagepath);



$sql1 = mysqli_query($con,"UPDATE user_tb SET img='$img' WHERE user_id='$uid'");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>