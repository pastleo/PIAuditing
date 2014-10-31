<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Models</title>
</head>
<body>
	<%
		pageContext.setAttribute("obj",new Person(),PageContext.PAGE_SCOPE);
		pageContext.setAttribute("cname","Person",PageContext.PAGE_SCOPE);
	%>
	
	<table>
		<thead>
			<tr>
				<c:forEach var="field" items="${obj.fieldNames}">
					<td>
						<c:out value="${field}"/>
					</td>
				</c:forEach>
				<td>Action</td>
			</tr>
		</thead>
		<tbody>
			<c:set var="fn" value="fieldNames"/>
			<c:forEach var="m" items="${obj.allObj}">
				<tr>
					<c:forTokens delims="," var="att" items="${obj.tokens}">
						<td>
							<c:out value="${m[att]}" />
						</td>
					</c:forTokens>
					<td>
						<a href="/pia/${cname}/${m.id}">Edit</a>
						or
						<a href="/pia/${cname}/delete/${m.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
			<tr><td><a href="/pia/${cname}/new">Add new</a></td></tr >
		</tbody>
	</table>
</body>
</html>