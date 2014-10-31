package pia.model2;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Dept extends BaseModel {
	private static String m_tn = "dept";
	private static String m_pk = "dept_id";
	private static String m_fn[] = {"org_id","group_id","dept_id","dept_name"};
	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return m_pk;}
	public String getId(){return dept_id;}
	public String getTokens(){return "orgId,groupId,deptId,deptName";}
	public Dept(){
		org_id = group_id = dept_id = dept_name =
		null;
	}
	public Dept(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){
			org_id = rs.getString("org_id");
			group_id = rs.getString("group_id");
			dept_id = rs.getString("dept_id");
			dept_name = rs.getString("dept_name");
		}else org_id = group_id = dept_id = dept_name = null;
	}
	public void save() throws Exception{
			ResultSet rs = find(dept_id);
			if(rs.next())
				update(org_id,group_id,dept_id,dept_name);
			else
				add(org_id,group_id,dept_id,dept_name);
	}
	public static void add(String _org_id,String _group_id,String _dept_id,String _dept_name) throws Exception{
		verify(_org_id,_group_id,_dept_id,_dept_name);
		String sql1 = String.format("(org_id,group_id,dept_id,dept_name)");
		String sql2 = String.format("(?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _org_id);
		stm.setString(2, _group_id);
		stm.setString(3, _dept_id);
		stm.setString(4, _dept_name);
		stm.executeUpdate();
	}
	public static void update(String _org_id,String _group_id,String _dept_id,String _dept_name) throws Exception{
		verify(_org_id,_group_id,_dept_id,_dept_name);
		String set = "org_id=?,group_id=?,dept_name=? where dept_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _org_id);
		stm.setString(2, _group_id);
		stm.setString(3, _dept_name);
		stm.setString(4, _dept_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _org_id,String _group_id,String _dept_id,String _dept_name){
		if(_dept_id == null) return false;
		return true;
	}
	public String org_id;
	public String group_id;
	public String dept_id;
	public String dept_name;
	public String getOrgId(){return org_id;}
	public String getGroupId(){return group_id;}
	public String getDeptId(){return dept_id;}
	public String getDeptName(){return dept_name;}

}