<!DOCTYPE html>
<html lang="en" class="no-js">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Music Giant</title>
		<link rel="shortcut icon" href="../favicon.ico">
		<link rel="stylesheet" type="text/css" href="css/normalize.css" />
		<link rel="stylesheet" type="text/css" href="css/layout-simple.css" />
	</head>
	<body>
		<div id="container" class="container">
			<header class="intro">
				<img class="intro__image" src="images/1.jpg" >
				<div class="intro__content">
					<h1 class="intro__title">Re-Volution</h1>
					<div class="intro__subtitle">
							<button class="trigger">
							<svg width="100%" height="100%" viewBox="0 0 60 60" preserveAspectRatio="none">
								<g class="icon icon--grid">
									<rect x="30" y="5.5" width="20" height="20"/>
									<rect x="4" y="5.5" width="20" height="20"/>
									<rect x="30" y="33.5" width="20" height="20"/>
									<rect x="4" y="33.5" width="20" height="20"/>
								</g>
								<g class="icon icon--cross">
									<line x1="4.5" y1="55.5" x2="54.953" y2="5.046"/>
									<line x1="54.953" y1="55.5" x2="4.5" y2="5.047"/>
								</g>
							</svg>
							<span>View content</span>
						</button>
					</div>
				</div><!-- /intro__content -->
			</header><!-- /intro -->
			<section class="items-wrap">
				<a href="#" class="item">
					<img class="item__image" src="images/ice/1.jpg">
					<h2 class="item__title">Sunny</h2></a>
				<a href="#" class="item">
					<img class="item__image" src="images/ice/5.jpg">
					<h2 class="item__title">Gloomy</h2></a>
				<a href="#" class="item">
					<img class="item__image" src="images/ice/3.jpg">
					<h2 class="item__title">Snowy</h2></a>
				<a href="#" class="item">
					<img class="item__image" src="images/ice/6.jpg">
					<h2 class="item__title">Icy</h2></a>
				<a href="#" class="item">
					<img class="item__image" src="images/ice/4.jpg">
					<h2 class="item__title">Windy</h2></a>
				<a href="#" class="item">
					<img class="item__image" src="images/ice/2.jpg">
					<h2 class="item__title">Rainy</h2></a>
			</section>
		</div><!-- /container -->
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
