<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="pia.model2.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	String id = String.valueOf(request.getAttribute("id"));
	Event m = id=="new" ? new Event() : new Event(id);
	if (m==null) response.sendRedirect("/404");

	m.event_id = request.getParameter("event_id");
	m.event_name = request.getParameter("event_name");
	m.event_from = request.getParameter("event_from");
	m.event_end = request.getParameter("event_end");

	m.save();
	response.sendRedirect("/pia/Event");
%>