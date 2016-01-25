<%@page import="java.io.Console"%>
<%@page contentType="text/html;charset=utf-8" language="java"%>
<%@page import="cyworld.model.DBHelper" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

			<%
				request.setCharacterEncoding("UTF-8");
 				DBHelper dbHelper = new DBHelper();
				dbHelper.openDB();
				Object at1 = session.getAttribute("at1");

				String use1 = request.getParameter("roomSe");
				String utx1 = request.getParameter("roomtext");
				String rch2 = null;
				String cenid = null;
				String cenname = null;
				String cencome = null;
				String cenflag = null;
				String qre = null;
				String sql ="";
				ResultSet rs = null;

				qre = request.getParameter("cendel");
				cenid =request.getParameter("acrid");
				cenname =request.getParameter("acrname");
				cencome =request.getParameter("acrcom");
				cenflag =request.getParameter("acrflag");
				if(qre == null){

				} else if(qre.equals("Delete")){
					rch2 =request.getParameter("rch1");
				}







				if(utx1 != null){
					at1 = "2";
				} else if(cenid != null){
		System.out.println("チェンジ");
		System.out.println("RoomNAME : " + cenname);
		System.out.println();

					dbHelper.updateSQL("UPDATE Room SET RoomName ='"+cenname+"',"
							+"Comment = '"+cencome+"',Flag ='"+cenflag+"' WHERE RoomID ='"+cenid+"' ;");
	 				at1 = "1";
					use1 = "";
					utx1 = "";
				} else if(rch2 != null){
					dbHelper.deleteSQL("DELETE FROM Room WHERE RoomID ='"+rch2+"';");
					at1 = "1";
					use1 = "";
					utx1 = "";
				} else {
					use1 = "";
					utx1 = "";
				}


				if(at1.equals("1")) {
					sql = String.format("select * from Room");
				} else  if(at1.equals("2")){
					sql = "select * from Room WHERE "+use1+" like '"+utx1+"%';";
				}

				rs = dbHelper.selectSQL(sql);


			%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<script type="text/javascript" src="js/cyworldjs/admin.js"></script>


<title>AdminRoom|Cy-World</title>
</head>

<body>
	<input type="button" onclick="location.href='adminTop.jsp'" value="Back" />
	<form action="adminRoom.jsp" method="post">
		<div>
			<select name="roomSe">
				<option value="RoomID">roomID</option>
				<option value="RoomName">roomName</option>
				<option value="Comment">comment</option>
				<option value="Flag">flag</option>
			</select>
			<input type="text" name="roomtext">
			<input type="submit" value="Search" name="roombt">

		</div>
	</form>
	<form action="adminRoom.jsp" id="checf" method="POST" name="ucheck">
		<div>
			<table border=1>
				<tr>
					<td width='50'></td>
					<td width='100'>RoomID</td>
					<td width='150'>RoomName</td>
					<td width='300'>Comment</td>
					<td width='30'>Flag</td>
				</tr>
		<%
				try {
					if (rs != null) {
						while (rs.next()) {
							String roomID = rs.getString("RoomID");
							String name = rs.getString("RoomName");
							String comment = rs.getString("Comment");
							String flag = rs.getString("Flag");
		%>
							<tr>
								<td  align='center'><input type='radio' name='rch1' value ='<%=roomID%>'></td>
								<td><%=roomID%></td>
								<td><input type="hidden" name='na<%=roomID %>' value='<%=name %>'><%=name %></td>
								<td><input type="hidden" id="comment" name='co<%=roomID %>' value='<%=comment%>'><%=comment%></td>
								<td><input type="hidden" name='fl<%=roomID %>' value='<%=flag %>'><%=flag %></td>

							</tr>
		<%					System.out.println(name);	}

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