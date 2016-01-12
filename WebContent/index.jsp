<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="cyworld.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TopPage|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link href="css/materialize.css" media="screen,projection"
	rel="stylesheet" type="text/css" />
<!-- CustomImport -->
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/top.css" media="screen,projection" rel="stylesheet"
	type="text/css" />
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/materialize/materialize.js"></script>
<script src="js/materialize/init.js"></script>
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

				<%
					User user = (User) session.getAttribute("loginUser");
					if (user == null) {
				%>
				<li><a class="grey-text text-darken-2" href="registar.jsp">Registar</a>
				</li>
				<li><a class="grey-text text-darken-2" href="login.jsp">Login</a>
				</li>
				<%
					} else {
				%>
				<li><a class="grey-text text-darken-2" href="LogoutServlet">Logout</a>

				</li>
				<li><a class="grey-text text-darken-2" href="myPage.jsp">MyPage</a>
				</li>
			</ul>
			<form action="search.jsp" class="left navSearch" method="post">
				<input name="keyworld" placeholder="Search user" type="sarch"/>
			</form>
			<%
				}
			%>

		</div>
	</nav>

	<!-- TopImage -->
	<img alt="" src="img/brain.png" style="width: 100%; height: 400px;" />

	<!-- MainContents -->
	<div class="contents row">
		<h3>あなたのアイディアを世界と共有してみませんか？</h3>
		<p>Footers are a great way to organize a lot of site navigation
			and information at the end of a page. This is where the user will
			look once hes finished scrolling through the current page or is
			looking for additional information about your website. Introduction
			Note: We use flexbox to structure our html so that the footer is
			always on the bottom of the page. It is important to keep the
			structure of your page within the 3 HTML5 tags: Footer Content You
			can use rows and columns here to organize your footer content.</p>
		<h2>Let's Brain Storming!!</h2>
		<%
			user = (User) session.getAttribute("loginUser");
			if (user == null) {
		%>
		<a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="login.jsp"> <i class="material-icons left">cloud</i>Global Room
		</a> <a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="login.jsp"> <i class="material-icons left">settings</i>Create
			Room
		</a> <a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="login.jsp"> <i class="material-icons left">input</i>Entering
			Room
		</a>
		<%
			} else {
		%>
		<a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="#"> <i class="material-icons left">cloud</i>Global Room
		</a> <a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="createRoom.jsp"> <i class="material-icons left">settings</i>Create
			Room
		</a> <a
			class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
			href="storming.jsp"> <i class="material-icons left">input</i>Entering
			Room
		</a>
		<%
			}
		%>
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
							href="https://twitter.com/Cy_World2015?lang=ja"> <i
								class="material-icons left">input</i>Twitter
						</a></li>
						<li><a class="waves-effect waves-light btn footerButton">
								<i class="material-icons left">input</i>GitHub
						</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">© 2016 Copyright Cy-World</div>
		</div>
	</footer>
</body>
</html>
