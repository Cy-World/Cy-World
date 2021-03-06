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
	<ul id="dropdown1" class="dropdown-content">
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
					href="#!" data-activates="dropdown1"> <%=user.getName()%> <img
						class="navImg" alt="avatar" src="img/profilePool/<%=imgPath%>"
						width="30" height="30" /> <i class="material-icons right">arrow_drop_down</i>
				</a></li>
			</ul>
			<form action="search.jsp" class="left navSearch" method="post">
				<input name="keyworld" placeholder="Search user" type="sarch" />
			</form>
		</div>
	</nav>


	<!-- MainContents -->
	<div class="contents">

		<!-- Input forms -->
		<form action="CreateRoomServlet" class="z-depth-3 createRoomCard"
			method="post">
			<h4 class="createRoomTitle">Create Room</h4>
			<!--User Name  -->
			<div class="inputFormLayout">
				<div class="input-field col s12">
					<input class="validate" id="roomName" name="roomName" type="text"
						required /> <label for="roomName">Room Name</label>
				</div>
				<!-- Comment -->
				<div class="input-field col s12">
					<textarea class="materialize-textarea" id="comment" name="comment"
						type="text"></textarea>
					<label for="comment">Comment</label>
				</div>
				<p>
					<input class="with-gap" id="0" name="roomConf" type="radio"
						value="0" checked /> <label for="0">Public</label>
				</p>
				<p>
					<input class="with-gap" id="1" name="roomConf" type="radio"
						value="1" /> <label for="1">Private</label>
				</p>
			</div>
			<button class="waves-effect waves-light btn-large createRoomButton"
				name="action" type="submit">
				Create <i class="material-icons left">room</i>
			</button>
		</form>
	</div>

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
