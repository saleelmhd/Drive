<?php
include 'connect.php';
$uid = $_POST['uid'];
$sql = mysqli_query($con, "SELECT * FROM document_tb where user_id='$uid'");
$list = array();
if ($sql->num_rows > 0) {
    while ($rows = mysqli_fetch_assoc($sql)) {
        $my_array['result'] = "Success";
        $my_array['doc_id'] = $rows['doc_id'];
        $my_array['doc_name'] = $rows['doc_name'];
       $my_array['document_img'] = $rows['document_img'];
      
        array_push($list,$my_array);

    }
} else {

    $my_array['result'] = "Failed";
    array_push($list, $my_array);

}

echo json_encode($list);
?>