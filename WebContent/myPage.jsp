<!--
<%@page contentType="text/html;charset=utf-8" language="java"%>
-->
<!DOCTYPE html>
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
            <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                <link href="css/materialize.setting.css" rel="stylesheet" type="text/css"/>
                <link href="css/materialize.min.css" media="screen,projection" rel="stylesheet" type="text/css"/>
                <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
                    <!-- CustomImport -->
                    <link href="css/myPage.css" rel="stylesheet" type="text/css"/>
                    <link href="css/inputCard.css" rel="stylesheet" type="text/css"/>
                    <link href="css/top.css" rel="stylesheet" type="text/css"/>
                    <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
                    <script src="js/materialize/materialize.min.js" type="text/javascript"></script>
                    <script src="js/materialize/init.js"></script>
                    <script src="js/materialize/test.js" type="text/javascript"></script>
                </head>

                <body class="grey lighten-4">
                    <!-- Gnav -->
                    <nav>
                        <div class="nav-wrapper white minWidth" style="border-bottom: solid 3px; border-color: gray;">
                            <a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
                                <span style="color: blue; font-weight: bold">Cy</span>
                                <span style="color: grey; font-weight: bold">-World</span>
                            </a>
                            <ul class="right" id="nav-mobile" style="margin-right: 20px">
                                <li>
                                    <a class="grey-text text-darken-2" href="myPage.jsp">MyPage</a>
                                </li>
                            </ul>
                            <form action="index.html" class="right" method="post" style="margin-right:30%">
                                <input id="search" type="sarch" placeholder="Search user or room" style="height:30px;"size="60"/>
                            </form>
                        </div>
                    </nav>

                    <!-- Contents -->
                    <%
		//HttpSession httpSession = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		String path = getServletContext().getRealPath("img/profilePool");
		File jpgFile = new File(path + "/" + user.getUserID() + ".jpg");
		File pngFile = new File(path + "/" + user.getUserID() + ".png");
		String imgPath = "0000.jpg";
		if (jpgFile.exists())
			imgPath = user.getUserID() + ".jpg";
		if (pngFile.exists())
			imgPath = user.getUserID() + ".png";
		List<RoomBean> roomList = RoomBean.getRoomList(user.getUserID());
		String spritAddress[] = user.getAddress().toString().split("@", 0);
	%>
                    <div class="contents">

                        <div class="z-depth-3 myPageCard row">
                            <!-- Profile Container -->
                            <div class="col s4">
                                <img class="avatar" height="230" src="img/profilePool/<%=imgPath%>" width="230"/>
                                <br>
                                    <span class="nameFont"><%=user.getName()%></span>
                                    <br>
                                        <span class="addressFont"><%=spritAddress[0]%></span>
                                        <br>
                                            <span class="editFont">
                                                <a href="edit.jsp">Edit Profile</a>
                                            </span>
                                        </div>
                                        <!-- Rooom Container -->
                                        <div class="col s8">
                                            <div class="roomContainer">
                                                <table class="bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Room List</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
							if (roomList != null && roomList.size() != 0) {
								for (RoomBean list : roomList) {
						%>
						<style media="screen">
					 		.hoge {
								margin-left: 80%;
							}
					 	</style>
									<tr>
                                        <td style="padding:20px;"><%=list.getRoomName()%><a href="storming.jsp"><i class="material-icons hoge">input</i></a></td>
                                 	</tr>
                                                        <%
								}
							} else {

								out.print("<tr><td>You don't have to make a room.<br /><a href=\"createRoom.jsp\">Create a Room</a></td></tr>");
							}
						%>
                                                    </tbody>

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
                                                <p class="grey-text text-lighten-4">You can use rows and columns here to organize your footer content.</p>
                                            </div>
                                            <div class="col l4 offset-l2 s12">
                                                <h5 class="white-text">Connect</h5>
                                                <ul class="">
                                                    <li>
                                                        <a class="waves-effect waves-light btn" href="https://twitter.com/Cy_World2015?lang=ja" style="margin: 5px">
                                                            <i class="material-icons left">input</i>Twitter
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <a class="waves-effect waves-light btn" style="margin: 5px">
                                                            <i class="material-icons left">input</i>GitHub
                                                        </a>
                                                    </li>

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
