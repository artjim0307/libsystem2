<?php 
	include ('includes/conn.php');
	
	if (isset($_POST['submit'])) {
	
	$student_id = $_POST['student_id'];
	
	$sql = mysqli_query($conn,"SELECT * FROM students WHERE student_id = '$student_id' ");
	$count = mysqli_num_rows($sql);
	$row = mysqli_fetch_array($sql);
	
		if($count <= 0){
			echo "<div class='alert alert-success'>".'No match found for the Student ID Number'."</div>";
		}else{
			$school_number = $_POST['student_id'];
			header('location: borrow_book.php?student_id='.$student_id);
		} 
	}
?>