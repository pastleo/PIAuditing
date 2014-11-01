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
	String name = "pia.model2." + cn;

	if(id.equals("new")){
		pageContext.setAttribute("obj",Class.forName(name).newInstance(),PageContext.PAGE_SCOPE);
	}
	else{
		if(cn.equals("Event"))
		pageContext.setAttribute("obj",new Event(id),PageContext.PAGE_SCOPE);
		if(cn.equals("Auditor"))
		pageContext.setAttribute("obj",new Auditor(id),PageContext.PAGE_SCOPE);
		if(cn.equals("Group"))
		pageContext.setAttribute("obj",new Group(id),PageContext.PAGE_SCOPE);
		if(cn.equals("Person"))
		pageContext.setAttribute("obj",new Person(id),PageContext.PAGE_SCOPE);
		if(cn.equals("Dept"))
		pageContext.setAttribute("obj",new Dept(id),PageContext.PAGE_SCOPE);
		if(cn.equals("TestModel"))
		pageContext.setAttribute("obj",new TestModel(id),PageContext.PAGE_SCOPE);
	}
	
	
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
	<title>${cname} edit <%=id%></title>
</head>
<body>
	<div>
		<h3>This is debug message</h3>
		<p>from:<%=request.getAttribute("ctrl")%></p>
		<p>id:<%=request.getAttribute("id")%></p>
	</div>
    
	<form action="/pia/${cname}/<%=id%>" method="post">
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
