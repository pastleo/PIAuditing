<%@ page contentType="text/html;charset=utf-8"%> 
<%
session.setAttribute("UA",null);
//TODO: set admin/user cookie to null, which does not exist at this moment...
out.print("<script>alert(\"登出成功\")</script>");
response.setHeader("Refresh" , "1;url=index.jsp");
%>
白白der