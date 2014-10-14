package pia.model;

import java.sql.*;
import java.util.Vector;
import java.util.TreeMap;
import java.util.Map;
import pia.model.*;

public class Person extends BaseModel {

	private static String tableName = "person";
	private static int count = 8;
	private static String person[] =
		{"org_id","dept_id","p_id","p_name",
		"p_phone","p_mail","p_title","p_pass"};
	
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll("person",person);
	}

	public Person(){
		org_id = dept_id = p_id = p_name =
			p_phone = p_mail = p_title = p_pass = null;
	}
/*
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
	}*/

	public void save() throws Exception{
		ResultSet rs = BaseModel.find("person","p_id",p_id);
		if(rs.next())	//update
			update();
		else 			//insert
			add(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);
	}

	public static void add(String org_id,String dept_id,String p_id,String p_name
		,String p_phone,String p_mail,String p_title,String p_pass) throws Exception{
		
		verify(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);

		String names = String.format("(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass)");
		String values = String.format( "(?,?,?,?,?,?,?,?)" );
		String sql = String.format("insert into %s %s values %s ","person",names,values);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, org_id);
		stm.setString(2, dept_id);
		stm.setString(3, p_id);
		stm.setString(4, p_name);
		stm.setString(5, p_phone);
		stm.setString(6, p_mail);
		stm.setString(7, p_title);
		stm.setString(8, p_pass);
		stm.executeUpdate();
	}
	
	public void update() throws Exception{
		verify(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);

		String sql = String.format("update %s set org_id=? set dept_id=? set p_name=? set p_phone=? set p_mail=? set p_title=? set p_pass=? where p_id=?","person");
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, org_id);
		stm.setString(2, dept_id);
		//stm.setString(3, p_id);
		stm.setString(3, p_name);
		stm.setString(4, p_phone);
		stm.setString(5, p_mail);
		stm.setString(6, p_title);
		stm.setString(7, p_pass);
		stm.setString(8, p_id);		//where
	}

	public static boolean verify(String org_id,String dept_id,String p_id,String p_name
		,String p_phone,String p_mail,String p_title,String p_pass){
		
		if(p_id == null) return false;
		return true;
	}

	// private String insertSql(){
	// 	String names = String.format("(p_name,p_phone,p_mail,p_title,p_pass)")
	// 	String values = String.format("('hsine','0800-449-449','abc@wtf.com','QAQ','so many field..')");
	// 	return String.format("insert into person %s values %s ",);
	// }

	public String org_id;
	public String dept_id;
	final public String p_id;
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
