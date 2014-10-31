<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>
<%@ page import="java.lang.reflect.*" %>

<%!
	BaseModel m;
%>
<%
	String id = String.valueOf(request.getAttribute("id"));
	String cn = String.valueOf(request.getAttribute("cname"));

	Class c = Class.forName("pia.model2." + cn);
	
	Constructor constructor;
	
	// if(cn.equals("TestModel")){
	// 	if(id.equals("new"))
	// 		pageContext.setAttribute("obj",new TestModel(),PageContext.PAGE_SCOPE);
	// 	else
	// 		pageContext.setAttribute("obj",new TestModel(id),PageContext.PAGE_SCOPE);
	// }
	pageContext.setAttribute("obj",Class.forName("pia.model2.Person").newInstance(),PageContext.PAGE_SCOPE);
	// // m = (id.equals("new")) ?
	// 	(BaseModel) Class.forName("pia.model2." + cn).newInstance() :
	// 	(BaseModel) (Class.forName("pia.model2." + cn).newInstance(id));
	//what happens if new TestModel(id) is executed but not found?
	
	pageContext.setAttribute("cname",cn,PageContext.PAGE_SCOPE);
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
    
	<form action="/pia/${cname}/${obj.id}" method="post">
		<c:forTokens delims="," var="attr" items="${obj.tokens}">
			<c:set var="v" value="${obj[attr]}"/>
			${attr}: <input type="text" name="${attr}" value="${v}">
			<br>
		</c:forTokens>
		<button type="submit">send</button>
		<p><a href="/pia/${cname}">Back</a></p>
	</form>
</body>
</html>
