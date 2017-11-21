<?php
 require_once('../mysql_connect.php');

if (isset($_POST['submit'])){
    $user=$_POST['user_name'];
    $email=$_POST['email'];
    $pass=$_POST['password'];
    
    $query="select userID from users where username='{$user}'";
    $result=mysqli_query($dbc,$query);
    if ($row=mysqli_fetch_array($result,MYSQLI_ASSOC)){
            echo '<script type="text/javascript"> alert("Username already exist!")</script>';
        }
    else{
        $query="insert into users(first_name,last_name,username, email, password,user_type) 
        values ('fname','lname','{$user}','{$email}','{$pass}',2)";
        $result=mysqli_query($dbc,$query);
        echo    '<script>window.location="login.php"</script>';
        
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
        <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
        	<div class="panel panel-default">
        		<div class="panel-heading">
			    		<h3 class="panel-title">Create an account</h3>
			 			</div>
			 			<div class="panel-body">
			    		<form role="form"action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
			    			<div class="row">
			    				<div class="col-xs-12 col-sm-12 col-md-12">
			    					<div class="form-group">
			                <input type="text" name="user_name" id="user_name" class="form-control input-sm" placeholder="Username" required>
			    					</div>
			    				</div>
			    			</div>

			    			<div class="form-group">
			    				<input type="email" name="email" id="email" class="form-control input-sm" placeholder="DLSU Email Address" required>
			    			</div>

			    			<div class="row">
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password" id="password" class="form-control input-sm" placeholder="Password" required>
			    					</div>
			    				</div>
			    				<div class="col-xs-6 col-sm-6 col-md-6">
			    					<div class="form-group">
			    						<input type="password" name="password_confirmation" id="password_confirmation" class="form-control input-sm" placeholder="Confirm Password" required>
			    					</div>
			    				</div>
			    			</div>
                             <button type="submit" name="submit" class="btn btn-primary btn-block">Register</button>
							<a href="login.html" class="btn btn-info btn-block">Already have an account?</a>
			    		</form>
			    	</div>
	    		</div>
    		</div>
    	</div>
    </div>
</body>
</html>