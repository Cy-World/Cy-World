<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Registar|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" media="screen,projection"
	rel="stylesheet" type="text/css" />
<!-- CustomImport -->
<link href="css/top.css" media="screen,projection" rel="stylesheet"
	type="text/css" />
<link href="css/inputCard.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/materialize/materialize.js"></script>
<script src="js/materialize/init.js"></script>
<script src="js/cyworldjs/footerFixed.js"></script>
</head>

<body class="grey lighten-4">

	<!-- GlobalNavi -->
	<nav>
		<div class="nav-wrapper white"
			style="border-bottom: solid 3px; border-color: gray;">
			<a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
				<span style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul class="right" id="nav-mobile" style="margin-right: 20px">
				<li><a class="grey-text text-darken-2" href="registar.jsp">Registar</a>
				</li>
				<li><a class="grey-text text-darken-2" href="login.jsp">Login</a>
				</li>
			</ul>

		</div>
	</nav>

	<!-- MainContents -->
	<div class="contents">
		<!-- Input forms -->
		<form action="RegisterServlet" class="z-depth-3 cardLayout"
			method="post">
			<h4 class="titleLayout">Registar</h4>
			<div class="inputFormLayout">
				<!--User Name  -->
				<div class="input-field col s12">
					<input class="validate" id="name" name="username" type="text" value="Cygure"/> <label
						for="name" >UserName</label>
				</div>
				<!-- Email addless -->
				<div class="input-field col s12">
					<input class="validate" id="email" name=email type="email" value="x13g111@chiba-fjb.ac.jp"/> <label
						for="email" >Email Address</label>
				</div>
				<!-- Passwd -->
				<div class="input-field col s12">
					<input class="validate" id="passwd" name="passwd" type="password" value="x13g111"/>
					<label for="passwd">Password</label>
				</div>
				<!-- RePasswd -->
				<div class="input-field col s12">
					<input class="validate" id="repasswd" name="repasswd"
						type="password" /> <label for="repasswd">Conpirm your
						Password</label>
				</div>
			</div>
			<button class="waves-effect waves-light btn-large buttonLayout"
				name="action" type="submit">
				Create <i class="material-icons left">room</i>
			</button>
		</form>
	</div>

	<!-- fotter -->
	<footer class="page-footer blue-grey darken-4" id="footer">
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
						<li><a class="waves-effect waves-light btn"
							href="https://twitter.com/Cy_World2015?lang=ja"
							style="margin: 5px"> <i class="material-icons left">input</i>Twitter
						</a></li>
						<li><a class="waves-effect waves-light btn"
							href="https://github.com/Cy-World" style="margin: 5px"> <i
								class="material-icons left">input</i>GitHub
						</a></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				© 2016 Copyright Cy-World
				<!-- <a class="grey-text text-lighten-4 right" href="#!">More Links</a> -->
			</div>
		</div>
	</footer>

</body>

</html>
