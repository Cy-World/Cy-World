<%@page contentType="text/html;charset=utf-8" language="java"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>MyPage|Cy-World</title>
  <!-- FrameWorkImport -->
  <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link type="text/css" rel="stylesheet" href="css/materialize.setting.css" />
  <link type="text/css" rel="stylesheet" href="css/materialize.min.css" media="screen,projection" />
  <!-- CustomImport -->
  <link type="text/css" rel="stylesheet" href="css/top.css" />
  <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js">
  </script>
  <script type="text/javascript" src="js/materialize/materialize.min.js">
  </script>
  <script src="js/materialize/init.js"></script>
  <script type="text/javascript" src="js/materialize/test.js"></script>
</head>

<body class="grey lighten-4">
  <!-- Gnav -->
  <nav>
    <div class="nav-wrapper white" style="border-bottom:solid 3px; border-color:gray;">
      <a href="index.html" class="brand-logo left" style="margin-left:50px">
        <span style="color:blue;font-weight:bold">Cy</span>
        <span style="color:grey;font-weight:bold">-World</span>
      </a>
      <ul id="nav-mobile" class="right" style="margin-right:20px">
        <li><a href="myPage.jsp" class="grey-text text-darken-2">MyPage</a></li>
      </ul>
    </div>
  </nav>

  <!-- Contents -->
  <div class="contents">
    <h4 style="margin-left:90px">MyPage</h4>
    <!-- Input forms -->
    <form action="index.html" method="get" class="z-depth-3" style="margin:50px 100px;padding-top:10px;background:white;">
      <div style="margin:10px 90px">
        <!--User Name  -->
        <div class="input-field col s12">
          <input type="text" class="validate">
          <label for="text">UserName</label>
        </div>
        <!-- Email addless -->
        <div class="input-field col s12">
          <input type="email" class="validate">
          <label for="email">Email Address</label>
        </div>
        <!-- Passwd -->
        <div class="input-field col s12">
          <input type="text" class="validate">
          <label for="text">Password</label>
        </div>
      </div>
      <a href="storming.html" class="waves-effect waves-light btn-large" style="margin:10px 0 20px 220px;"><i class="material-icons left">room</i>Create</a>
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
