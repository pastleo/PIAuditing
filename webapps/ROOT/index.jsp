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
	<p>This page is supposed to forwarding pages, and unseen by our user.</p>
	<p>For now, append "/?v=1" at the end of URL to see webpage.</p>
	<%
	if(tar != null) {
		//cannot switch based on string =.=
		switch(Integer.valueOf(tar)) {  
		case 1:	%>
			<jsp:forward page="WEB-INF/front/admin-dep.jsp" />
		<%	break;
		case 2: %>
			<jsp:forward page="WEB-INF/front/admin-person.jsp" />
		<%	break;
		case 3: %>
			<jsp:forward page="WEB-INF/front/admin-audit.jsp" />
		<%	break;
		case 4: %>
			<jsp:forward page="WEB-INF/front/admin-cal.jsp" />
		<%	break;
		case 5: %>
			<jsp:forward page="WEB-INF/front/admin-event.jsp" />
		<%	break;
		}} %>
	
</body> 
</html>