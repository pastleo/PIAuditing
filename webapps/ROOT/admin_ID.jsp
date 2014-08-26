<%@ page contentType="text/html;charset=utf-8"%> 
<html lang="zh-TW"><head>


    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>身份指定 | 個資稽核系統</title>

    <style>
            body{
                padding-top:40px;
            }
        </style>

  </head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
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
          <ul class="nav navbar-nav">
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
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="logout.jsp">登出</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="container">
      <div class="page-header">
        <h1>身份指定</h1>
      </div>

      <div class="col-md-5">
        <h3>受稽核單位</h3>
        <div class="col-md-11">
        <select class="form-control">
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
        </select>
        </div>
      </div>
      <div class="col-md-5">
        <h3>稽核人員</h3>
        <div class="row">
          <div class="col-xs-10">
            <input type="text" class="form-control" placeholder="請輸入稽核人員名稱">
          </div>
        </div>
      </div>
      <div class="col-md-12">&nbsp;</div>
      <div class="col-md-2 col-md-offset-4">
        <button class="btn btn-lg btn-primary btn-block" type="submit">送出</button>
      </div>
      <div class="row">&nbsp;</div>

      <hr>

      <footer>
        <p>© Company 2014</p>
      </footer>
    </div> <!-- /container -->  

</body></html>