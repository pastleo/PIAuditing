//This file has secret secret data.

package pia.model;

import java.sql.*;

public class DbInit{
	private static Connection connection;

	static{
		String db = "pims";
		String host = "140.120.14.76"; //"localhost"
		String url="jdbc:mysql://" + host + ":3306/" + db +"?useUnicode=true&characterEncoding=utf-8";
		String user="pims";
		String pwd="pimsdbs"; 

		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			connection = DriverManager.getConnection(url,user,pwd); 
		}catch(Exception e){}
	}

	public static Connection getConnection(){
		return connection;
	}

	public static PreparedStatement getStatement(String sql) {
		try{
			return connection.prepareStatement(sql);
		}catch(Exception e){}
		return null;
	}

	public static void update(String sql) throws Exception{
		connection.createStatement().executeUpdate(sql);
	}

	public static ResultSet query(String sql) throws Exception{
		return connection.createStatement().executeQuery(sql);
	}
}