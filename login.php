<?php
session_start();
 require_once('../mysql_connect.php');

if (isset($_POST['submit'])){
    $_SESSION['user']=$_POST['username'];
   $_SESSION['pass']=$_POST['pass'];
    
    $query='select * from users where username="'.$_SESSION["user"].'" and
         password="'.$_SESSION["pass"].'"';
    $result=mysqli_query($dbc,$query);
    if ($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
           
         $query='select * from users where username="'.$_SESSION["user"].'" and
         password="'.$_SESSION["pass"].'"';
        $result=mysqli_query($dbc,$query);
        while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
            $fname=$row['first_name'];
            $usertype=$row['user_type'];
            $id=$row['userID'];
            
        }
        if($fname=="fname"){ 
             $_SESSION['userid'] = $id;
            $_SESSION['user']=$_POST['username'];
            header("Location: http://".$_SERVER['HTTP_HOST'].  dirname($_SERVER['PHP_SELF'])."/setup.php");
           
        }
        else if($usertype=="1"){
            $_SESSION['user']=$fname;
                    header("Location: http://".$_SERVER['HTTP_HOST'].  dirname($_SERVER['PHP_SELF'])."/Admin_Homepage.php");

        }
        else{
            $_SESSION['userid'] = $row['userID'];
            $_SESSION['user']=$_POST['username'];
             header("Location: http://".$_SERVER['HTTP_HOST'].  dirname($_SERVER['PHP_SELF'])."/User_Homepage.php");
        }
        }
    else{
        echo '<script type="text/javascript"> alert("Username does not exist!")</script>';
        }
}
?>
<html>
<head>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/kwees-login.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/kwees-bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h4 class="text-center login-title">Cats to Pick</h4>
            <div class="account-wall">
                <img class="profile-img" src="img/cat_logo.png"
                    alt="">
                <form class="form-signin" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <input type="text" name="username" class="form-control" placeholder="Email" required autofocus>
                <input type="password" name="pass" class="form-control" placeholder="Password" required>
             <button type="submit" name="submit" class="btn btn-primary btn-block">Sign In</button>
                <label class="checkbox pull-left">
                    <input type="checkbox" value="remember-me">
                    Remember me
                </label>
                <a href="index.php" class="pull-right need-help">Back to Home</a><span class="clearfix"></span>
                </form>
            </div>
            <a href="register.php" class="text-center new-account">Create an account </a>
        </div>
    </div>
</div>
    
    <script>
	function validateForm() {
		var x = document.forms["login"]["userName"].value;
		var y = document.forms["login"]["pass"].value;
		if (x == "admin" && y == "1234") {
			return true;
		} else {
			alert("Incorrect Username/Password");
			return false;
		}
	}
	</script>
</body>
</html>