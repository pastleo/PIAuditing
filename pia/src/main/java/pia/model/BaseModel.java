package pia.model;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;
//import pia.model.DbInit;

public abstract class BaseModel{
	// protected static String tableName;
	// protected static String pk;
	// protected static String fields[];

	// static{
	// 	String tableName = null;
	// 	String pk = null;
	// 	fields = null;
	// }
	public BaseModel(){}
	//public static String getName(){return "SELECT * from " + tableName;}
	protected static Vector< Map<String,String> > getAll(String tableName,String fields[]) throws Exception{
		
		PreparedStatement all =
			DbInit.getStatement("SELECT * from " + tableName);
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Map<String,String> > v = new Vector< Map<String,String> >();
			while(rs.next()){
				Map m = new TreeMap<String,String>();
				for(String n:fields)
					m.put(n, rs.getString(n) );
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
		
	}

	protected static ResultSet find(String tableName,String pk,String pkv) throws Exception{
		PreparedStatement sel =
			DbInit.getStatement(
				String.format("SELECT * from %s where `%s` = ?",tableName,pk));
		sel.setString(1,pkv);
		return sel.executeQuery();
	}
	// public static void delete(String id){
	// 	PreparedStatement del =
	// 		 DbInit.getStatement("DELETE FROM ? WHERE ?=?");
	// 	try{
	// 		del.setString(1,tableName);
	// 		del.setString(2,pk);
	// 		del.setString(3,id);
	// 		del.executeQuery();
	// 	}catch(Exception e){}
	// }

}
