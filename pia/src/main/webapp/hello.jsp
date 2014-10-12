<html>
    <body>
        <h1>Hello!!!! ${user}</h1>

        <%
          out.print(request.getAttribute("user"));
        %>
    </body>
</html>
