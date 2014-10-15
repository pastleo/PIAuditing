package pia.model;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Group extends BaseModel {
	private static String m_tn = "group";
	private static String m_pk = "group_id";
	private static String m_fn[] = {"org_id","group_id","group_name"};
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll(m_tn,m_fn);
	}
	public Group(){
		org_id = group_id = group_name =
		null;
	}
	public Group(String _id) throws Exception{
		ResultSet rs = find(m_tn,m_pk,_id);
		if(rs.next()){
			org_id = rs.getString("org_id");
			group_id = rs.getString("group_id");
			group_name = rs.getString("group_name");
		}else org_id = group_id = group_name = null;
	}
	public void save() throws Exception{
			ResultSet rs = find(m_tn,m_pk,group_id);
			if(rs.next())
				update(org_id,group_id,group_name);
			else
				add(org_id,group_id,group_name);
	}
	public static void add(String _org_id,String _group_id,String _group_name) throws Exception{
		verify(_org_id,_group_id,_group_name);
		String sql1 = String.format("(org_id,group_id,group_name)");
		String sql2 = String.format("(?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _org_id);
		stm.setString(2, _group_id);
		stm.setString(3, _group_name);
		stm.executeUpdate();
	}
	public static void update(String _org_id,String _group_id,String _group_name) throws Exception{
		verify(_org_id,_group_id,_group_name);
		String set = "org_id=?,group_name=? where group_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _org_id);
		stm.setString(2, _group_name);
		stm.setString(3, _group_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _org_id,String _group_id,String _group_name){
		if(_group_id == null) return false;
		return true;
	}
	public static void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?",m_tn,m_pk);
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeUpdate();
	}
	public String org_id;
	public String group_id;
	public String group_name;
}