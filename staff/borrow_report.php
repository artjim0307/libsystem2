<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition skin-purple-light sidebar-mini">
<div class="wrapper">

  <?php include 'includes/navbar.php'; ?>
  <?php include 'includes/menubar.php'; ?>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
       Borrowed  Books Report
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>Reports</li>
        <li class="active">Borrowed  Books Report</li>
      </ol>
    </section>
    <!-- Main content -->
    <section class="content">
      <?php
        if(isset($_SESSION['error'])){
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              ".$_SESSION['error']."
            </div>
          ";
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
        <div class="col-xs-16">
          <div class="box">
            <div class="box-header with-border">
                       
                        <ul class="nav navbar-right panel_toolbox">
                            <li>
							<button class="btn btn-danger"><i class="fa fa-print"></i> Print</button>
							</a>
							</li>
                        
                        <!-- If needed 
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    <i class="fa fa-wrench"></i>
                                </a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a></li>
                                    <li><a href="#">Settings 2</a></li>
                                </ul>
                            </li>
						-->
                         
                        </ul>
                        <div class="clearfix"></div>
						<span style="float:left;">
				    <?php 
					$count = mysqli_fetch_array(mysqli_query($conn,"SELECT COUNT(*) as total FROM `borrowed_books` ")) or die(mysqli_error());
				
					?>
						
							<a href="Borrowed_report.php"><button class="btn btn-success"><i class="fa fa-info"></i> Borrowed Report(<?php echo $count['total']; ?>)</button></a>
							
						</span>
            
                  <?php 
					$count = mysqli_fetch_array(mysqli_query($conn,"SELECT COUNT(*) as total FROM `borrow_book`")) or die(mysqli_error());
				
					?>
						
							<a href="return_report.php"><button class="btn btn-warning"><i class="fa fa-info"></i>Returned Report (<?php echo $count['total']; ?>)</button></a>
							
						</span> 
           
            <?php 
					$count = mysqli_fetch_array(mysqli_query($conn,"SELECT COUNT(*) as total FROM `books` where stats = 'Archieved'")) or die(mysqli_error());
        
				
					?>
						
							<a href="borrow_report.php"><button class="btn btn-info"><i class="fa fa-info"></i> Borrow Report (<?php echo $count['total']; ?>)</button></a>
                
						</span>
         
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <!-- content starts here -->

						<div class="table-responsive">
							<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
								
							<thead>
								<tr>
									<th>Members Name</th>
									<th>Book Title</th>
									<th>Task</th>
									<th>Person In Charge</th>
									<th>Date Transaction</th>
								</tr>
							</thead>
							<tbody>
							
							<?php
							$result= mysqli_query($conn,"select * from borrowed_books 
							LEFT JOIN books ON borrowed_books.book_id = books.id 
              LEFT JOIN bookinformation ON bookinformation.isbn = books.isbn 
							LEFT JOIN students ON borrowed_books.student_id = students.student_id 
							where detail_action = 'Borrowed Book'
							order by borrowed_books.report_id DESC ") or die (mysqli_error());
							while ($row= mysqli_fetch_array ($result) ){
							$id=$row['report_id'];
							$id=$row['id'];
							$student_id=$row['firstname']." ".$row['middlename']." ".$row['lastname'];
							
							?>
							<tr>
								<td><?php echo $student_id; ?></td>
								<td><?php echo $row['title']; ?></td>
								<td><?php echo $row['detail_action']; ?></td>
								<td><?php echo $row['admin_name']; ?></td> 
								<td><?php echo date("M d, Y h:m:s a",strtotime($row['date_transaction'])); ?></td>
							</tr>
							<?php } ?>
							</tbody>
							</table>
						</div>
						
                        <!-- content ends here -->
                    </div>
                </div>
            </div>
        </div>
        </div>
      </div>
    </section>   
  </div>
    
  <?php include 'includes/footer.php'; ?>
  <?php include 'includes/book_modal.php'; ?>
</div>
<?php include 'includes/scripts.php'; ?>
<script>
$(function(){
  $('#select_category').change(function(){
    var value = $(this).val();
    if(value == 0){
      window.location = 'book.php';
    }
    else{
      window.location = 'book.php?category='+value;
    }
  });

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#edit').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });

  $(document).on('click', '.edit', function(e){
    e.preventDefault();
    $('#delete').modal('show');
    var id = $(this).data('id');
    getRow(id);
  });
});

function getRow(id){
  $.ajax({
    type: 'POST',
    url: 'book_row.php',
    data: {id:id},
    dataType: 'json',
    success: function(response){
      $('.bookid').val(response.bookid);
      $('#edit_isbn').val(response.isbn);
      $('#edit_title').val(response.title);
      $('#catselect').val(response.category_id).html(response.name);
      $('#edit_author').val(response.author);
      $('#edit_publisher').val(response.publisher);
      $('#datepicker_edit').val(response.publish_date);
      $('#del_book').html(response.title);
    }
  });
}
</script>
</body>
</html>
