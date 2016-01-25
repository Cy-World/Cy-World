<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="cyworld.model.DBHelper" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

			<%
 				DBHelper dbHelper = new DBHelper();
				dbHelper.openDB();
				Object at1 = session.getAttribute("at1");

				String use1 = request.getParameter("UserSe");
				String utx1 = request.getParameter("Usertext");
				String uch2 = null;
				String cenid = null;
				String cenname = null;
				String cenadd = null;
				String que = null;
				String sql ="";
				ResultSet rs = null;

				que = request.getParameter("cendel");
				cenid =request.getParameter("acuid");
				cenname =request.getParameter("acuname");
				cenadd =request.getParameter("acuadd");
				if(que == null){

				} else if(que.equals("Delete")){
					uch2 =request.getParameter("uch1");
				}







				if(utx1 != null){
					at1 = "2";
				} else if(cenid != null){

					dbHelper.updateSQL("UPDATE User SET UserName ='"+cenname+"',"
							+"MailAddress = '"+cenadd+"' WHERE UserID ='"+cenid+"' ;");
	 				at1 = "1";
					use1 = "";
					utx1 = "";
				} else if(uch2 != null){
					dbHelper.deleteSQL("DELETE FROM User WHERE UserID ="+uch2+" ;");
					at1 = "1";
					use1 = "";
					utx1 = "";
				} else {
					use1 = "";
					utx1 = "";
				}


				if(at1.equals("1")) {
					sql = String.format("select * from User");
				} else  if(at1.equals("2")){
					sql = "select * from User WHERE "+use1+" like '"+utx1+"%';";
				}

				rs = dbHelper.selectSQL(sql);


			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/cyworldjs/admin.js"></script>


<title>AdminUser|Cy-World</title>
</head>

<body>
	<input type="button" onclick="location.href='adminTop.jsp'" value="Back" />
	<form action="adminUser.jsp" action="post">
		<div>
			<select name="UserSe">
				<option value="UserID" name="UserID" >UserID</option>
				<option value="UserName" name="UserName">UserName</option>
				<option value="MailAddress" name="MailAddress">MailAddress</option>
			</select>
			<input type="text" name="Usertext">
			<input type="submit" value="Search" name="Userbt">

		</div>
	</form>
	<form action="adminUser.jsp" id="checf" action="Get" name="ucheck">
		<div>
			<table border=1>
				<tr>
					<td width='50'></td>
					<td width='100'>UserID</td>
					<td width='150'>UserName</td>
					<td width='150'>MailAddress</td>
				</tr>
		<%
				try {
					if (rs != null) {
						while (rs.next()) {
							String userID = rs.getString("UserID");
							String name = rs.getString("UserName");
							String address = rs.getString("MailAddress");
		%>
							<tr>
								<td  align='center'><input type='radio' name='uch1' value ='<%=userID%>'></td>
								<td><%=userID%></td>
								<td><input type="hidden" name='na<%=userID %>' value='<%=name %>'><%=name %></td>
								<td><input type="hidden" name='ad<%=userID %>' value='<%=address%>'><%=address%></td>
							</tr>
		<%				}
					}

		%>
					</table>
		<%
					dbHelper.closeDB();

				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					dbHelper.closeDB();
				}
		%>


			<input type="submit"  name="cendel" value="Change" onClick="return adche(1)">
			<input type="submit"  name="cendel" value="Delete" onClick="return adche(2)">
		</div>
	</form>
</body>
</html>