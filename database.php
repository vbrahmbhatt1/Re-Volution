<?php

	session_start();

	//let's declare some variables
	//users, and email
	$error1 = array();
	$_SESSION['success'] = "";
	$username = "";
	$email    = "";

	//connect to MySQL
	$MySQL = mysqli_connect('localhost', 'king', '7Jj8bQbCmVd2nVkw', 'king_music');

	//Check connection
	if (mysqli_connect_errno()){
		echo 'Connection failed to the MySQL: '. mysqli_connect_errno();
		exit();
	}

	//user registered process
		if (isset($_POST['reg_user'])) {
		//using POST
		//mysqli_real_escape_string
		$password1 = mysqli_real_escape_string($MySQL, $_POST['password_1']);
		$username = mysqli_real_escape_string($MySQL, $_POST['username']);
		$password2 = mysqli_real_escape_string($MySQL, $_POST['password_2']);
		$email = mysqli_real_escape_string($MySQL, $_POST['email']);
		$hash = password_hash($_POST['password_1'], PASSWORD_BCRYPT);


		// check all the fields
		//array_push treat array like stack and push the pased variables to the
		//end of the array
		if (empty($password1)) {array_push($error1,"Enter Password,"); }
		if (empty($email)) {array_push($error1,"Email, and"); }
		if (empty($username)) {array_push($error1,"Username"); }
		if ($password1 != $password2) {array_push($error1, "Passwords must match");
		}//check if the password matches

		// register user if there are no errors in the form
		if (count($error1) == 0) {
			$mysql_query = "INSERT INTO User_t (username, email, password)
					  VALUES('$username', '$email', '$hash')";
			mysqli_query($MySQL, $mysql_query);

			$_SESSION['username'] = $username;
			$_SESSION['success'] = "Registered successfully, you also logged in";
			header('location: about.php');
		}}

	// LOGIN USER
	if (isset($_POST['login_user'])) {
		$username = mysqli_real_escape_string($MySQL, $_POST['username']);
		$password1 = mysqli_real_escape_string($MySQL, $_POST['password']);

		if (empty($username)) {array_push($error1, "Username");}
		if (empty($password1)) {array_push($error1, "and password please!");}

		if (count($error1) == 0) {
			$mysql_query = "SELECT * FROM User_t WHERE username='$username' AND password='$hash'";
			$results = mysqli_query($MySQL, $mysql_query);

			if (count($results) == 1) {
				$_SESSION['username'] = $username;
				$_SESSION['success'] = "Logged In";
				header('location: about.php');}
			else {array_push($error1, "Incorrect username or password");}}}?>
