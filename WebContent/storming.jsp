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
        <body class="grey lighten-4">
            <!--Import jQuery before materialize.js-->
            <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
            <script src="js/materialize/materialize.min.js" type="text/javascript"></script>
            <script src="js/materialize/init.js" type="text/javascript"></script>
            <script src="js/cyworldjs/storming.js" type="text/javascript"></script>
            <nav>
                <div class="nav-wrapper white" style="border-bottom: solid 3px; border-color: gray;">
                    <a class="brand-logo left" href="index.html" style="margin-left: 50px">
                        <span style="color: blue; font-weight: bold">Cy</span>
                        <span style="color: grey; font-weight: bold">-World</span>
                    </a>
                    <ul class="right" id="nav-mobile" style="margin-right: 20px">
                        <li>
                            <a class="grey-text text-darken-2" href="LogoutServlet">Logout</a>
                        </li>
                        <li>
                            <a class="grey-text text-darken-2" href="myPage.jsp">MyPage</a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- template -->
            <div id="bg-overlay"></div>
            <div id="card-tmp">
                <div class="z-depth-3 cardLayout">

                    <h4 class="titleLayout">Input Idea</h4>
                    <div class="inputFormLaytout">
                        <!-- Password -->
                        <div class="input-field">
                            <textarea class="materialize-textarea" id="value" name="value" type="text"></textarea>
                            <label for="value">Your Idea</label>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-body -->
            <div class="content-body">
                <div class="row">
                    <div class="col s1">
                        <a class="btn-floating btn-large waves-effect waves-light red" id="cardadd">
                            <i class="material-icons">add</i>
                        </a>
                    </div>
                </div>
                <!-- main content -->
                <div class="row" id="main-content">
                    <form class="col s3">
                        <%-- Shigure LAyout --%>
                        <div class="z-depth-3 card white">
                            <div class="card-content gray-text">
                                <p>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/>米が食べた<br/></p>
                            </div>
                            <div class="card-action">
                                <a href="#">God</a>
                                <a href="#">Menu</a>
                            </div>
                        </div>
                        <!--Shigure Layout-->
                    </form>
                </div>
                <!-- Modal Structure -->
                <div class="modal bottom-sheet" id="modal1">
                    <div class="modal-content">
                        <%
                    List<User> joinUserList=(List<User>)session.getAttribute("joinUserList");
                    if(joinUserList!=null)for(User joinUser:joinUserList){%>
                    	<%=joinUser.getName() %>
                    <%
                    }%>
                    </div>
                </div>
            <!-- Modal Trigger -->
                <div class="row">
                    <div class="col offset-s10 s1">
                        <a class="waves-effect waves-light btn modal-trigger" href="#modal1">Member</a>
                    </div>
                </div>
                <!-- footer -->
                <footer class="page-footer blue-grey darken-4">
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
                            © 2014 Copyright Cy-World
                            <!-- <a class="grey-text text-lighten-4 right" href="#!">More Links</a> -->
                        </div>
                    </div>
                </footer>
            </body>
        </html>
