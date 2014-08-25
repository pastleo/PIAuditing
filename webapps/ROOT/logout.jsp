<%
session.setAttribute("UA",null);
response.setHeader("Refresh" , "3;url=index.jsp");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
    <h1>You have logout.</h1>
</body>
</html>
