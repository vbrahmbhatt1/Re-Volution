<?php

include('database.php');

	if (!isset($_SESSION['username'])) {
		header('location: login.php');
	}
	if (array_key_exists("logout", $_GET)){
		session_destroy();
		unset($_SESSION['username']);
		header("location: login.php");
	}?>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>About Re-Volution</title>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/layout-simple.css" />
		<link rel="stylesheet" type="text/css" href="css/about.css" />
	</head>
	<body>
		<div id="container" class="container">
			<header class="intro">
				<img class="intro__image" src="images/2.jpg" >
				<div class="intro__content">


					<div class="absolute">
					<?php if (isset($_SESSION['success'])) : ?>
						<div class="error success">
							<?php
								echo $_SESSION['success'];
								unset($_SESSION['success']);
								?>
						</div>
					<?php endif ?>
					<?php  if (isset($_SESSION['username'])) : ?>
						<h2>Welcome To Re-Volution
						<strong> <?php echo $_SESSION['username']; ?></strong>!
						<p><a href="about.php?logout='1'" style="color: black;">Exit Here!</a></p>
					<?php endif ?></h2>
				</div>



					<h1 class="intro__title">About Us</h1>
					<div class="intro__subtitle">
							<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<g class="icon icon--grid">
									<rect x="30" y="5.5" width="20" height="20"/>
									<rect x="4" y="5.5" width="20" height="20"/>
									<rect x="30" y="30" width="20" height="20"/>
									<rect x="4" y="30" width="20" height="20"/>
								</g>
								<g class="icon icon--cross">
									<line x1="4" y1="50" x2="50" y2="6"/>
									<line x1="50" y1="50" x2="4" y2="6"/>
								</g>
							</svg>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
		<section class="items-wrap">
			<a>
				<h4>Who Are We?</h4>
				<p style="margin-top:-15px;">
					Re-Volution is the go to place for your music. This web application has the music you are looking for any type of weather.
					We are trying to answer question: how can we appreciate music better?
					The better mood we’re in the better the music sounds.
					Most of the time our moods are affect by our environment and the location we live in.
					The weather plays a significant role in our mood.
					Therefore, based on strong research and traveling to
					many different and unique locations,
					we have come up with Re-Volution.
					We have total of six different moods and with each mood
					we have come up pre-loaded playlist and the option to customize each playlist.
					So, sit back, relax, and enjoy!
				</p>
				<h4 style="margin-top:-15px;">The Vision</h4>
				<p style="margin-top:-15px;">To enhance consumers' music experience and create value through data-driven technology.</p>
				<h4>The Motto</h4>
				<p style="margin-top:-15px;">Just Chill!</p></a>
		</section>
		<div class="footer">
			<center><a href="index.php">Home</a></center>
	</div>
	</div>
		<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
    <script  src="js/dotmenu.js"></script>
		<script src="js/classie.js"></script>
		<script>
			(function() {
				var container = document.getElementById( 'container' ),
					trigger = container.querySelector( 'button.trigger' );
				function toggleContent() {
					if( classie.has( container, 'container--open' ) ) {
						classie.remove( container, 'container--open' );
						classie.remove( trigger, 'trigger--active' );
						window.addEventListener( 'scroll', noscroll );
					}
					else {
						classie.add( container, 'container--open' );
						classie.add( trigger, 'trigger--active' );
						window.removeEventListener( 'scroll', noscroll );
					}
				}
				function noscroll() {
					window.scrollTo( 0, 0 );
				}
				// reset scrolling position
				document.body.scrollTop = document.documentElement.scrollTop = 0;
				// disable scrolling
				window.addEventListener( 'scroll', noscroll );
				trigger.addEventListener( 'click', toggleContent );
				[].slice.call( document.querySelectorAll('.items-wrap a') ).forEach( function(el) { el.onclick = function() { return false; } } );
			})();
		</script>
	</body>
</html>
