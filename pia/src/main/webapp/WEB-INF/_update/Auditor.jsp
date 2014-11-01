<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = String.valueOf(request.getAttribute("id"));
	Auditor m = id=="new" ? new Auditor() : new Auditor(id);
	if (m==null) response.sendRedirect("/404");

	m.event_id = request.getParameter("event_id");
	m.org_id = request.getParameter("org_id");
	m.p_id = request.getParameter("p_id");
	m.ad_org_id = request.getParameter("ad_org_id");
	m.ad_dept_id = request.getParameter("ad_dept_id");
	m.ad_time_from = request.getParameter("ad_time_from");
	m.ad_time_end = request.getParameter("ad_time_end");

	m.save();
	response.sendRedirect("/pia/Auditor");
%>