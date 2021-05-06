<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-purple-light sidebar-mini">
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="wrapper">

<?php include 'includes/navbar.php'; ?>
 <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Borrow 
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>Circulation</li>
        <li class="active">Borrow </li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <?php
        if(isset($_SESSION['error'])){
          ?>
            <div class="alert alert-danger alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
              <h4><i class="icon fa fa-warning"></i> Error!</h4>
                <ul>
                <?php
                  foreach($_SESSION['error'] as $error){
                    echo "
                      <li>".$error."</li>
                    ";
                  }
                ?>
                </ul>
            </div>
          <?php
          unset($_SESSION['error']);
        }

        if(isset($_SESSION['success'])){
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i> Success!</h4>
              ".$_SESSION['success']."
            </div>
          ";
          unset($_SESSION['success']);
        }
      ?>
  <div class= container-fluid>
  
  <div class="row">
        <div class="col-xs-50">
          <div class="box">
            <div class="box-header with-border">
            <div class="col-md-4"></div>
	            <div class="col-md-4">
            <form method="post" action="">
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

                <br>
                <br>
                <br>
                <h3>Enter Borrowers ID </h3>
                    <select name="student_id" class="select2_single form-control" required="required" tabindex="-1" >
										<option value="0">Select Borrowers ID Number</option>
                    <?php
                       $result= mysqli_query($conn,"select * from students where stats = 'Active' ") or die (mysqli_error());
                          $query = $conn->query($sql);
                          while ($row= mysqli_fetch_array ($result) ){
                            $id=$crow['id'];
                            ?>
                            <option value="<?php echo $row['student_id']; ?>"><?php echo $row['student_id']; ?> - <?php echo $row['firstname']; ?></option>

                            <?php } ?> 
                           
                     </select>
                     </br>
                     </br>
                     </br>
                     
                     <button name="submit" type="submit" class="btn btn-primary" style="margin-left:110px;"><i class="glyphicon glyphicon-log-in"></i> Submit</button>
             <br>
             
             <br>
             <br>
             <br>
             <br>

             <br>
             <br>
             <br>
             <br>

                 <br>
                 <br>
                     <br>
                     <br>     
                     <br>
                     <br>
                     <br>
                     <br>
                     <br>

              </form>

              <?php
include ('includes/conn.php');
	if (isset($_POST['submit'])) {

	$student_id = $_POST['student_id'];
  $sql = mysqli_query($conn,"SELECT * FROM students WHERE student_id = '$student_id' ");
  $count = mysqli_num_rows($sql);
  $row = mysqli_fetch_array($sql);

		if($count <= 0){
			echo "<div class='alert alert-success'>".'No match found for the School ID Number'."</div>";
		}else{
			$student_id = $_POST['student_id'];
			echo ('<script> location.href="borrow_book.php?student_id='.$student_id.'";</script>');
		}
	}
?>
            </div>
            <div class="col-md-4"></div>
          </div>
        </div>
      </div>
    </section>   
  </div>
    
  <?php include 'includes/footer.php'; ?>
 
</div>
<?php include 'includes/scripts.php'; ?>

</body>
</html>
