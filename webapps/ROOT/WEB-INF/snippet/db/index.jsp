<!-- 說明：首頁，顯示全部資料 -->
	<%@ page contentType="text/html;charset=utf-8"%> 
	<%@ include file = "database_ini.jsp"%> 
	<html> 
	    <head> 
	        <title>Index</title> 
	    </head> 
	    <body> 
	        <% 
	            // 建立查詢並產生rs的資料表 
	                String sql = "select * from tbl"; 
	                ResultSet rs = stmt.executeQuery(sql); 
	            //開始顯示 
	                while(rs.next()){ 
	                    String name = rs.getString("name"); 
	                    String num = rs.getString("id"); 
	                    out.print("Name : " + name + " Num : " + num + "<br>"); 
	                } 
	            //關閉資料表 
	                rs.close(); 
	        %> 
	        <br><br> 
	        <a href="insert.jsp">新增資料</a><br> 
	        <a href="delete.jsp">刪除資料</a><br> 
	        <a href="update.htm">修改資料</a><br> 
	    </body> 
	</html> 