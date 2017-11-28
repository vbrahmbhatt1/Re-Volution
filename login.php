<?php

session_start();

if( isset($_SESSION['user_id']) ){
	header("Location: index.php");
}

require 'database.php';

if(!empty($_POST['email']) && !empty($_POST['password'])):

	$bids = $conn->prepare('SELECT id,email,password FROM users WHERE email = :email');
	$bids->bindParam(':email', $_POST['email']);
	$bids->execute();
	$results = $bids->fetch(PDO::FETCH_ASSOC); //store the results, fetch the results

  $message = '';

  if(count($results) > 0 && password_verify($_POST['password'], $results['password'])){
    $_SESSION['user_id'] = $results['id'];
		header("Location: index.php");

	} else {
		$message = 'Error: Login failure';
	}

endif;
 ?>


<!DOCTYPE html>
<html>
<head>
  <title>Please Login</title>
  <link rel="stylesheet" type="text/css" href="css/login.scss">
<link href='http://fonts.googleapis.com/css?family=Papyrus' rel='stylesheet' type='text/css'>
</head>
<body>
	<h1>Login</h1>
	<a href="register.php">Register Here!</a>
  <form action="login.php" method="POST">
		<input type="text" placeholder="Your Email Please" name="email">
		<input type="password" placeholder="Password" name="password">
		<input type="submit">
	</form>

	<?php if(!empty($message)): ?>
		<p><?= $message ?></p>
	<?php endif; ?>

</body>
</html>
