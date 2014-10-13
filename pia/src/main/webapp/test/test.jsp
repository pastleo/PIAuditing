<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="pia.model.*" %>
<%@ page import="java.util.*" %>

<%
	String person[] =
	{"org_id","dept_id","p_id","p_name","p_phone","p_mail","p_title","p_pass"};
    List<Map<String,String>> datas = Person.getAll();
    for(Map<String,String> m:datas)
    	for(String n:person)
    		out.print("<br>" + m.get(n));
%>
