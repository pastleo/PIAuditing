<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model.*" %>

<%
	String id = String.valueOf(request.getAttribute("id"));
	TestModel m = id=="new" ? new TestModel() : new TestModel(id);
	if (m==null) response.sendRedirect("/404");
	m.id = request.getParameter("id");
	
	m.author = request.getParameter("author");
	m.todo = request.getParameter("todo");
	m.detail = request.getParameter("detail");
	m.save();
	response.sendRedirect("/pia/TestModel");
%>