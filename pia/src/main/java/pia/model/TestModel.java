package pia.model;

import java.sql.*;
import java.util.Vector;
import pia.model.DbInit;

public class TestModel{
	private static String tableName = "test";
	private static String pk = "id";
	private static int count = 4;
	private static PreparedStatement all = null;

	public static Vector<String[]> getAll() throws Exception{
		PreparedStatement all =
			DbInit.getStatement("SELECT * from " + tableName);
		ResultSet rs;
		try{
			rs = all.executeQuery();
		
			Vector<String[]> v = new Vector<String[]>();
			while(rs.next()){
				String a[] = new String[count];
				for(int i=0; i<count; ++i)
					a[i] = rs.getString(i+1);
				v.add(a);
			}
			return v;
		}catch(Exception e){throw e;}
		
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