<?php
error_reporting(E_ALL ^ E_NOTICE); 

$weather=$_POST['weather'];

try
{
	echo "<script>console.log( 'Debug Objects: " . $weather . "' );</script>";
    $pdo = new PDO('mysql:host=localhost;dbname=revolution', 'root', '');
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->exec('SET NAMES "utf8"');

    $link = mysqli_connect("localhost", "root", "", "revolution");
    $query = "SELECT song_t.Name, song_t.SongLengthSeconds, song_t.Link, artist_t.ArtistName, song_t.SongID, playlistsongs_t.PlayListID FROM song_t 
    INNER JOIN artist_t on artist_t.ArtistID = song_t.ArtistID 
    INNER JOIN playlistsongs_t on playlistsongs_t.SongID = song_t.SongID
    WHERE song_t.SongID IN (
        SELECT playlistsongs_t.SongID from playlistsongs_t where playlistsongs_t.PlayListID =". $weather .
	")" . "AND playlistsongs_t.PlayListID=" . $weather;
	
	$songs = [];
	if (isset($weather)){
		$songs = mysqli_query($link, $query);
	}
}
catch (PDOException $e)
{
  $error = 'Unable to connect to the database server.';
  include 'error1.php';
  exit();
}

?>

<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Music Giant</title>
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/layout-simple.css" />
		<link rel="stylesheet" type="text/css" href="css/dotmenu.css" />
		<link rel="stylesheet" type="text/css" href="css/revolution.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script type="text/javascript" src="./js/scripts.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<div id="container" class="">
			<header class="intro">
				<img class="intro__image" src="images/1.jpg" >
				<div class="window-container valign">
					<div id="toggle" class="button_container">
						<span class="top"></span>
						<span class="top2"></span>
						<span class="middle"></span>
						<span class="bottom"></span>
						<span class="bottom2"></span>
					</div>
					<div id="overlay" class="overlay">
						<div class="overlay-menu">
							<ul>
                <li><a href="login.php" target="_blank">Login In</a></li>
                <li><a href="register.php" target="_blank">Register</a></li>
							</div>
						</div>
					</div>
				<section class="intro__content rev-basic-container">
					<article class="rev-item-70">
						<section class="rev-container-column">
							<article class="rev-item-100 rev-bottom-title">
								<h1 class="intro__title">Re-Volution</h1>
              </article>
							<article class="rev-item-100 rev-bottom">
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
							</article>
						</section>
					</article>
					<article class="rev-item-30">
						<section id="playlistcontainer" class="rev-container-column">

							<article class="rev-item-100">
								<audio id="player" controls style="width:100%;">
									<source id="playsong" src="" type="audio/ogg">
								</audio>
							</article>
						</section>
					</article>

				</section><!-- /intro__content -->
			</header><!-- /intro -->
			<form class="items-wrap" action="index.php" method="POST">
			
				<a href="#" class="item">
					<input type="image" class="item__image" src="images/ice/1.jpg" name="weather" value="1">
					<h2 onclick="changePlaylist(this)" class="item__title" name="1">Sunny</h2></a>
			
				<a href="#" class="item">
					<img class="item__image" src="images/ice/5.jpg">
					<h2 onclick="changePlaylist(this)" name="2" class="item__title">Gloomy</h2></a>

				<a href="#" class="item">
					<img class="item__image" src="images/ice/3.jpg">
					<h2 onclick="changePlaylist(this)" name="3" class="item__title">Snowy</h2></a>

				<a href="#" class="item">
					<img class="item__image" src="images/ice/6.jpg">
					<h2 onclick="changePlaylist(this)" name="4" class="item__title">Icy</h2></a>

				<a href="#" class="item">
					<img class="item__image" src="images/ice/4.jpg">
					<h2 onclick="changePlaylist(this)" name="5" class="item__title">Windy</h2></a>

				<a href="#" class="item">
					<img class="item__image" src="images/ice/2.jpg">
                    <h2 onclick="changePlaylist(this)" name="6" class="item__title">Rainy</h2></a>

                <a href="#" class="item">
					<img class="item__image" src="images/ice/2.jpg">
                    <h2 onclick="changePlaylist(this)" name="7" class="item__title">All Songs</h2></a>
			
			<a href="#" class="item">
				<img class="item__image" src="images/ice/2.jpg">
				<h2 onclick="changePlaylist(this)" class="item__title">Custom 2</h2></a>

                <a href="#" class="item">
					<img class="item__image" src="images/ice/2.jpg">
                    <h2 onclick="changePlaylist(this)" class="item__title">Custom 3</h2></a>

			</form>
		</div><!-- /rev-container -->
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
