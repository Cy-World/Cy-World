<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<title>TopPage|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<!-- CustomImport -->
<link href="css/index.css" type="text/css" rel="stylesheet" />
<link href="css/top.css" type="text/css" rel="stylesheet"
	media="screen,projection" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/materialize/materialize.js"></script>
<script src="js/materialize/init.js"></script>
</head>

<body class="grey lighten-4">

	<!-- GlobalNavi -->
	<nav>
		<div class="nav-wrapper white"
			style="border-bottom: solid 3px; border-color: gray;">
			<a href="index.html" class="brand-logo left"
				style="margin-left: 50px"> <span
				style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul id="nav-mobile" class="right" style="margin-right: 20px">
				<li><a href="registar.jsp" class="grey-text text-darken-2">Registar</a></li>
				<li><a href="login.jsp" class="grey-text text-darken-2">Login</a></li>
				<li><a href="myPage.jsp" class="grey-text text-darken-2">MyPage</a></li>
			</ul>
		</div>
	</nav>

	<!-- TopImage -->
	<img src="img/brain.png" style="width: 100%; height: 400px;" alt="" />

	<!-- MainContents -->
	<div class="contents row">
		<h3>あああああ</h3>
		<p>Footers are a great way to organize a lot of site navigation
			and information at the end of a page. This is where the user will
			look once hes finished scrolling through the current page or is
			looking for additional information about your website. Introduction
			Note: We use flexbox to structure our html so that the footer is
			always on the bottom of the page. It is important to keep the
			structure of your page within the 3 HTML5 tags: Footer Content You
			can use rows and columns here to organize your footer content.</p>
		<h2>Let's Brain Storming!!</h2>
		<a href="#"
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"><i
			class="material-icons left">cloud</i>Global Room</a> <a
			href="createRoom.html"
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"><i
			class="material-icons left">settings</i>Create Room</a> <a
			href="storming.html"
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"><i
			class="material-icons left">input</i>Entering Room</a>
	</div>

	<!-- Footer -->
	<footer class="page-footer blue-grey darken-4">
		<div class="container">
			<div class="row">
				<div class="col l6 s12">
					<h5 class="white-text">Help</h5>
					<p class="grey-text text-lighten-4">You can use rows and
						columns here to organize your footer content.</p>
				</div>
				<div class="col l4 offset-l2 s12">
					<h5 class="white-text">Connect</h5>
					<ul class="">
						<li><a class="waves-effect waves-light btn footerButton"
							href="https://twitter.com/Cy_World2015?lang=ja"><i
								class="material-icons left">input</i>Twitter</a></li>
						<li><a class="waves-effect waves-light btn footerButton"><i
								class="material-icons left">input</i>GitHub</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">Â© 2014 Copyright Cy-World</div>
		</div>
	</footer>

</body>

</html>
