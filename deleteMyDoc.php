<?php
include 'connect.php';
$doc_id = $_POST['doc_id'];
$sql = mysqli_query($con, "DELETE  FROM document_tb where doc_id='$doc_id'");
if ($sql) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}

echo json_encode($my_array);
?>