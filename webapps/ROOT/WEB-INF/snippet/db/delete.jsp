<!-- 說明：刪除資料部份 -->
	<%@ page contentType="text/html;charset=utf-8"%> 
	<%@ include file = "database_ini.jsp"%> 
	<% 
	    if(request.getParameter("delete") != null){ 
	        int num = Integer.parseInt(request.getParameter("num")); 
	        String sql = "delete from tbl where id = " + num; 
	        int a = stmt.executeUpdate(sql); 
	        out.print("Delete success！return index.jsp after 3 seconds！"); 
	        //3秒後將網頁轉跳到首頁 
	            response.setHeader("Refresh" , "3;url=index.jsp"); 
	    } 
	%> 
	<html> 
	    <head> 
	        <title>Update</title> 
	    </head> 
	    <body> 
	        <form action = "delete.jsp" method = "post"> 
	            Num : <input type = "text" name= "num" size = "10" value = ""> 
	            <br /> 
	            <input type = "submit" name = "delete" value = "刪除"> 
	        </form> 
	        <a href="index.jsp">回首頁</a> 
	    </body> 
	</html> 