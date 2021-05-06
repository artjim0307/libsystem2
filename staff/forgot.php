
<?php

session_start();

$cn=mysqli_connect("localhost", "root", "", "tab_db");

if(isset($_POST['fogo']))
{
    $fogsql = "SELECT username, password, secretq, answer FROM admin WHERE password='".$_POST['pass']."' 
    AND se='".$_POST['ques']."' AND answer='".$_POST['ques']."' AND username='".$_POST['un']."' ";
    
    $rslt=mysqli_query($cn, $fogsql);
    

if($_POST['npass'] === $_POST['pass'])
{

    if($row=mysqli_fetch_assoc($rslt))
    {
        $fogsql2 = "UPDATE admin SET password='".$_POST['pass']."' WHERE secretq='".$_POST['ques']."' AND answer='".$_POST['ques']."'
        AND username='".$_POST['un']."' ";
        
        if($cn->query($fogsql2) === TRUE)
        {
        echo " <script type='text/javascript'>alert('Password Reset Successful!')</script> ";
    
        echo " <script type='text/javascript'>window.location.replace('http://localhost/PROII/HomePage.php')</script> ";
        }
    }
    
    else
    {
    
        echo " <script type='text/javascript'>alert('Password Reset Unsuccessful! Try Again.')</script> ";
    
        echo " <script type='text/javascript'>window.location.replace('forgot_password.php')</script> ";
    
    }


}   
else
{
    echo " <script type='text/javascript'>alert('Password Verification Failed! Try Again')</script> ";

    echo " <script type='text/javascript'>window.location.replace('forgot_password.php')</script> ";
}

}


?>