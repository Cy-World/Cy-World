<%@page import="cyworld.model.GetImage"%>
<%@page import="java.io.File"%>
<%@page import="cyworld.model.DBHelper"%>
<%@page import="javax.jws.soap.SOAPBinding.Use"%>
<%@page import="java.util.List"%>
<%@page import="cyworld.model.User"%>
<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>Registar|Cy-World</title>
<!-- FrameWorkImport -->
<link href="http://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<link href="css/materialize.css" media="screen,projection"
	rel="stylesheet" type="text/css" />
<!-- CustomImport -->
<link href="css/top.css" media="screen,projection" rel="stylesheet"
	type="text/css" />
<link href="css/inputCard.css" rel="stylesheet" type="text/css" />
<link charset="utf-8" href="css/search.css" media="screen"
	rel="stylesheet" title="no title">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/materialize/materialize.js"></script>
<script src="js/materialize/init.js"></script>
<script src="js/cyworldjs/search.js"></script>
<script src="js/cyworldjs/jquery.json.js"></script>
<script src="js/cyworldjs/footerFixed.js"></script>
</head>

<%
	String p = request.getParameter("p");
	String key = request.getParameter("keyworld");
	User user = new User();
	List<User> list = user.getUserList(key);
	int c = list.size();
	user = (User) session.getAttribute("loginUser");

	String navPath = getServletContext().getRealPath("img/profilePool");
	String navImg = new GetImage().getImage(user, navPath);

	System.out.println("P" + p);
	System.out.println("KEY" + key);
%>
<body class="grey lighten-4" onload="aaa()">

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
						class="navImg" alt="avatar" src="img/profilePool/<%=navImg%>"
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
		<h3>UserList</h3>
		Found
		<%=c%>
		Users
		<ul class="collection z-depth-3" style="width: 800px;">
			<%
				for (User u : list) {
					String path = getServletContext().getRealPath("img/profilePool");
					String imgPath = new GetImage().getImage(u, path);
					//Addres ID Sprit
					String spritAddress[] = u.getAddress().toString().split("@", 0);
					System.out.println(imgPath);
			%>
			<li class="collection-item dismissable avatar users2"><img
				alt="avatar" class="circle" height="100"
				src="img/profilePool/<%=imgPath%>" width="100" /> <span
				class="title"><%=u.getName()%></span>
				<p><%=spritAddress[0]%></p> <a class="secondary-content users"
				href="SearchServlet?id=<%=u.getUserID()%>"> <i
					class="material-icons">send</i>
			</a></li>
			<%
				}
			%>
		</ul>
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
