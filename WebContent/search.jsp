<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta content="text/html; charset=utf-8" http-equiv="Content-Type"/>
        <title>Registar|Cy-World</title>
        <!-- FrameWorkImport -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
        <link href="css/materialize.css" media="screen,projection" rel="stylesheet" type="text/css"/>
        <!-- CustomImport -->
        <link href="css/top.css" media="screen,projection" rel="stylesheet" type="text/css"/>
        <link href="css/inputCard.css" rel="stylesheet" type="text/css"/>
        <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
        <script src="js/materialize/materialize.js"></script>
        <script src="js/materialize/init.js"></script>

    </head>

    <body class="grey lighten-4">

        <!-- GlobalNavi -->
        <nav>
            <div class="nav-wrapper white" style="border-bottom:solid 3px; border-color:gray;">
                <a class="brand-logo left" href="index.jsp" style="margin-left:50px">
                    <span style="color:blue;font-weight:bold">Cy</span>
                    <span style="color:grey;font-weight:bold">-World</span>
                </a>
                <ul class="right" id="nav-mobile" style="margin-right:20px">
                    <li>
                        <a class="grey-text text-darken-2" href="registar.jsp">Registar</a>
                    </li>
                    <li>
                        <a class="grey-text text-darken-2" href="login.jsp">Login</a>
                    </li>
                </ul>
                <form action="index.html" class="right" method="post" style="margin-right:30%">
                    <input id="search" type="sarch" placeholder="Search user or room" style="height:30px;"size="60"/>
                </form>

            </div>
        </nav>

        <!-- MainContents -->

        <%--
            <div class="input-field col s5">
                <input class="" id="last_name" type="text"/>
                <label for="last_name">Last Name</label>
            </div>
 --%>

        <!-- fotter -->
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
                                <a class="waves-effect waves-light btn" href="https://twitter.com/Cy_World2015?lang=ja" style="margin:5px">
                                    <i class="material-icons left">input</i>Twitter</a>
                            </li>
                            <li>
                                <a class="waves-effect waves-light btn" style="margin:5px">
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
