<?php
include 'connect.php';
$sql = mysqli_query($con,"SELECT user_id,name,joineddate,img FROM user_tb WHERE role='Tutor' ORDER BY `user_tb`.`user_id` DESC;");
$list = array();
if ($sql->num_rows > 0) {
    while ($rows = mysqli_fetch_assoc($sql)) {


        $my_array['result'] = "Success";
        $my_array['user_id'] =$rows['user_id'];
        $my_array['img'] =$rows['img'];
        $my_array['name'] = $rows['name'];
        $my_array['joineddate'] = $rows['joineddate'];
        


        array_push($list, $my_array);

    }
} else {

    $my_array['result'] = "Failed";
    array_push($list, $my_array);

}

echo json_encode($list);
?>