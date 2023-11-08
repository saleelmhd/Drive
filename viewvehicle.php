<?php
include 'connect.php';
$sql = mysqli_query($con, "SELECT make,model,img,license_plate FROM vehicle_tb");
$list = array();
if ($sql->num_rows > 0) {
    while ($rows = mysqli_fetch_assoc($sql)) {
        $my_array['result'] = "Success";
        $my_array['make'] = $rows['make'];
       $my_array['model'] = $rows['model'];
       $my_array['img'] = $rows['img'];
       $my_array['license_plate'] = $rows['license_plate'];
        array_push($list,$my_array);

    }
} else {

    $my_array['result'] = "Failed";
    array_push($list, $my_array);

}

echo json_encode($list);
?>