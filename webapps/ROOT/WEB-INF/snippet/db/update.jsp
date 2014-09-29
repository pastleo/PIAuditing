<!-- 說明：修改資料部份 -->
	<%@ page contentType="text/html;charset=utf-8"%> 
	<%@ include file = "database_ini.jsp"%> 
	<% 
	    if(request.getParameter("update") != null){ 
	        int num = Integer.parseInt(request.getParameter("num")); 
	        String name = request.getParameter("name"); 
	        String sql = "update tbl set name = '" + name + "' where id = " + num; 
	        int a = stmt.executeUpdate(sql); 
	        out.print("Update success！return index.jsp after 3 seconds！"); 
	        //3秒後將網頁轉跳到首頁 
	            response.setHeader("Refresh" , "3;url=index.jsp"); 
	    } 
	    //抓取資料 
	        int num = Integer.parseInt(request.getParameter("num")); 
	        String sql = "select Name from tbl where id = " + num; 
	        ResultSet rs = stmt.executeQuery(sql); 
	        rs.next(); 
	        String Name = rs.getString("Name"); 
	%> 
	<html> 
	    <head> 
	        <title>Update</title> 
	    </head> 
	    <body> 
	        <form action = "update.jsp?num=<%=num%>" method = "post"> 
	            Name : <input type = "text" name= "name" size = "10" value = "<%=Name%>"> 
	            <br /> 
	            <input type = "submit" name = "update" value = "修改"> 
	        </form> 
	        <a href="index.jsp">回首頁</a> 
	    </body> 
	</html> 