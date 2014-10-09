<%@ page import="pia.model.DbInit" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<%
		int rowSize = 4;
		ResultSet rs = DbInit.getConnection().createStatement()
					.executeQuery("select * from test");
		while(rs.next())
			for(int i=0; i<rowSize; ++i)
				out.print( "<br>" + rs.getString(i+1) );	//index from 1 =.=
	%>
</body>
</html>