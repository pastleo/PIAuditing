package pia.model;

import java.sql.*;

public class DB_base {
    public DB_base(){
    }

    public static Connection init_db() throws SQLException,InstantiationException,ClassNotFoundException,IllegalAccessException{
        String db = "mysql";
        String host = "localhost"; //"localhost"
        String url="jdbc:mysql://" + host + ":3306/" + db;
        String user="root";
        String pwd="";

        Class.forName("com.mysql.jdbc.Driver").newInstance(); 
        //建立一個聯結物件 
        return DriverManager.getConnection(url,user,pwd); 
    }


}
