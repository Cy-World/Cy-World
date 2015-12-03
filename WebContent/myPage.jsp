<!--
<%@page contentType="text/html;charset=utf-8" language="java"%>
-->
<!DOCTYPE html>
<%@page import="sun.net.www.content.image.png"%>
<%@page import="java.io.File"%>
<%@page import="cyworld.model.User"%>
<html>

<head>
<meta charset="UTF-8">
<title>MyPage|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link type="text/css" rel="stylesheet"
	href="css/materialize.setting.css" />
<link type="text/css" rel="stylesheet" href="css/materialize.min.css"
	media="screen,projection" />
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<!-- CustomImport -->
<link type="text/css" rel="stylesheet" href="css/myPage.css" />
<link type="text/css" rel="stylesheet" href="css/inputCard.css" />
<link type="text/css" rel="stylesheet" href="css/top.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-2.1.1.min.js">
	
</script>
<script type="text/javascript" src="js/materialize/materialize.min.js">
	
</script>
<script src="js/materialize/init.js"></script>
<script type="text/javascript" src="js/materialize/test.js"></script>
</head>

<body class="grey lighten-4">
	<!-- Gnav -->
	<nav>
		<div class="nav-wrapper white minWidth"
			style="border-bottom: solid 3px; border-color: gray;">
			<a href="index.jsp" class="brand-logo left" style="margin-left: 50px">
				<span style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul id="nav-mobile" class="right" style="margin-right: 20px">
				<li><a href="myPage.jsp" class="grey-text text-darken-2">MyPage</a></li>
			</ul>
		</div>
	</nav>

	<!-- Contents -->
	<%
		HttpSession httpSession = request.getSession();
		User user = (User) httpSession.getAttribute("loginUser");
		String path = getServletContext().getRealPath("img/profilePool");
		File jpgFile = new File(path + "/" + user.getAddress() + ".jpg");
		File pngFile = new File(path + "/" + user.getAddress() + ".png");
		String imgPath = "0000.jpg";
		if (jpgFile.exists())
			imgPath = user.getAddress() + ".jpg";
		if (pngFile.exists())
			imgPath = user.getAddress() + ".png";
	%>
	<div class="contents">

		<div class="z-depth-3 myPageCard row">
			<!-- Profile Container -->
			<div class="col s4">
				<img src="img/profilePool/<%=imgPath%>" class="avatar" width="230"
					height="230" /> <br> <span class="nameFont">Cygure</span> <br>
				<span class="addressFont">x13g029</span> <br> <span
					class="editFont"><a href="edit.jsp">Edit Profiele</a></span>
			</div>
			<!-- Rooom Container -->
			<div class="col s8">
				<div class="roomContainer">
					<table class="bordered highlight avatar">
						<caption class="roomList">Room List</caption>
						<tr>
							<td><a href="#"><i class="material-icons tiny">library_books</i>
									Room1</a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="material-icons tiny">library_books</i>
									Room2</a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="material-icons tiny">library_books</i>
									Room3</a></td>
						</tr>
						<tr>
							<td><a href="#"><i class="material-icons tiny">library_books</i>
									Room4</a></td>
						</tr>
					</table>
				</div>
			</div>

		</div>
	</div>
	<!-- footer-->
	<footer class="page-footer blue-grey darken-4 minWidth">
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
							style="margin: 5px"
							href="https://twitter.com/Cy_World2015?lang=ja"><i
								class="material-icons left">input</i>Twitter</a></li>
						<li><a class="waves-effect waves-light btn"
							style="margin: 5px"><i class="material-icons left">input</i>GitHub</a></li>

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
