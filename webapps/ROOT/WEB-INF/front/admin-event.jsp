<%@ page contentType="text/html;charset=utf-8"%> 
<!-- To be trimed -->
<%
    // String ua = (String) session.getAttribute("UA");
    // if (ua == null) {
    //     out.print("<script>alert(\"請先登入\")</script>");
    //     response.setHeader("Refresh" , "0;url=index.jsp");
    // }
%>
    <html lang="zh-TW"><head>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <link rel="stylesheet" href="site.css">

    <title>個資稽核系統</title>
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
              <li><a href="logout.jsp">登出</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      
      <div class="col-xs-3">
        <div class="alert alert-info" role="alert">
          xxx您好
        </div>
        <div class="list-group">
          <a href="/?v=1" class="list-group-item">單位資料表</a>
          <a href="/?v=2" class="list-group-item">人員資料表</a>
          <a href="/?v=3" class="list-group-item">稽核設定</a>
          <a href="/?v=4" class="list-group-item">行事曆</a>
          <a href="/?v=5" class="list-group-item active">事件設定</a>
        </div>
      </div>
      <div class="col-xs-9">

        <table class="table table-hover">
          <thead>
            <tr>
              <td>#</td>
              <td>事件名稱</td>
              <td>事件期限</td>
              <td>有效</td>
              <td>過期</td>
              <td colspan="2" style="text-align: center;">動作</td>
            </tr>
            <tr class="input">
              <td class="input-cell">選取</td>
              <td><input type="text" class="form-control"></td>
              <td><input type="text" class="form-control"></td>
              <td></td>
              <td></td> 
              <td class="input-cell"><a href="">新增</a></td>
              <td class="input-cell"><a href="">刪除</a></td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>內稽</td>
              <td>2014/12/31</td>
              <td>是</td>
              <td>否</td>
              <td><a href="">修改</a></td>
              <td><a href="">刪除</a></td>
            </tr>
            <tr>
              <td>2</td>
              <td>外稽</td>
              <td>2014/12/31</td>
              <td>是</td>
              <td>否</td>
              <td><a href="">修改</a></td>
              <td><a href="">刪除</a></td>
            </tr>
          </tbody>

        </table>

      <footer>
        <p>© Company 2014</p>
      </footer>
    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script src="site.js"></script>

  </body>
</html>
