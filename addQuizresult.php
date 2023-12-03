<?php
include 'connect.php';
$totel_question = $_POST['totel_question'];
$score = $_POST['score'];
$correct_ans = $_POST['correct_ans'];
$wrong_ans = $_POST['wrong_ans'];
$completion = $_POST['completion'];
$user_id = $_POST['user_id'];


// $userid = mysqli_insert_id($con);

$sql1 = mysqli_query($con, "INSERT INTO learners_test_tb(totel_question,score,correct_ans,wrong_ans,completion,user_id)values('$totel_question','$score','$correct_ans','$wrong_ans','$completion','$user_id')");


if ($sql1) {
    $my_array['result'] = "Success";
} else {
    $my_array['result'] = "Failed";
}
echo json_encode($my_array);


?>