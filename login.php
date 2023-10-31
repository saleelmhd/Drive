<?php
include 'connect.php';
$type = $_POST['type'];
$email = $_POST['email'];
$genID = $_POST['gen_ID'];

$sql = mysqli_query($con, "SELECT * FROM user_tb where email='$email'and generated_id='$genID'and role='$type'");


if ($sql->num_rows > 0) {
    while ($row = mysqli_fetch_assoc($sql)) {
        $myarray['result'] = 'User successfully login';
        $myarray['log_id'] = $row['user_id'];

    }

} else {
    $myarray['result'] = 'Failed';
}
echo json_encode($myarray);
?>