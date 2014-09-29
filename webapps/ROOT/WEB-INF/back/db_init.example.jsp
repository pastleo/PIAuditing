<!-- 說明：需要用到資料庫引用近來即可 -->
<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="java.sql.*"%> 
<%!
    String db = "";
    String host = ""; //"localhost"
    String url="jdbc:mysql://" + host + ":3306/" + db;
    String user="";
    String pwd="";

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
        conn = DriverManager.getConnection(url,user,pwd); 
        //建立Statement物件 
    }catch(SQLException sqle){
        out.println("SQL Exception : " + sqle); 
    } 
    %> 
