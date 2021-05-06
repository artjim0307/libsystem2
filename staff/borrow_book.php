<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-purple-light sidebar-mini">
<meta name="viewport" content="width=device-width, initial-scale=1">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>
  <?php 
	$student_id = $_GET['student_id'];
	
	$students_query = mysqli_query($conn,"SELECT * FROM students WHERE student_id = '$student_id' ");
	$students_row = mysqli_fetch_array($students_query);

	$admin_id = $_SESSION["admin"];
?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Borrow Transaction
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>Circulation</li>
        <li class="active">Borrow</li>
        <li class="active">Borrow Transaction</li>
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
   
       
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="box">
            <div class="box-header with-border">
                <div class="x_panel">
                    <div class="x_title">
                <?php
						$sql = mysqli_query($conn,"SELECT * FROM students WHERE student_id = '$student_id' ");
						$row = mysqli_fetch_array($sql);
					?>
                    <h2>
					Borrower Name : <span style="color:red;"><?php echo $row['firstname']." ".$row['middlename']." ".$row['lastname']; ?></span>
					</h2>
                        
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <!-- content starts here -->
						<div class="table-responsive">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
								
							<thead>
								<tr>
									<th>Accesion</th>
									<th>Title</th>
									<th>Author</th>
									<th>ISBN</th>
									<th>Date Borrowed</th>
									<th>Due Date</th>
									<th>Penalty</th>
									<th>Action</th>
                  <?php 
								$borrow_query = mysqli_query($conn,"SELECT * FROM borrow_book
									LEFT JOIN books ON borrow_book.book_id = books.id
									RIGHT JOIN bookinformation ON bookinformation.isbn = books.isbn
									WHERE student_id = '".$students_row['student_id']."' && borrowed_status = 'borrowed' ORDER BY borrow_book_id DESC") or die(mysqli_error());
								$borrow_count = mysqli_num_rows($borrow_query);
								while($borrow_row = mysqli_fetch_array($borrow_query)){
									$due_date= $borrow_row['due_date'];
								
								$timezone = "Asia/Manila";
								if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone);
								$cur_date = date("Y-m-d H:i:s");
								$date_returned = date("Y-m-d H:i:s");
								//$due_date = strtotime($cur_date);
								//$due_date = strtotime("+3 day", $due_date);
								//$due_date = date('F j, Y g:i a', $due_date);
								///$checkout = date('m/d/Y', strtotime("+1 day", strtotime($due_date)));
								
								// PENALTY ------------------------------
									$penalty_amount_query= mysqli_query($conn,"select * from penalty order by penalty_id DESC ") or die (mysqli_error());
									$penalty_amount = mysqli_fetch_assoc($penalty_amount_query);
									
									if ($date_returned > $due_date) {
										$penalty = round((float)(strtotime($date_returned) - strtotime($due_date)) / (60 * 60 *24) * ($penalty_amount['penalty_amount']));
									} elseif ($date_returned < $due_date) {
										$penalty = 'No Penalty';
									} else {
										$penalty = 'No Penalty';
									}
							?>
      	</tr>
							</thead>
							<tbody>

              <tr>
								
								<td><?php echo $borrow_row['book_id']; ?></td>
								<td style="text-transform: capitalize"><?php echo $borrow_row['title']; ?></td>
								<td style="text-transform: capitalize"><?php echo $borrow_row['author']; ?></td>
								<td><?php echo $borrow_row['isbn']; ?></td>
								<td><?php echo date("M d, Y h:m:s a",strtotime($borrow_row['date_borrowed'])); ?></td>
								<?php
									if ($borrow_row['stats'] != 'Hardbound') {
										echo "<td>".date('M d, Y h:m:s a',strtotime($borrow_row['due_date']))."</td>";
									} else {
										echo "<td>".'Hardbound Book, Inside Only'."</td>";
									}
								?>
							<!---	<td><?php // echo date("M d, Y h:m:s a",strtotime($borrow_row['due_date'])); ?></td>	-->
								<?php
									if ($borrow_row['stats'] != 'Hardbound') {
										echo "<td>".$penalty."</td>";
									} else {
										echo "<td>".'Hardbound Book, Inside Only'."</td>";
									}
								?>
								<td><?php  echo $penalty; ?></td>
								<td>
								<form method="post" action="">
								<input type="hidden" name="date_returned" class="new_text" id="sd" value="<?php echo $date_returned ?>" size="16" maxlength="10"  />
								<input type="hidden" name="student_id" value="<?php echo $borrow_row['student_id']; ?>">
								<input type="hidden" name="borrow_book_id" value="<?php echo $borrow_row['borrow_book_id']; ?>">
								<input type="hidden" name="book_id" value="<?php echo $borrow_row['book_id']; ?>">
								<input type="hidden" name="date_borrowed" value="<?php echo $borrow_row['date_borrowed']; ?>">
								<input type="hidden" name="due_date" value="<?php echo $borrow_row['due_date']; ?>">
								<button name="return" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i> Return</button>
								</form>
								</td>
								
							</tr>
							
							<?php 
							}
							if ($borrow_count <= 0){
								echo '
									<table style="float:right;">
										<tr>
											<td style="padding:10px;" class="alert alert-danger">No books borrowed</td>
										</tr>
									</table>
								';
							} 							
							?>
              <!---- Return ----->
							<?php
								if (isset($_POST['return'])) {
									$student_id= $_POST['student_id'];
									$borrow_book_id= $_POST['borrow_book_id'];
									$book_id= $_POST['book_id'];
									$date_borrowed= $_POST['date_borrowed'];
									$due_date= $_POST['due_date'];
									$date_returned = $_POST['date_returned'];

									$count_of_books_available = mysqli_query($conn, "SELECT * FROM books WHERE stats = 'Available' AND id = '$book_id'") or die (mysqli_error());
									$copies_row= mysqli_fetch_assoc($count_of_books_available);
									
									$quantity = $copies_row['quantity'];
									$newquantity = $quantity + 1;
								
									if ($newquantity == '0') {
										$stats = 'Not Available ';
									} else {
										$stats = 'Available';
									}
								
									mysqli_query($conn,"UPDATE books SET stats = '$stats' where id = '$book_id' ") or die (mysqli_error());
								
									$timezone = "Asia/Manila";
									if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone);
									$cur_date = date("Y-m-d H:i:s");
									$date_returned_now = date("Y-m-d H:i:s");
									//$due_date = strtotime($cur_date);
									//$due_date = strtotime("+3 day", $due_date);
									//$due_date = date('F j, Y g:i a', $due_date);
									///$checkout = date('m/d/Y', strtotime("+1 day", strtotime($due_date)));			
									
									$penalty_amount_query= mysqli_query($conn,"select * from penalty order by penalty_id DESC ") or die (mysqli_error());
									$penalty_amount = mysqli_fetch_assoc($penalty_amount_query);
									
									if ($date_returned > $due_date) {
										$penalty = round((float)(strtotime($date_returned) - strtotime($due_date)) / (60 * 60 *24) * ($penalty_amount['penalty_amount']));
									} elseif ($date_returned < $due_date) {
										$penalty = 'No Penalty';
									} else {
										$penalty = 'No Penalty';
									}
								
									mysqli_query($conn,"UPDATE borrow_book SET borrowed_status = 'returned', date_returned = '$date_returned_now', book_penalty = '$penalty' WHERE borrow_book_id= '$borrow_book_id' and student_id = '$student_id' and book_id = '$book_id' ") or die (mysqli_error());
									
									mysqli_query($conn,"INSERT INTO return_book (student_id, book_id, date_borrowed, due_date, date_returned, book_penalty)
									values ('$student_id', '$book_id', '$date_borrowed', '$due_date', '$date_returned', '$penalty')") or die (mysqli_error());
									
									$report_history1=mysqli_query($conn,"select * from admin where id = $admin_id ") or die (mysqli_error());
									$report_history_row1=mysqli_fetch_array($report_history1);
									$admin_row1=$report_history_row1['firstname']." ".$report_history_row1['middlename']." ".$report_history_row1['lastname'];	
									
									mysqli_query($conn,"INSERT INTO returned_books 
									(book_id, student_id, admin_name, detail_action, date_transaction)
									VALUES ('$book_id','$user_id','$admin_row1','Returned Book',NOW())") or die(mysqli_error());

									
							?>			
									<script>

										window.location="borrow_book.php?student_id=<?php echo $student_id ?>";
									</script>
							<?php 
														}
							?>
							
							</tbody>
							</table>
						</div>



						
						<!---------------ACCESION----------------->
					<div class="row" style="margin-top:30px;">
						<form method="post">
							<div class="col-xs-4">
								<input type="number" style="margin-bottom:10px; margin-left:-9px;" class="form-control" name="id" placeholder="Enter Accesion Number Here....." 	 />
							</div>
						</form>
						<table class="table table-bordered">
							<form method="post" action="">
							<th>Accesion Number</th>
							<th>Title</th>
							<th>Author</th>
							<th>ISBN</th>
							<th>Status</th>
							<th>Action</th>
							<?php 
								if (isset($_POST['id'])){
									$id = $_POST['id'];
									$books_query = mysqli_query($conn, "SELECT *, books.id as book_id FROM books LEFT JOIN bookinformation ON books.isbn=bookinformation.isbn WHERE books.id = '$id'") or die (mysqli_error());
									$books_count = mysqli_num_rows($books_query);
									$books_row = mysqli_fetch_array($books_query);
									if ($books_row['book_id'] != $id){
										echo '
											<table>
												<tr>
													<td class="alert alert-info">No match for the accesion number!</td>
												</tr>
											</table>
										';
									} elseif ($id == '') {
										echo '
											<table>
												<tr>
													<td class="alert alert-info">Enter the correct details!</td>
												</tr>
											</table>
										';
									}else{
						
							?>
							<tr>
							<input type="hidden" name="student_id" value="<?php echo $students_row['student_id'] ?>">
							<input type="hidden" name="book_id" value="<?php echo $books_row['book_id'] ?>">	
							<td><?php echo $books_row['id'] ?></td>
							<td style="text-transform: capitalize"><?php echo $books_row['title'] ?></td>
							<td style="text-transform: capitalize"><?php echo $books_row['author'] ?></td>
							<td><?php echo $books_row['isbn'] ?></td>
							<td><?php echo $books_row['stats'] ?></td>
							<td><button name="borrow" class="btn btn-info"><i class="fa fa-check"></i> Borrow</button></td>
							</tr>
							<?php } }?>

							<?php
							
							$allowable_days_query= mysqli_query($conn,"select * from allowed_days order by allowed_days_id DESC ") or die (mysqli_error());
							$allowable_days_row = mysqli_fetch_assoc($allowable_days_query);
							
							$timezone = "Asia/Manila";
							if(function_exists('date_default_timezone_set')) date_default_timezone_set($timezone);
							$cur_date = date("Y-m-d H:i:s");
							$date_borrowed = date("Y-m-d H:i:s");
							$due_date = strtotime($cur_date);
							$due_date = strtotime("+".$allowable_days_row['no_of_days']." day", $due_date);
							$due_date = date('Y-m-d H:i:s', $due_date);
							///$checkout = date('m/d/Y', strtotime("+1 day", strtotime($due_date)));
							?>
							<input type="hidden" name="due_date" class="new_text" id="sd" value="<?php echo $due_date ?>" size="16" maxlength="10"  />
							<input type="hidden" name="date_borrowed" class="new_text" id="sd" value="<?php echo $date_borrowed ?>" size="16" maxlength="10"  />
							
							<?php 
								if (isset($_POST['borrow']))
								{
									$student_id =$_POST['student_id'];
									$book_id =$_POST['book_id'];
									$date_borrowed =$_POST['date_borrowed'];
									$due_date =$_POST['due_date'];
								
									$trapBookCount= mysqli_query($conn,"SELECT count(*) as books_allowed from borrow_book where student_id = '$student_id' and borrowed_status = 'borrowed'") or die (mysqli_error()); 
									
									$countBorrowed = mysqli_fetch_assoc($trapBookCount);
									
									$bookCountQuery= mysqli_query($conn,"SELECT count(*) as book_count from borrow_book where student_id = '$student_id' and borrowed_status = 'borrowed' and book_id = $book_id") or die (mysqli_error());
									
									$bookCount = mysqli_fetch_assoc($bookCountQuery);
									
									$allowed_book_query= mysqli_query($conn,"select * from allowed_book order by allowed_book_id DESC ") or die (mysqli_error());
									$allowed = mysqli_fetch_assoc($allowed_book_query);
									
									if ($countBorrowed['books_allowed'] == $allowed['qntty_books'])
									{
										echo "<script>alert(' ".$allowed['qntty_books']." ".'Books Allowed per User!'." '); window.location='borrow_book.php?student_id=".$student_id."'</script>";
									}
									elseif ($bookCount['book_count'] == 1)
									{
										echo "<script>alert('Book Already Borrowed!'); window.location='borrow_book.php?student_id=".$student_id."'</script>";
									}
									else
									{
										$count_of_books_available = mysqli_query($conn, "SELECT IFNULL(SUM(quantity),0) AS quantity FROM books WHERE stats = 'Available' AND id = '$book_id'") or die (mysqli_error());
										$copies_row= mysqli_fetch_assoc($count_of_books_available);
										
										$quantity = $copies_row['quantity'];

										if ($quantity <= 0)
										{
											echo "<script>alert('Book out of Copy!'); window.location='borrow_book.php?student_id=".$student_id."'</script>";
										}
										else
										{ 
											//update stats
											$result = mysqli_query($conn,"UPDATE `books` SET `stats` = 'Not Available' WHERE `books`.`id` = '$book_id'") or die (mysqli_error());
											if($result)
											{
												$result2 = mysqli_query($conn,"INSERT INTO borrow_book(student_id,book_id,date_borrowed,due_date,borrowed_status) VALUES('$student_id','$book_id','$date_borrowed','$due_date','borrowed')") or die (mysqli_error());
												if($result2)
												{
													$result3 = mysqli_query($conn,"INSERT INTO borrow_report(student_id,book_id,date_borrowed,due_date,borrowed_status)	VALUES('$student_id','$book_id','$date_borrowed','$due_date','borrowed')") or die (mysqli_error());
													if($result3)
													{
														$report_history=mysqli_query($conn,"select * from admin where id = $admin_id ") or die (mysqli_error());
														$report_history_row=mysqli_fetch_array($report_history);
														$admin_row=$report_history_row['firstname']." ".$report_history_row['middlename']." ".$report_history_row['lastname'];	
														
														mysqli_query($conn,"INSERT INTO borrowed_books
														(book_id, student_id, admin_name, detail_action, date_transaction)
														VALUES ('$book_id','$student_id','$admin_row','Borrowed Book',NOW())") or die(mysqli_error());

														mysqli_query($conn,"INSERT INTO borrowed_report
														(book_id, student_id, admin_name, detail_action, date_transaction)
														VALUES ('$book_id','$student_id','$admin_row','Borrowed Book',NOW())") or die(mysqli_error());
													}
												}
											}
										}
									}
									
							?>
									<script>
										window.location="borrow_book.php?id=<?php echo $id ?>";
									</script>
							<?php	
								}
							?>
							</form>
						</table>
						
					</div>
				</div>
					</div>
				</div>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
    </section>   
  </div>
    
  <?php include 'includes/footer.php'; ?>
 
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
  $(document).on('click', '#append', function(e){
    e.preventDefault();
    $('#append-div').append(
      '<div class="form-group"><label for="" class="col-sm-3 control-label">Accesion Number</label><div class="col-sm-5"><input type="text" class="form-control" name="accesion[]"></div></div>'
    );
  });
});

</script>
</body>
</html>
