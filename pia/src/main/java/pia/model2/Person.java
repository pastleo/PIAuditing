package pia.model2;
import java.sql.*;
import java.util.*;
import pia.model.*;

import java.security.*;

public class Person extends BaseModel {

	private static String m_tn = "person";
	private static String m_pk = "p_id";
	private static String m_fn[] = {"#","學校","p_id","p_name","p_phone","p_mail","p_title","p_pass"};

	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return m_pk;}
	public String getId(){return p_id;}
	public String getTokens(){return "org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass";}
	public Person(){
		org_id = dept_id = p_id = p_name = p_phone = p_mail = p_title = p_pass =
		null;
	}
	public Person(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){
			org_id = rs.getString("org_id");
			dept_id = rs.getString("dept_id");
			p_id = rs.getString("p_id");
			p_name = rs.getString("p_name");
			p_phone = rs.getString("p_phone");
			p_mail = rs.getString("p_mail");
			p_title = rs.getString("p_title");
			p_pass = rs.getString("p_pass");
		}else org_id = dept_id = p_id = p_name = p_phone = p_mail = p_title = p_pass = null;
	}

	public void save() throws Exception{
			ResultSet rs = find(p_id);
			if(rs.next())
				update(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);
			else 		
				add(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass);	
	}

	public static void add(String _org_id,String _dept_id,String _p_id,String _p_name,String _p_phone,String _p_mail,String _p_title,String _p_pass) throws Exception{
		verify(_org_id,_dept_id,_p_id,_p_name,_p_phone,_p_mail,_p_title,_p_pass);

		_p_pass = md5(_p_pass);

		String sql1 = String.format("(org_id,dept_id,p_id,p_name,p_phone,p_mail,p_title,p_pass)");
		String sql2 = String.format("(?,?,?,?,?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
	
		stm.setString(1, _org_id);
		stm.setString(2, _dept_id);
		stm.setString(3, _p_id);
		stm.setString(4, _p_name);
		stm.setString(5, _p_phone);
		stm.setString(6, _p_mail);
		stm.setString(7, _p_title);
		stm.setString(8, _p_pass);
		stm.executeUpdate();
	}

	public static void update(String _org_id,String _dept_id,String _p_id,String _p_name,String _p_phone,String _p_mail,String _p_title,String _p_pass) throws Exception{
		verify(_org_id,_dept_id,_p_id,_p_name,_p_phone,_p_mail,_p_title,_p_pass);

		_p_pass = md5(_p_pass);

		String set = "org_id=?,dept_id=?,p_name=?,p_phone=?,p_mail=?,p_title=?,p_pass=? where p_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
	
		stm.setString(1, _org_id);
		stm.setString(2, _dept_id);
	
		stm.setString(3, _p_name);
		stm.setString(4, _p_phone);
		stm.setString(5, _p_mail);
		stm.setString(6, _p_title);
		stm.setString(7, _p_pass);
		stm.setString(8, _p_id);
		stm.executeUpdate();
	}

	public static boolean verify(String _org_id,String _dept_id,String _p_id,String _p_name,String _p_phone,String _p_mail,String _p_title,String _p_pass){
		if(_p_id == null) return false;
		return true;
	}

	private static String md5(String src) throws Exception{
		MessageDigest digest = java.security.MessageDigest.getInstance("MD5");
		digest.update(src.getBytes());
		byte messageDigest[] = digest.digest();
		StringBuffer hexString = new StringBuffer();
		for (int i=0; i<messageDigest.length; i++)
		    hexString.append(Integer.toHexString(0xFF & messageDigest[i]));
		return hexString.toString();
	}

	public String org_id;
	public String dept_id;
	public String p_id;
	public String p_name;
	public String p_phone;
	public String p_mail;
	public String p_title;
	public String p_pass;
	public String getOrg_id(){return org_id;}
	public String getDept_id(){return Tr.depti(dept_id);}
	public String getP_id(){return p_id;}
	public String getP_name(){return p_name;}
	public String getP_phone(){return p_phone;}
	public String getP_mail(){return p_mail;}
	public String getP_title(){return p_title;}
	public String getP_pass(){return p_pass;}
	public Vector< Person > getAllObj() throws Exception{
		String tableName = getTableName();
		String fields[] = getFieldNames();
		PreparedStatement all =
			DbInit.getStatement("SELECT * from `" + tableName + "`");
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Person > v = new Vector< Person >();
			while(rs.next()){
				if(this instanceof Person) ;
				Person m = new Person();
				m.org_id = rs.getString("org_id");
				m.dept_id = rs.getString("dept_id");
				m.p_id = rs.getString("p_id");
				m.p_name = rs.getString("p_name");
				m.p_phone = rs.getString("p_phone");
				m.p_mail = rs.getString("p_mail");
				m.p_title = rs.getString("p_title");
				m.p_pass = rs.getString("p_pass");
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
	}
}
