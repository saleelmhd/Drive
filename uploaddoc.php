<?php
include 'connect.php';
$name = $_POST['name'];


$user_id = $_POST['user_id'];

$img=$_FILES['image']['name'];
$imagepath='doc/'.$img;
$tmp_name=$_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name,$imagepath);

$userid = mysqli_insert_id($con);


$sql1 = mysqli_query($con,"INSERT INTO document_tb(doc_name,user_id,document_img)values('$name','$user_id','$img')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>