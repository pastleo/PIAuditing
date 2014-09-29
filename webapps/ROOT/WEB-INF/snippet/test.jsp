<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="java.sql.*" %>

<%
    try{
        String db_user="root";
        String db_pwd="";
        String db_database="mysql";

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection =
            DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/"+db_database+"?user="+db_user+"&password="+db_pwd+"&useUnicode=true&characterEncoding=UTF-8"
            ); 
    } catch (ClassNotFoundException e) {
        out.println("Where is your MySQL JDBC Driver?");
        e.printStackTrace();
    } catch (Exception ex) {
        out.println("ERROR:");
        out.println(ex.toString());
    }
%>

<% for (int i=0; i<10 ; i++ ) { %>
(^^^) Success (^^^)  <br>
<% } %>
