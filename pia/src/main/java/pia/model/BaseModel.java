package pia.model;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;
//import pia.model.DbInit;

public abstract class BaseModel{
	public BaseModel(){}
	protected static Vector< Map<String,String> > getAll(String tableName,String fields[]) throws Exception{
		
		PreparedStatement all =
			DbInit.getStatement("SELECT * from `" + tableName + "`");
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
	//old one
	protected static ResultSet find(String tableName,String pk,String pkv) throws Exception{
		PreparedStatement sel =
			DbInit.getStatement(
				String.format("SELECT * from `%s` where `%s` = ?",tableName,pk));
		sel.setString(1,pkv);
		return sel.executeQuery();
	}
}
