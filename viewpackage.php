<?php
include 'connect.php';
$sql = mysqli_query($con,"SELECT * FROM package_tb;");
$list = array();
if ($sql->num_rows > 0) {
    while ($rows = mysqli_fetch_assoc($sql)) {


        $my_array['result'] = "Success";
        $my_array['id'] =$rows['package_id'];
        $my_array['pname'] = $rows['package_name/type'];
        $my_array['price'] = $rows['price'];
        
        $my_array['duration'] = $rows['duration'];
        


        array_push($list, $my_array);

    }
} else {

    $my_array['result'] = "Failed";
    array_push($list, $my_array);

}

echo json_encode($list);
?>