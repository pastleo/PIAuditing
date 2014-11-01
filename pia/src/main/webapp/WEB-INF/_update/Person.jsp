<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = String.valueOf(request.getAttribute("id"));
	Person m = id=="new" ? new Person() : new Person(id);
	if (m==null) response.sendRedirect("/404");

	m.org_id = request.getParameter("org_id");
	m.dept_id = Tr.depts( request.getParameter("dept_id") );
	m.p_id = request.getParameter("p_id");
	m.p_name = request.getParameter("p_name");
	m.p_phone = request.getParameter("p_phone");
	m.p_mail = request.getParameter("p_mail");
	m.p_title = request.getParameter("p_title");
	m.p_pass = request.getParameter("p_pass");

	m.save();
	response.sendRedirect("/pia/Person");
%>