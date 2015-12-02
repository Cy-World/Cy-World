<%@page contentType="text/html;charset=utf-8" language="java"%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8" />
        <title>CreateRoom|Cy-World</title>
        <!-- FrameWorkImport -->
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
        <link href="css/materialize.setting.css" rel="stylesheet" type="text/css" />
        <link href="css/materialize.min.css" media="screen,projection" rel="stylesheet" type="text/css" />
        <!-- CustomImport -->
        <link href="css/createRoom.css" rel="stylesheet" type="text/css" />
        <link href="css/top.css" rel="stylesheet" type="text/css" />

        <script src="https://code.jquery.com/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="js/materialize/materialize.min.js" type="text/javascript"></script>
        <script src="js/init.js"></script>
        <script src="js/materialize/test.js" type="text/javascript"></script>
    </head>

    <body class="grey lighten-4">

        <!-- GlobalNavi -->
        <nav>
            <div class="nav-wrapper white" style="border-bottom: solid 3px; border-color: gray;">
                <a class="brand-logo left" href="index.jsp" style="margin-left: 50px">
                    <span style="color: blue; font-weight: bold">Cy</span>
                    <span style="color: grey; font-weight: bold">-World</span>
                </a>
                <ul class="right" id="nav-mobile" style="margin-right: 20px">
                    <li>
                        <a class="grey-text text-darken-2" href="registar.jsp">Registar</a>
                    </li>
                    <li>
                        <a class="grey-text text-darken-2" href="login.jsp">Login</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- MainContents -->
        <div class="contents">

            <!-- Input forms -->
            <form action="CreateRoomServlet" class="z-depth-3 cardLayout" method="post">
                <h4 class="createRoomTitle">Create Room</h4>
                <!--User Name  -->
                <div class="inputFormLayout">
                    <div class="input-field col s12">
                        <input class="validate" id="roomName" name="roomName" type="text" />
                        <label for="text">Room Name</label>
                    </div>
                    <!-- Email addless -->
                    <div class="input-field col s12">
                        <textarea class="materialize-textarea" id="comment" name="comment" type="text"></textarea>
                        <label for="textarea1">Comment</label>
                    </div>
                    <p>
                        <input class="with-gap" name="roomConf" type="radio" id="0" value="0"/>
                        <label for="0">Public</label>
                    </p>
                    <p>
                        <input class="with-gap" name="roomConf" type="radio" id="1" value="1"/>
                        <label for="1">Private</label>
                    </p>
                    <button class="waves-effect waves-light btn-large buttonLayout" name="action" type="submit">Login
                        <i class="material-icons left">room</i>
                    </button>
                </div>
            </form>
        </div>

        <!-- footer-->
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
