<%@ page import="java.util.Enumeration" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<h1>HELLO!!!</h1>
	<% 
		String tar = request.getParameter("v");
	%>
	<p>target = <%=String.valueOf(tar)%></p>
	<p>This page is supposed to forwarding our user.</p>
	<p>For now, append "/?v=view" at the end of URL to see webpage.</p>
	<p>BTW, linkings between pages are breaked at the moment.</p>
	<%
	if(tar != null) {
		if(tar.equals("view")) {  %>
			<jsp:forward page="WEB-INF/front/admin-dep.jsp" />
			
		<% }} %>
	
</body> 
</html>