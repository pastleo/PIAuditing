package pia.model;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;
import pia.model.*;

public class Person extends BaseModel {
	protected static PreparedStatement all;
	private static int count = 8;
	private static String tableName = "person";
	private static String pk = "p_id";

	public Person(){
		// super("person","p_id");
		// tableName = "person";
	}

	public static Vector< Map<String,String> > getAll() throws Exception{
		String person[] =
		{"org_id","dept_id","p_id","p_name","p_phone","p_mail","p_title","p_pass"};
		PreparedStatement all =
			DbInit.getStatement("SELECT * from " + tableName);
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Map<String,String> > v = new Vector< Map<String,String> >();
			while(rs.next()){
				Map m = new TreeMap<String,String>();
				for(String n:person)
					m.put(n, rs.getString(n) );
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
		

	}
}
