package pia.model;

import java.sql.*;

public class DbInit{
	private static Connection connection = null;

	private static void init(){
		String db = "pims";
		String host = "140.120.14.76"; //"localhost"
		String url="jdbc:mysql://" + host + ":3306/" + db;
		String user="pims";
		String pwd="pimsdbs"; 

		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(url,user,pwd); 
		}catch(Exception e){
			//gg	
		}
		return;
	}

	public static Connection getConnection(){
		if( connection == null) init();
		return connection;
	}

	public static PreparedStatement getStatement(String sql){
		if( connection == null) init();
		try{
			return connection.prepareStatement(sql);
		}catch(Exception e){}
		return null;
	}
}