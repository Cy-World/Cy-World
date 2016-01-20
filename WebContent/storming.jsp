<%@page import="cyworld.model.RoomBean"%>
<%@page import="cyworld.model.User"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Storming|Cy-World</title>
        <!-- FrameWorkImport -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
        <link href="css/materialize.min.css" media="screen,projection" rel="stylesheet" type="text/css"/>
        <!-- CustomImport -->
        <link href="css/storming.css" rel="stylesheet" type="text/css"/>
        <link href="css/top.css" media="screen,projection" rel="stylesheet" type="text/css"/>
    </head>
    <body class="grey lighten-4">
        <!--Import jQuery before materialize.js-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="js/materialize/materialize.min.js" type="text/javascript"></script>
        <script src="js/materialize/init.js" type="text/javascript"></script>
        <script charset="UTF-8" src="js/cyworldjs/storming.js" type="text/javascript"></script>
        <script src="js/cyworldjs/jquery.json.js" type="text/javascript"></script>
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

        <!-- overlay -->
        <div id="bg-overlay"></div>
        <!--input-->
        <div class="z-depth-3 cardLayout" id="card-input">
            <div class="row">
                <div class="inputFormLaytout">
                    <input class="input-field col s12" class="validate" id="input-val" name="idea" placeholder="please input your idea" type="text" required="required"/>
                    <button class="btn waves-effect waves-light s4 offset-2 cardadd" name="action" type="submit">ADD!!
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </div>
        </div>
        <!--tmp-->
        <div class="z-depth-3 card-panel white small col s3" id="card-tmp">
            <div class="card-content gray-text">
                <p></p>
            </div>
            <!--
            <div class="card-action row">
                <a class="col s3" href="#">DEL</a>
                <a class="col s3" href="#">TAG</a>
                <a class="col s3" href="#">NICE</a>
            </div>
            -->
        </div>
        <!-- content-body -->
        <div class="content-body">
            <div class="row">
                <div class="col s1">
                    <a class="btn-floating btn-large waves-effect waves-light red cardadd">
                        <i class="material-icons">add</i>
                    </a>
                </div>
                <div class="col s9">
                    <h4 class="titleLayout" style="color:blue">
                    <%
                    RoomBean joinRoom=(RoomBean)session.getAttribute("joinRoom");
                    out.print(joinRoom.getRoomName());
                    %>
                    </h4>
                </div>
                <!-- Modal Trigger -->
                <div class="col s2">
                    <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Member</a>
                </div>
            </div>
            <!-- main content -->
            <div class="row" id="main-content"></div>
            <!-- Modal Structure -->
            <div class="modal bottom-sheet" id="modal1">
                <div class="modal-content">
                    <h4>Member List</h4>
                    <%
                        List<User> joinUserList=(List<User>)session.getAttribute("joinUserList");
                        if(joinUserList!=null)for(User joinUser:joinUserList){
                            out.println(joinUser.getName());
                        }%>
                </div>
            </div>
            <!-- footer -->
            <footer class="page-footer blue-grey darken-4" id="footer">
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
                                        <i class="material-icons left">input</i>Twitter</a>
                                </li>
                                <li>
                                    <a class="waves-effect waves-light btn" style="margin: 5px">
                                        <i class="material-icons left">input</i>GitHub</a>
                                </li>
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
        </div>
    </body>
</html>
