package pia.model2;

import java.sql.*;
import java.util.*;
import pia.model.*;

public class Tr{
	private static TreeMap<String,String> dept_is = null;
	private static TreeMap<String,String> dept_si = null;
	static{
		String sql = "select dpt_id,dept_name from pims_dept";
		dept_is = new TreeMap<String,String>();
		dept_si = new TreeMap<String,String>();

		try{
			ResultSet rs = DbInit.query(sql);
			while(rs.next()){
				dept_is.put(rs.getString("dpt_id"),rs.getString("dept_name"));
				dept_si.put(rs.getString("dept_name"),rs.getString("dpt_id"));
			}
		}catch(Exception e){}
	}
	public static String depti(String id){
		if(id==null) return "";
		return dept_is.get(id);
		
	}
	public static String depts(String name){
		if(name==null) return "";
		return dept_si.get(name);
	}
}
