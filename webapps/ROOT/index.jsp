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
	<p>tar=<%=String.valueOf(tar)%></p>
	<%
	if(tar != null) {
		if(tar.equals("view")) {  %>
			<jsp:forward page="WEB-INF/new/admin-dep.jsp" />
			
		<% }} %>
	
</body> 
</html>