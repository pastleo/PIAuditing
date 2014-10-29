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
		String name = "pia.model2.TestModel";
		BaseModel i = (BaseModel)Class.forName(name).newInstance();
		pageContext.setAttribute("obj",i,PageContext.PAGE_SCOPE);
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
			<c:forEach var="m" items="${obj.all}">
				<tr>
					<c:forEach var="field" items="${obj.fieldNames}">
						<td>
							<c:out value="${m[field]}" />
						</td>
					</c:forEach>
					<td>
						<a href="/pia/models/${m.id}">Edit</a>
						or
						<a href="/pia/models/delete/${m.id}">Delete</a>
					</td>
				</tr>
			</c:forEach>
			<tr><td><a href="/pia/models/new">Add new</a></td></tr >
		</tbody>
	</table>
</body>
</html>