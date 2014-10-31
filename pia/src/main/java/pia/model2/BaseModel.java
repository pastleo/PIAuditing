package pia.model2;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;

public abstract class BaseModel{
	public BaseModel(){}
	public Vector< Map<String,String> > getAll() throws Exception{
		String tableName = getTableName();
		String fields[] = getFieldNames();
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
	protected ResultSet find(String id) throws Exception{
		String tableName = getTableName(), pk = getPk();
		PreparedStatement sel =
			DbInit.getStatement(
				String.format("SELECT * from `%s` where `%s` = ?",tableName,pk));
		sel.setString(1,id);
		return sel.executeQuery();
	}
	public void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?"
				,getTableName(),getPk());
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeUpdate();
	}
	//camel namging convention is a MUST to use getter in jstl
	public abstract String getTableName();
	public abstract String getPk();
	public abstract String[] getFieldNames();
	public abstract String getTokens();
	//It's not abstract so that models implement it on demand
	public String getFieldNamesRaw(){return getTokens();}
	public abstract String getId();
	// public abstract String get(String key);
	// public abstract void set(String key,String value);
}
