<?php

session_start();

if( isset($_SESSION['user_id']) ){
	header("Location: index.php");
}

require 'database.php';

$message = '';

if(!empty($_POST['email']) && !empty($_POST['password'])):

  $sql = "INSERT INTO users (email, password) VALUES (:email, :password)";
	$inout = $conn->prepare($sql);

	$inout->bindParam(':email', $_POST['email']);
	$inout->bindParam(':password',$password );
	$password = password_hash($_POST['password'], PASSWORD_BCRYPT);

	if($inout->execute() ):
		$message = 'Successfully Registered';
	else:
		$message = 'Failed to Register';
	endif;

endif;
?>


<!DOCTYPE html>
<html>
<head>
  <title>Please Register</title>
  <link rel="stylesheet" type="text/css" href="css/login.scss">
<link href='http://fonts.googleapis.com/css?family=Papyrus' rel='stylesheet' type='text/css'>
</head>
<body>
  <h1>Register Here</h1>
  <a href="login.php">Login!</a>
  <form action="register.php" method="POST">
		<input type="text" placeholder="Your Email Please" name="email">
		<input type="password" placeholder="Password" name="password">
		<input type="password" placeholder="Confirm Password" name="confirm_password">
		<input type="submit">
	</form>
	<?php if(!empty($message)): ?>
		<p><?= $message ?></p>
	<?php endif; ?>
</body>
</html>
