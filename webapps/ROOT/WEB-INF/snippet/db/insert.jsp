<!-- 說明：新增資料部份 -->
	<%@ page contentType="text/html;charset=utf-8"%> 
	<%@ include file = "database_ini.jsp"%> 
	<% 
	    if(request.getParameter("insert") != null){ 
	        String name = request.getParameter("name"); 
	        String sql = "insert into tbl (name) values ('" + name + "')"; 
	        int a = stmt.executeUpdate(sql); 
	        out.print("Insert success！return index.jsp after 3 seconds！"); 
	        //3秒後將網頁轉跳到首頁 
	            response.setHeader("Refresh" , "3;url=index.jsp"); 
	    } 
	%> 
	<html> 
	    <head> 
	        <title>Insert</title> 
	    </head> 
	    <body> 
	        <form action = "insert.jsp" method = "post"> 
	            Name : <input type = "text" name = "name" size = "10"> 
	            <br /> 
	            <input type = "submit" name = "insert" value = "Insert"> 
	        </form> 
	        <a href="index.jsp">回首頁</a> 
	    </body> 
	</html> 