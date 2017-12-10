<?php
include('database.php')
?>
<!DOCTYPE html>
<html>
<head>
	<title>Music Giant Login</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="header">
		<h2>Login</h2></div>
	<form method="post" action="login.php">
		<?php include('error1.php');?>
		<div class="input-group">
			<input type="text" placeholder="Username" name="username" >
		</div>
		<div class="input-group">
			<input type="password" placeholder="Password" name="password">
		</div>
		<div class="input-group">
			<button type="submit" class="button" name="login_user">Let's go!</button>
		</div>
		<p>Become a member? <p><a href="register.php">Sign up Here!</a></p></p>
	</form>
</body>
</html>
