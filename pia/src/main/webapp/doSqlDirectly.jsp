<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="pia.model.DbInit" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<%=  System.getProperty("file.encoding") %>
	<%
		int rowSize = 4;
		//DbInit.getConnection().createStatement().executeUpdate("insert into test (id,author,todo,detail) values ('4','我啦','編碼問題','換成unicode')");
		ResultSet rs = DbInit.getConnection().createStatement()
					.executeQuery("select * from test");

		while(rs.next())
			for(int i=0; i<rowSize; ++i)
				out.print( "<br>" + rs.getString(i+1) );	//index from 1 =.=
	%>
</body>
</html>