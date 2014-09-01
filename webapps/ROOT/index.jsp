<%@ page contentType="text/html;charset=utf-8"%> 
<%
    //Let's redirect around the world.
    String ua = (String) session.getAttribute("UA");
    if (ua != null) {
        response.setHeader("Refresh" , "1;url=admin.jsp");
    }
%>
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
            <!-- 這邊是左側的扛棒 -->
            <div class="col-md-6">
                <div class="jumbotron">
                  <h1>個資稽核系統</h1>
                  <p>Currently, to login as a normal user, access with backdoor.</p>
                  <p><a class="btn btn-primary btn-lg" role="button" onclick="alert('先掛著')">使用規範 »</a></p>
                </div>
            </div>
            <div class="col-md-6">
              <!-- 這邊是填寫帳密的表單 -->
                <form class="form-signin" role="form"
                          action = "login.jsp" method = "post">

                  <h2 class="form-signin-heading">請登入</h2>
                  <div class="col-md-2"></div>
                  <!-- 我把全世界的登入資料都放在這裡了，自己去POST吧 -->
                  <input type="text" class="form-control" placeholder="請在此輸入帳號" required="" autofocus="" name="usr_mail"> <!-- name="usr_mail" -->
                  <div class="row">&nbsp;</div>
                  <input type="password" class="form-control" placeholder="請在此輸入密碼" required="" name="pwd"> <!-- name="pwd" -->
                  <div class="checkbox" >
                    <label>
                      <input type="checkbox" value="remember-me">記住我(<-目前無作用)
                    </label>
                  </div>
                  <button class="btn btn-lg btn-primary btn-block" type="submit">登入</button>
                  <a href="user.jsp" class="btn btn-primary" role="button">後門(as user)</a>
                  <a href="admin.jsp" class="btn btn-primary" role="button">後門(as admin)</a>

                </form>
            </div>
        </div> <!-- /container -->
    </body>
</html>