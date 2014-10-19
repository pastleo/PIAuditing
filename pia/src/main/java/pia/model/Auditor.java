package pia.model;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Auditor extends BaseModel {
	private static String m_tn = "auditor";
	private static String m_pk = "p_id";	/*WARNING, I'm not sure pk is this*/
	private static String m_fn[] = {"event_id","org_id","p_id","ad_org_id","ad_dept_id","ad_time_beg","ad_time_end"};
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll(m_tn,m_fn);
	}
	public Auditor(){
		event_id = org_id = p_id = ad_org_id = ad_dept_id = ad_time_beg = ad_time_end =
		null;
	}
	public Auditor(String _id) throws Exception{
		ResultSet rs = find(m_tn,m_pk,_id);
		if(rs.next()){
			event_id = rs.getString("event_id");
			org_id = rs.getString("org_id");
			p_id = rs.getString("p_id");
			ad_org_id = rs.getString("ad_org_id");
			ad_dept_id = rs.getString("ad_dept_id");
			ad_time_beg = rs.getString("ad_time_beg");
			ad_time_end = rs.getString("ad_time_end");
		}else event_id = org_id = p_id = ad_org_id = ad_dept_id = ad_time_beg = ad_time_end =
				null;
	}
	public void save() throws Exception{
			ResultSet rs = find(m_tn,m_pk,p_id);	/*id*/
			if(rs.next())
				update(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_beg,ad_time_end);
			else
				add(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_beg,ad_time_end);
	}
	public static void add(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_beg,String _ad_time_end) throws Exception{
		verify(_event_id,_org_id,_p_id,_ad_org_id,_ad_dept_id,_ad_time_beg,_ad_time_end);
		String sql1 = String.format("(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_beg,ad_time_end)");
		String sql2 = String.format("(?,?,?,?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _org_id);
		stm.setString(3, _p_id);
		stm.setString(4, _ad_org_id);
		stm.setString(5, _ad_dept_id);
		stm.setString(6, _ad_time_beg);
		stm.setString(7, _ad_time_end);
		stm.executeUpdate();
	}
	public static void update(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_beg,String _ad_time_end) throws Exception{
		verify(_event_id,_org_id,_p_id,_ad_org_id,_ad_dept_id,_ad_time_beg,_ad_time_end);
		String set = "event_id=?,org_id=?,ad_org_id=?,ad_dept_id=?,ad_time_beg=?,ad_time_end=? where p_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _org_id);
		stm.setString(3, _ad_org_id);
		stm.setString(4, _ad_dept_id);
		stm.setString(5, _ad_time_beg);
		stm.setString(6, _ad_time_end);
		stm.setString(7, _p_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_beg,String _ad_time_end){
		if(_p_id == null) return false;
		return true;
	}
	public static void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?",m_tn,m_pk);
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeUpdate();
	}
	public String event_id;
	public String org_id;
	public String p_id;
	public String ad_org_id;
	public String ad_dept_id;
	public String ad_time_beg;
	public String ad_time_end;
}