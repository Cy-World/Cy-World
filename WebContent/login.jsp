<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  <title>Login|Cy-World</title>
  <!-- FrameWorkImport -->
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection" />
  <!-- CustomImport -->
  <link href="css/top.css" type="text/css" rel="stylesheet" media="screen,projection" />
  <link href="css/login.css" type="text/css" rel="stylesheet" />
  <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
  <script src="js/materialize/materialize.js"></script>
  <script src="js/materialize/init.js"></script>
</head>

<body class="grey lighten-4">

  <!-- GlobalNavi -->
  <nav>
    <div class="nav-wrapper white" style="border-bottom:solid 3px; border-color:gray;">
      <a href="index.html" class="brand-logo left" style="margin-left:50px">
        <span style="color:blue;font-weight:bold">Cy</span>
        <span style="color:grey;font-weight:bold">-World</span>
      </a>
      <ul id="nav-mobile" class="right" style="margin-right:20px">
        <li><a href="registar.html" class="grey-text text-darken-2">Registar</a></li>
        <li><a href="login.html" class="grey-text text-darken-2">Login</a></li>
      </ul>
    </div>
  </nav>

  <!-- MainContents -->
  <div class="contents">
    <!-- Input forms -->
    <form action="LoginServlet" method="post" class="z-depth-3 cardLayout">
      <h4 class="loginTitle">Login</h4>
      <!--User Name  -->
      <div class="inputFormLaytout">
        <div class="input-field col s12">
          <input id="roomName" type="email" class="validate" name="address">
          <label for="email">Email Address</label>
        </div>
        <!-- Email addless -->
        <div class="input-field col s12">
          <input id="roomName" type="password" class="validate" name="passwd">
          <label for="text">Password</label>
        </div>
      </div>
      <button class="waves-effect waves-light btn-large registarButton" type="submit" name="action">Login<i class="material-icons left">room</i></button>
    <%--
      <a href="storming.html" class="waves-effect waves-light btn-large loginButton"><i class="material-icons left">room</i>Login</a>
--%>
    </form>
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
            <li><a class="waves-effect waves-light btn" style="margin:5px" href="https://twitter.com/Cy_World2015?lang=ja"><i class="material-icons left">input</i>Twitter</a></li>
            <li><a class="waves-effect waves-light btn" style="margin:5px"><i class="material-icons left">input</i>GitHub</a></li>
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
