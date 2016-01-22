<%@page import="cyworld.model.RoomBean"%>
<%@page import="cyworld.model.GetImage"%>
<%@page import="java.util.List"%>
<%@page import="cyworld.model.User"%>
<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8" />
<title>CreateRoom|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="css/materialize.setting.css" rel="stylesheet"
	type="text/css" />
<link href="css/materialize.min.css" media="screen,projection"
	rel="stylesheet" type="text/css" />
<!-- CustomImport -->
<link href="css/createRoom.css" rel="stylesheet" type="text/css" />
<link href="css/top.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-2.1.1.min.js"
	type="text/javascript"></script>
<script src="js/materialize/materialize.min.js" type="text/javascript"></script>
<script src="js/init.js"></script>
<script src="js/materialize/test.js" type="text/javascript"></script>
<script src="js/cyworldjs/footerFixed.js"></script>

</head>

<body class="grey lighten-4">
	<%
		//GET IMAGE
		User user = (User) session.getAttribute("loginUser");
		String path = getServletContext().getRealPath("img/profilePool");
		String imgPath = new GetImage().getImage(user, path);
	%>
	<!-- Dropdown Structure -->
	<ul class="dropdown-content" id="dropdown1">
		<li><a href="myPage.jsp">MyPage</a></li>
		<li><a href="edit.jsp">Setting</a></li>
		<li><a href="LogoutServlet">Logout</a></li>
	</ul>
	<!-- Gnav -->
	<nav>
		<div class="nav-wrapper white minWidth"
			style="border-bottom: solid 3px; border-color: gray;">
			<a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
				<span style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul class="right" id="nav-mobile" style="margin-right: 20px">
				<li><a class="dropdown-button grey-text text-darken-2"
					data-activates="dropdown1" href="#!"> <%=user.getName()%> <img
						alt="avatar" class="navImg" height="30"
						src="img/profilePool/<%=imgPath%>" width="30" /> <i
						class="material-icons right">arrow_drop_down</i>
				</a></li>
			</ul>
			<form action="search.jsp" class="left navSearch" method="post">
				<input name="keyworld" placeholder="Search user" type="sarch" />
			</form>
		</div>
	</nav>

	<!-- MainContents -->
	<div class="contents">
		<h3>You don't participate in room</h3>
		Would you like to join this group?
	</div>
	<a
		class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
		href="InsertRoomServlet"> <i class="material-icons left">cloud</i>Join
		Room
	</a>
	<a
		class="col m3 waves-effect waves-light btn-large topButton z-depth-2"
		href="myPAge.jsp"> <i class="material-icons left">cloud</i>Back
		Maypege
	</a>

	<!-- footer-->
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
							style="margin: 5px"> <i class="material-icons left">input</i>GitHub
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
