<!--
<%@page contentType="text/html;charset=utf-8" language="java"%>
-->
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="cyworld.model.RoomBean"%>
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
	<link href="css/materialize.setting.css" rel="stylesheet"
		type="text/css" />
	<link href="css/materialize.min.css" media="screen,projection"
		rel="stylesheet" type="text/css" />
	<link href='https://fonts.googleapis.com/css?family=Open+Sans'
		rel='stylesheet' type='text/css'>
	<!-- CustomImport -->
	<link href="css/myPage.css" rel="stylesheet" type="text/css" />
	<link href="css/inputCard.css" rel="stylesheet" type="text/css" />
	<link href="css/top.css" rel="stylesheet" type="text/css" />
	<script src="https://code.jquery.com/jquery-2.1.1.min.js"
		type="text/javascript"></script>
	<script src="js/materialize/materialize.min.js" type="text/javascript"></script>
	<script src="js/materialize/init.js"></script>
	<script src="js/materialize/test.js" type="text/javascript"></script>
	<script src="js/cyworldjs/footerFixed.js"></script>
	<script src="js/cyworldjs/profile.js"></script>

	</head>

<body class="grey lighten-4">
	<!-- Gnav -->
	<nav>
		<div class="nav-wrapper white minWidth"
			style="border-bottom: solid 3px; border-color: gray;">
			<a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
				<span style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul class="right" id="nav-mobile" style="margin-right: 20px">
				<li><a class="grey-text text-darken-2" href="LogoutServlet">Logout</a>

				</li>
				<li><a class="grey-text text-darken-2" href="myPage.jsp">MyPage</a>
				</li>
			</ul>
			<form action="search.jsp" class="left navSearch" method="post">
				<input name="keyworld" placeholder="Search user" type="sarch"/>
			</form>
		</div>
	</nav>

	<!-- Contents -->
	<%
		//HttpSession httpSession = request.getSession();
		User user = (User) session.getAttribute("userInfo");
		String imgPath = "0000.jpg";
		String path = getServletContext().getRealPath("img/profilePool");
		File imgFile = new File(path + "/" + user.getUserID() + "/" + user.getImgPath());
		if (imgFile.exists())
			imgPath = user.getUserID() + "/" + user.getImgPath();
		List<RoomBean> roomList = RoomBean.getProfRoomList(user.getUserID());
		String spritAddress[] = user.getAddress().toString().split("@", 0);
	%>
	<div class="contents">
		<h3>User Profile</h3>
		<div class="z-depth-3 myPageCard row">
			<!-- Profile Container -->
			<div class="col s4">
				<img class="profAvatar" height="230" src="img/profilePool/<%=imgPath%>"
					width="230" /> <br /> <span class="nameFont"><%=user.getName()%></span>
				<br /> <span class="addressFont"><%=spritAddress[0]%></span> <br />
			</div>
			<!-- Rooom Container -->
			<div class="col s8">
				<div class="roomContainer">
					Room List
					<ul class="collection" style="width: 100%;">
						<%
							if (roomList != null && roomList.size() != 0) {
								for (RoomBean list : roomList) {
						%>
						<li class="collection-item dismissable">
							<div>
								<%=list.getRoomName()%> <a class="secondary-content users" href="JoinRoomServlet?roomid=<%=list.getRoomID()%>"><i
									class="material-icons">input</i></a>
							</div>
						</li>
						<%
							}
							}else {
								out.print("<tr><td>Not Room<br /></td></tr>");
							}
						%>
					</ul>

				</div>
			</div>

		</div>
	</div>
	<!-- footer-->
	<footer class="page-footer blue-grey darken-4 minWidth" id="footer">
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
