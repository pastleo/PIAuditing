<%@ tag description="PIAuditing Overall Template" pageEncoding="UTF-8"%>
<%@ attribute name="head" fragment="true" %>
<%@ attribute name="foot" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>個資稽核系統</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <link rel="stylesheet" href="/pia/assets/css/site.css">

    <jsp:invoke fragment="head"/>

</head>
<body>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>個資稽核系統</h1>
        <!-- <p>This is a template for a simple marketing or informational website. It includes a large callout called a jumbotron and three supporting pieces of content. Use it as a starting point to create something more unique.</p> -->
        <!-- <p><a class="btn btn-primary btn-lg" role="button">使用規範 »</a></p> -->
      </div>

      <div class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span class="sr-only">個資稽核系統</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">個資稽核系統</a>
          </div>
          <div class="navbar-collapse collapse">
            <!-- <ul class="nav navbar-nav">
              <li class="active"><a href="#">Home</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">稽核資料 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li class="dropdown-header">空</li>
                  <li><a href="#">data1</a></li>
                  <li class="divider"></li>
                  <li><a href="#">data2</a></li>
                </ul>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">被稽核資料 <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li class="dropdown-header">空</li>
                  <li><a href="#">data1</a></li>
                  <li class="divider"></li>
                  <li><a href="#">data2</a></li>
                </ul>
              </li>
            </ul> -->
            <ul class="nav navbar-nav navbar-right">
              <li><a href="logout">登出</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <%
        Object message = request.getAttribute("message");
        if(message != null){
          %>
        <div class="well">${message}</div>
      <% } %>
      <jsp:doBody/>
    </div> <!-- /container -->

  <!-- Bootstrap core JavaScript
  ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

  <!-- Latest compiled and minified JavaScript -->
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <script src="/pia/assets/js/site.js"></script>

  <jsp:invoke fragment="foot"/>

</body>
</html>
