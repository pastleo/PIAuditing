<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = String.valueOf(request.getAttribute("id"));
	Dept m = id=="new" ? new Dept() : new Dept(id);
	if (m==null) response.sendRedirect("/404");

	m.org_id = request.getParameter("org_id");
	m.group_id = request.getParameter("group_id");
	m.dept_id = request.getParameter("dept_id");
	m.dept_name = request.getParameter("dept_name");

	m.save();
	response.sendRedirect("/pia/Dept");
%>