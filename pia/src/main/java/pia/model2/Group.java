package pia.model2;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Group extends BaseModel {
	private static String m_tn = "group";
	private static String m_pk = "group_id";
	private static String m_fn[] = {"org_id","group_id","group_name"};
	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return m_pk;}
	public String getId(){return group_id;}
	public String getTokens(){return "org_id,group_id,group_name";}
	public Group(){
		org_id = group_id = group_name =
		null;
	}
	public Group(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){
			org_id = rs.getString("org_id");
			group_id = rs.getString("group_id");
			group_name = rs.getString("group_name");
		}else org_id = group_id = group_name = null;
	}
	public void save() throws Exception{
			ResultSet rs = find(group_id);
			if(rs.next())
				update(org_id,group_id,group_name);
			else
				add(org_id,group_id,group_name);
	}
	public static void add(String _org_id,String _group_id,String _group_name) throws Exception{
		verify(_org_id,_group_id,_group_name);
		String sql1 = String.format("(org_id,group_id,group_name)");
		String sql2 = String.format("(?,?,?)");
		String sql = String.format("insert into `%s` %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _org_id);
		stm.setString(2, _group_id);
		stm.setString(3, _group_name);
		stm.executeUpdate();
	}
	public static void update(String _org_id,String _group_id,String _group_name) throws Exception{
		verify(_org_id,_group_id,_group_name);
		String set = "org_id=?,group_name=? where group_id=?";
		String sql = String.format("update `%s` set %s",m_tn,set);
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

	public String org_id;
	public String group_id;
	public String group_name;
	public String getOrg_id(){return org_id;}
	public String getGroup_id(){return group_id;}
	public String getGroup_name(){return group_name;}
	public Vector< Group > getAllObj() throws Exception{
		String tableName = getTableName();
		String fields[] = getFieldNames();
		PreparedStatement all =
			DbInit.getStatement("SELECT * from `" + tableName + "`");
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Group > v = new Vector< Group >();
			while(rs.next()){
				Group m = new Group();
				m.org_id = rs.getString("org_id");
				m.group_id = rs.getString("group_id");
				m.group_name = rs.getString("group_name");
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
	}
}
