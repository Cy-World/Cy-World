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
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="js/materialize/materialize.js"></script>
<script src="js/materialize/init.js"></script>
<script src="js/cyworldjs/search.js"></script>
<script src="js/cyworldjs/jquery.json.js"></script>
</head>

<%
	String p = request.getParameter("p");
	String key = request.getParameter("keyworld");
	System.out.println("P" + p);
	System.out.println("KEY" + key);
	User user = new User();
	List<User> list = user.getUserList(key);
	int c = list.size();
	System.out.println("count"+c);
%>
<body class="grey lighten-4" onload="aaa()">

	<!-- GlobalNavi -->
	<nav>
		<div class="nav-wrapper white"
			style="border-bottom: solid 3px; border-color: gray;">
			<a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
				<span style="color: blue; font-weight: bold">Cy</span> <span
				style="color: grey; font-weight: bold">-World</span>
			</a>
			<ul class="right" id="nav-mobile" style="margin-right: 20px">
				<li class="p"><a class="grey-text text-darken-2"
					href="registar.jsp">Registar</a></li>
				<li><a class="grey-text text-darken-2" href="login.jsp">Login</a>
				</li>
			</ul>
			<form action="search.jsp" class="right" method="GET"
				style="margin-right: 30%">
				<input id="search" placeholder="Search user or room" size="60"
					style="height: 30px;" type="sarch" name="keyworld" />
			</form>

		</div>
	</nav>

	<ul class="pagination">
		<li class="waves-effect"><a href="search.jsp?p=1">1</a></li>
		<li class="waves-effect"><a href="search.jsp?p=2">2</a></li>
		<li class="waves-effect"><a href="search.jsp?p=3">3</a></li>
		<li class="waves-effect"><a href="search.jsp">4</a></li>
	</ul>

	<!-- MainContents -->
	<div class="contents">



		<ul>
			<li class="active"><a href="#!">1</a></li>
			<%
				for (User u : list) {
			%>
			<li><%=u.getName()%></li>
			<%
				}
			%>
		</ul>
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
