<%@page import="java.io.File"%>
<%@page import="cyworld.model.User"%>
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
			<form action="index.html" class="right" method="post" style="margin-right:30%">
				<input id="search" type="sarch" placeholder="Search user or room" style="height:30px;"size="60"/>
			</form>
		</div>
	</nav>
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("loginUser");
		String path = getServletContext().getRealPath("img/profilePool");
		File jpgFile = new File(path + "/" + user.getUserID() + ".jpg");
		File pngFile = new File(path + "/" + user.getUserID() + ".png");
		String imgPath = "0000.jpg";
		if (jpgFile.exists())
			imgPath = user.getUserID() + ".jpg";
		if (pngFile.exists())
			imgPath = user.getUserID() + ".png";
	%>
	<!-- MainContents -->
	<div class="contents">
		<!-- Input forms -->
		<form action="EditServlet" class="z-depth-3 cardLayout" method="post">
			<h4 class="titleLayout">Edit Profile</h4>
			<div class="inputFormLayout">

				<!--User Name  -->
				<div class="input-field col s12">
					<input class="validate" id="name" name="name" type="text"
						value="<%=user.getName()%>" /> <label for="name">UserName</label>
				</div>
				<!-- Email addless -->
				<div class="input-field col s12">
					<input class="validate" id="email" name="mail" type="email"
						value="<%=user.getAddress()%>" /> <label for="email">Email
						Address</label>
				</div>
				<!-- Passwd -->
				<div class="input-field col s12">
					<input class="validate" id="passwd" name="passwd" type="password" />
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
				name="action" type="submit" />
			Create <i class="material-icons left">room</i>
			</button>
		</form>


		<!-- Imgae UpLoad -->
		<form action="UpLoadServlet" class="z-depth-3 cardLayout"
			enctype="multipart/form-data" method="post">
			<div class="inputFormLayout">
				<img class="avatar" height="230" src="img/profilePool/<%=imgPath%>"
					width="230" />
				<!-- Image -->
				<div class="file-field input-field">
					<div class="btn">
						<span>File</span> <input multiple type="file" name="imgPath" />
					</div>
					<div class="file-path-wrapper">
						<input class="file-path validate"
							placeholder="Upload one or more files" type="text" />
					</div>
				</div>
			</div>
			<button class="waves-effect waves-light btn-large buttonLayout"
				name="action" type="submit" />
			UpLoad <i class="material-icons left">room</i>
			</button>
		</form>
	</div>

	<!-- fotter -->
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
						<li><a class="waves-effect waves-light btn"
							href="https://twitter.com/Cy_World2015?lang=ja"
							style="margin: 5px"> <i class="material-icons left">input</i>Twitter
						</a></li>
						<li><a class="waves-effect waves-light btn"
							style="margin: 5px"> <i class="material-icons left">input</i>GitHub
						</a></li>

					</ul>
				</div>
			</div>
		</div>
		<div class="footer-copyright">
			<div class="container">
				© 2014 Copyright Cy-World
				<!-- <a class="grey-text text-lighten-4 right" href="#!">More Links</a> -->
			</div>
		</div>
	</footer>

</body>

</html>
