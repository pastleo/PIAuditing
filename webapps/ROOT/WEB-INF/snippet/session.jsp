<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
</head>
<body>
    <%
    // out.print(session.getId());
    // out.print("<br>");
    // sessoin.setAttribute("sid","hello session");
    // session.getAttribute

    String text;

    if (session.isNew()) {
        text = "h";
        session.setAttribute("cookie",text);
    }else{
        text = "a" + session.getAttribute("cookie");
        session.setAttribute("cookie",text);
}
    out.print(text);
    %>
    <h1>${text}</h1>
    
</body>
</html>
