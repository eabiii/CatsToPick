<?php
session_start();
$user=$_SESSION['user'];
$id=$_SESSION['userid'];
require_once('../mysql_connect.php');

if (isset($_POST['submit'])){
    $fname=$_POST['fname'];
    $lname=$_POST['lname'];

 //   $query="select * from users where username='$user'";
//     $result=mysqli_query($dbc,$query);
   
 //   while($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
 //       $test=$row['first_name']; 
 //   }
  //  if ($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
        $query="UPDATE users SET first_name='".$fname."', last_name='".$lname."' WHERE userID='".$id."'";
      //  UPDATE `webtech`.`users` SET `first_name`='e', `last_name`='d' WHERE `userID`='3';
        $result=mysqli_query($dbc,$query);
        if($result){
         header("Location: http://".$_SERVER['HTTP_HOST'].  dirname($_SERVER['PHP_SELF'])."/User_Homepage.php");
        }
        else{
            $test="non";
        }
    }
    
//}

?>
<html>
<head>
<script src="js/jquery-3.2.1.js"></script>
<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/kwees-setup.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/kwees-bootstrap.min.css">
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h4 class="text-center login-title">Account Setup</h4>
            <div class="account-wall">
                <img class="profile-img" src="img/cat_logo.png"
                    alt="">
					<button class="btn btn-lg btn-primary btn-block" id="upload">Upload Avatar Photo</button>
                <form class="form-signin" action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
                <input type="text" name="fname" class="form-control" placeholder="First Name" required autofocus>
                <input type="text" name="lname" class="form-control" placeholder="Last Name" required>
				<p>Gender<?php echo $id?></p>
				<div id="radio">
					<input type="radio" id="radio1" name="gender" value="1"><label for="radio1">Male</label>
					<input type="radio" id="radio2" name="gender" value="2" checked="checked"><label for="radio2">Female</label>
				</div><br>
				<p>Birthdate<?php echo $test;?></p>
				<input type=date name="date" class="form-control" required>
				<br>
                <button type="submit" name="submit" class="btn btn-primary btn-block">Finish</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>