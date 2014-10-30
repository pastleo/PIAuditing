<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<%!
	TestModel m;
%>
<%
	String id = String.valueOf(request.getAttribute("id"));
	m = (id.equals("new")) ? new TestModel() : new TestModel(id);
	//what happens if new TestModel(id) is executed but not found?
	 pageContext.setAttribute("obj",m,PageContext.PAGE_SCOPE);
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Model edit</title>
</head>
<body>
	<p>from:<%=request.getAttribute("ctrl")%></p>
	<p>id:<%=request.getAttribute("id")%></p>
    
	<form action="/pia/models/<%=m.id%>" method="post">
		<c:forTokens delims=" " var="attr" items="idAttr author todo detail">
			<br>
				<c:out value="${obj[attr]}"/>
			
		</c:forTokens>
		<%
			// for(String field:m.getFieldNames())
			// 	out.print(
			// 		String.format("<p>%s:"
			// 			+"<input name=\"%s\"type=\"text\" value=\"%s\"/>"
			// 			+"</p>",field,field,m.get(field))
			// 		);
		%>
		<button type="submit">send</button>
		<p><a href="/pia/models">Back</a></p>
	</form>
</body>
</html>
