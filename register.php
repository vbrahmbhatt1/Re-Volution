<?php
include('database.php')
?>

<!DOCTYPE html>
<html>
<head>
	<title>Music Giant Registration</title>
	<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>
	<div class="header">
		<h2>Register Here!</h2>
	</div>
	<form method="post" action="register.php">
		<?php include('error1.php'); ?>
		<div class="input-group">
			<input type="text" name="username" style="color: red" placeholder="Username" value="<?php echo $username; ?>">
		</div>
		<div class="input-group">
			<input type="email" name="email" style="color: red" placeholder="Email" value="<?php echo $email; ?>">
		</div>
		<div class="input-group">
			<input type="password" style="color: red" placeholder="Password"name="password_1">
		</div>
		<div class="input-group">
			<input type="password" style="color: red" placeholder="Confirm password"name="password_2">
		</div>
		<div class="input-group">
			<button type="submit" class="button" name="reg_user">Click Me!</button>
		</div>
		<p style="color: white">
			Been here before? <p><a href="login.php" style="color: white;">Sign in</a><p>
		</p>
	</form>
</body>
</html>
