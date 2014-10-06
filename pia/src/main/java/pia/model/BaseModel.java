package pia.model;
import java.sql.*;

public abstract class BaseModel{
	private static String tableName = "n/a";
	private static PreparedStatement select;
	private static PreparedStatement insert;
	private static PreparedStatement update;
	private static PreparedStatement delete;

	public static void init(){
		//Connection conn from dbinit
		select = conn.prepareStatement("select * from ?");
		select.setString(1,tableName);
	}
	public static ResultSet getAll(){
		//Or do not return ResultSet
		return select.executeQuery();
	}
}
