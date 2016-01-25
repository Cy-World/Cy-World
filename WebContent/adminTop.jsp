<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page session="true" %>

<%
	session.setAttribute("at1", "1");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>AdminTop|Cy-World</title>
</head>

<body>
	<div>

		<input type="button" value="User" onclick="location.href='adminUser.jsp'" class="Userbt">
		<input type="button" value="Room" onclick="location.href='adminRoom.jsp'" class="Roombt">

	</div>

</body>
</html>