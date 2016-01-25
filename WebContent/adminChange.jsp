<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="cyworld.model.DBHelper" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=utf-8");
	String uch2 = null;
	String rch2 = null;
	String cenname = null;
	String cenadd = null;
	String cencome = null;
	String cenflag = null;
	uch2 = request.getParameter("uch1");
	rch2 = request.getParameter("rch1");

	if(uch2 != null) {
		cenname = "na"+uch2;
		cenadd = "ad"+uch2;
		cenname = request.getParameter(cenname);
		cenadd = request.getParameter(cenadd);


	}	else 	if(rch2 != null) {
		cenname = "na"+rch2;
		cencome = "co"+rch2;
		cenflag = "fl"+rch2;
		cenname = request.getParameter(cenname);
		System.out.println(cenname);
		cencome = request.getParameter(cencome);
		System.out.println(cencome);
		cenflag = request.getParameter(cenflag);
		System.out.println(cenflag);
	}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/cyworldjs/admin.js"></script>
<title>AdminChange|Cy-World</title>
</head>
<body>
	<%
		if(uch2!=null){
	%>
	<form action="adminUser.jsp" method="POST" name="adcha">
		<input type="hidden" name ="acuid" value="<%=uch2%>">
		UserName<br>
		<input type="text" name="acuname" value="<%=cenname%>">
		<br>
		MailAddress<br>
		<input type="text" name="acuadd" value="<%=cenadd%>">
		<br>
		<input type="submit"  name="acucen"  value="Change" onclick="return adhange()">
		<input type="button" onclick="location.href='adminUser.jsp'" value="Return">

	</form>
	<%} else if(rch2!=null){%>
	<form action="adminRoom.jsp" method="POST" name="adcha">
		<input type="hidden" name ="acrid" value="<%=rch2%>">
		RoomName<br>
		<input type="text" name="acrname" value="<%=cenname%>">
		<br>
		Comment<br>
		<input type="text" name="acrcom" value="<%=cencome%>">
		<br>
		Flag<br>
		<input type="text" name="acrflag" value="<%=cenflag%>">
		<br>
		<%
		System.out.println("にゅうりょくでーた: " + cenname);
		%>
		<input type="submit"  name="acrcen"  value="Change" onclick="return adhange()">
		<input type="button" onclick="location.href='adminRoom.jsp'" value="Return">

	</form>

	<%} %>
</body>

</html>
