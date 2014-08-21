<!-- 說明：需要用到資料庫引用近來即可 -->
	<%@ page contentType="text/html;charset=utf-8"%> 
	<%@ page import="java.sql.*"%> 
	<%! 
	    String user = "root"; 
	    String pass = ""; 
	    String database = "test"; 
	    String url = "jdbc:mysql://127.0.0.1/" + database;
	    	//+ "?useUnicode=true&characterEncoding=big5"; 
	     
	    //建立一個聯結物件 
	        Connection conn; 
	    //建立Statement物件，建立陳述式物件 
	        Statement stmt; 
	%> 
	<% 
	    try{ 
	        //定義驅動程式與資料來源之間的連結 
	            Class.forName("com.mysql.jdbc.Driver").newInstance(); 
	        //建立一個聯結物件 
	            conn = DriverManager.getConnection(url,user,pass); 
	        //建立Statement物件 
	            stmt = conn.createStatement(); 
	    }catch(SQLException sqle){ 
	        out.println("SQL Exception : " + sqle); 
	    } 
	%> 