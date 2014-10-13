package pia.model;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;
import pia.model.*;

public class Person extends BaseModel {

	private static String person[] =
		{"org_id","dept_id","p_id","p_name",
		"p_phone","p_mail","p_title","p_pass"};
	
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll("person",person);
	}

	public Person(){}	
	public Person(String id) throws Exception{
		ResultSet rs = BaseModel.find("person","p_id",id);
		if(rs.next()){
			org_id = rs.getString("org_id");
			dept_id = rs.getString("dept_id");
			p_id = rs.getString("p_id");
			p_name = rs.getString("p_name");
			p_phone = rs.getString("p_phone");
			p_mail = rs.getString("p_mail");
			p_title = rs.getString("p_title");
			p_pass = rs.getString("p_pass");
		}
	}

	public String org_id;
	public String dept_id;
	public String p_id;
	public String p_name;
	public String p_phone;
	public String p_mail;
	public String p_title;
	public String p_pass;

	// static{
	// 	tableName = "person";
	// 	pk = "p_id";
	// 	fields = person;
	// }

	


}
