<?php include 'includes/header.php'; ?>


<body class="hold-transition login-page">
<div class="wrapper">
<div class="login-box">
  	<div class="login-logo">

      <b>Dalahican Elementary School </b>
  	</div>
  
  	<div class="login-box-body">
    	<p class="login-box-msg">Forgot Password</p>


<form id="fogform" method="POST" action ="forgot.php">
  <div class="form-group row">
    <label for="un" class="col-form-label col-md-6">Username:
                                        </label>
    <div class="col-md-6">
      <input type="text" class="form-control" name="un" placeholder="Enter your username" required>
    </div>
  </div>

  <div class="form-group">
    <div class="row">
      <label class="col-form-label col-md-6" for="ques">Security
                                                Question:</label>
      <div class="col-md-6">
        <select name="ques" class="form-control" required>
          <option value="" selected>Choose any:</option>
          <option value="In which city you were
                                                    born?">In which city you were born?
          </option>
          <option value="What was your first
                                                    pet's name?">What was your first pet's name?</option>
        </select>
      </div>
    </div>
  </div>

  <div class="form-group row">
    <label for="answer" class="col-form-label col-md-6">Your Answer:
                                        </label>
    <div class="col-md-6">
      <input type="text" class="form-control" name="answer" placeholder="Enter your answer" required>
    </div>
  </div>

  <div class="form-group row">
    <label for="npwd" class="col-form-label col-md-6">New Password:
                                        </label>
    <div class="col-md-6">
      <input type="password" class="form-control" name="npass" placeholder="Enter a New Password" required>
    </div>
  </div>

  <div class="form-group row">
    <label for="rpwd" class="col-form-label col-md-6">Retype Password:
                                        </label>
    <div class="col-md-6">
      <input type="password" class="form-control" name="pass" placeholder="Retype the password" required>
    </div>
  </div>
  <div class="row">
    <div class="col-md-5 offset-2">
      <button type="reset" class="btn btn-info">Reset</button>
      </div> 
    
      <button type="submit" name="fogo" class="btn btn-success" data-toggle="modal" data-target="#infomod" form="fogform">Submit</button>

                 <a class="btn btn-danger" href="index.php" role="button">Back</a>
      
    </div>
  </div>

</form>
</div>
    </div>
  </div>

<?php include 'includes/scripts.php' ?>



<script>
function goBack() {
  window.history.back();
}
</script>
