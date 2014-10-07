package pia.model;

import java.sql.*;
//import pia.model.DbInit;

public abstract class BaseModel{
	private static String tableName = "n/a";
	private static String pk = "";
	private static PreparedStatement all;

	public static void init(){
		all = DbInit.getStatement("SELECT * from ?");
		try{
			all.setString(1,tableName);	
		}catch(Exception e){}
	}

	public static ResultSet getAll(){
		//Or do not return ResultSet
		try{
			return all.executeQuery();
		}catch(Exception e){}
		return null;
	}

	public static void delete(String id){
		PreparedStatement del =
			 DbInit.getStatement("DELETE FROM ? WHERE ?=?");
		try{
			del.setString(1,tableName);
			del.setString(2,pk);
			del.setString(3,id);
			del.executeQuery();
		}catch(Exception e){}		
	}

	public static void select(String id){
		PreparedStatement sel =
			 DbInit.getStatement("SELECT FROM ? WHERE ?=?");
		try{
			sel.setString(1,tableName);
			sel.setString(2,pk);
			sel.setString(3,id);
			sel.executeQuery();
		}catch(Exception e){}		
	}

	public static void update(String id){
		PreparedStatement upd =
			 DbInit.getStatement("UPDATE FROM ? SET ... WHERE ?=?");
		try{			
			upd.setString(1,tableName);
			upd.setString(2,pk);
			upd.setString(3,id);
			upd.executeQuery();
		}catch(Exception e){}		
	}

	public static void insert(){
		PreparedStatement ins =
			 DbInit.getStatement("INSERT INTO ? VALUES ...");
		try{
			ins.setString(1,tableName);
			ins.executeQuery();
		}catch(Exception e){}
	}
}