<?php
include 'connect.php';
$uid = $_POST['uid'];


$sql = mysqli_query($con, "SELECT * FROM user_tb where user_id='$uid'");


$list = array();
if ($sql->num_rows > 0) {
    while ($rows = mysqli_fetch_assoc($sql)) {


        $my_array['result'] = "Success";
        $my_array['user_id'] = $rows['user_id'];
        $my_array['name'] = $rows['name'];
        $my_array['address'] = $rows['address'];
        $my_array['Age'] = $rows['age'];
        $my_array['gender'] = $rows['sex'];
        $my_array['joineddate'] = $rows['joineddate'];
        $my_array['phone'] = $rows['phone'];
        $my_array['email'] = $rows['email'];
        $my_array['selected_veh'] = $rows['selected_veh'];
        $my_array['password'] = $rows['generated_id'];




        array_push($list, $my_array);

    }
} else {

    $my_array['result'] = "Failed";
    array_push($list, $my_array);

}

echo json_encode($list);


?>