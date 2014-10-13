package pia.model;

import java.sql.*;
import java.util.Vector;
//import pia.model.DbInit;

public abstract class BaseModel{
	//protected static String tableName = null;
	//protected static String pk = null;

	// public BaseModel(String tn,String pk){
	// 	this.tableName = tn;
	// 	this.pk = pk;
	// }

	// public static Vector<String[]> getAll() throws Exception {return null;}

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
