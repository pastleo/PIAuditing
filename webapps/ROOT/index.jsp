<%@ page contentType="text/html;charset=utf-8"%> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

        <title>個資稽核系統</title>

        <style>
            body{
                padding-top:60px;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <div class="col-md-6">
                <div class="jumbotron">
                  <h1>個資稽核系統</h1>
                  <p>就這樣</p>
                  <p><a class="btn btn-primary btn-lg" role="button">使用規範 »</a></p>
                </div>
            </div>
            <div class="col-md-6">
                <form class="form-signin" role="form">
                  <h2 class="form-signin-heading">請登入</h2>
                  <div class="col-md-2"></div>
                  <input type="email" class="form-control" placeholder="請在此輸入帳號" required="" autofocus="">
                  <div class="row">&nbsp;</div>
                  <input type="password" class="form-control" placeholder="請在此輸入密碼" required="">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" value="remember-me">記住我
                    </label>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
                  <a href="user.jsp" class="btn btn-primary btn-block" role="button">後門</a>
                </form>
            </div>
        </div> <!-- /container -->
    </body>
</html>