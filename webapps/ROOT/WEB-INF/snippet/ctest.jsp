<%@include file="cshare.jsp"%>
<%@include file="cuser.jsp"%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<p>content</p>
	<%=request.getRequestURL() %>
	<%
	//CUser c = new CUser();
	//out.print(c.getMessage());
	%>
	<br>
	<%= request.getParameter("test") %>
	<% if(request.getParameter("test")==null) { %>
		<p>no view here</p>
	<% } else { %>
		<p>show me your view</p>
		<%@ include file="view.jsp" %>
	<% } %>
	<jsp:include page="view.jsp" />
	<c:if test="${0 > 1}">
		<p>if here</p>
	</c:if>
</body>
</html>
