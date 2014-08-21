<%@ page contentType="text/html;charset=utf-8"%> 
<%@ page import="java.sql.*"%> 
<%@ page import="java.util.List" %>
<%@ page import="java.util.Vector" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.TreeMap" %>

<% 

try
{
//讀取mysqlDriver驅動程式
Class.forName("com.mysql.jdbc.Driver").newInstance();
 try
 {
 //連接mysql資料庫db,帳號：root密碼：mysql
 String db = "pims";
 String host = "140.120.14.76"; //"localhost"
 String url="jdbc:mysql://" + host + ":3306/" + db;
 String id="pims";
 String pwd="pimsdbs";

 Connection conn= DriverManager.getConnection(url,id,pwd); 

  try
  {
  //建立statement
  Statement stmt = conn.createStatement();

   try
   {
   //建立SQL查詢

   String sql = "select * from pims_user"; 
   //String sql2 = "insert into tbl (name) values('feta')";
   //stmt.executeUpdate(sql2);
   ResultSet rs = stmt.executeQuery(sql);

   //冏冏冏冏冏
   String field_names[]={
      "user_account",
      "user_name",
      "user_passwd",
      "user_mail",
      "user_dept",
      "user_level"};  //feel free to comment out, or reorder.
    //initailize container
   Map<String,List<String> > m = new TreeMap <String,List<String> >();
   for(String name : field_names)
      m.put(name,new Vector<String>());
   
    //retrieve all data at once
    while(rs.next())
    {
      for(String name : field_names)
        m.get(name).add(rs.getString(name));
      
      /*out.print(rs.getString(1));
      out.print(" ");
      out.print(rs.getString(2));
      out.print("<br>");*/
    }

    //print
    for(String name : field_names){
        out.print("<div>");
        out.print("<h3>我是" + name + "</h3>");
        out.print("<select>");
        for(String s:m.get(name))
          out.print("<option value=\""+s+"\">"+s+"</option>");
        out.print("</select>");
        out.print("</div>");
      }

   }
   //從這邊開始往下都不是重點
   catch (Exception ex)
   {
    out.println("~can't read data~");
    out.println(ex.toString());
   }
  }
  catch (Exception e)

  {

  out.println("can't create statement");

  out.println(e.toString());

  }


 }

 catch(Exception e)

 {

 out.println("can't content mysql database");

 out.println(e.toString());

 }

}

catch(Exception e)

{

out.println("can't load mysql driver");

out.println(e.toString());

}


%>