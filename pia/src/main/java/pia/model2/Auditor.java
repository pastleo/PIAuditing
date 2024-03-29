package pia.model2;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Auditor extends BaseModel {
	private static String m_tn = "auditor";
	private static String m_pk = "p_id";	/*WARNING, I'm not sure pk is this*/
	private static String m_fn[] = {"event_id","org_id","p_id","ad_org_id","ad_dept_id","ad_time_from","ad_time_end"};
	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return m_pk;}
	public String getId(){return p_id;}
	public String getTokens(){return "event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_from,ad_time_end";}
	public Auditor(){
		event_id = org_id = p_id = ad_org_id = ad_dept_id = ad_time_from = ad_time_end =
		null;
	}
	public Auditor(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){
			event_id = rs.getString("event_id");
			org_id = rs.getString("org_id");
			p_id = rs.getString("p_id");
			ad_org_id = rs.getString("ad_org_id");
			ad_dept_id = rs.getString("ad_dept_id");
			ad_time_from = rs.getString("ad_time_from");
			ad_time_end = rs.getString("ad_time_end");
		}else event_id = org_id = p_id = ad_org_id = ad_dept_id = ad_time_from = ad_time_end =
				null;
	}
	public void save() throws Exception{
			ResultSet rs = find(p_id);	/*id*/
			if(rs.next())
				update(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_from,ad_time_end);
			else
				add(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_from,ad_time_end);
	}
	public static void add(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_from,String _ad_time_end) throws Exception{
		verify(_event_id,_org_id,_p_id,_ad_org_id,_ad_dept_id,_ad_time_from,_ad_time_end);
		String sql1 = String.format("(event_id,org_id,p_id,ad_org_id,ad_dept_id,ad_time_from,ad_time_end)");
		String sql2 = String.format("(?,?,?,?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _org_id);
		stm.setString(3, _p_id);
		stm.setString(4, _ad_org_id);
		stm.setString(5, _ad_dept_id);
		stm.setString(6, _ad_time_from);
		stm.setString(7, _ad_time_end);
		stm.executeUpdate();
	}
	public static void update(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_from,String _ad_time_end) throws Exception{
		verify(_event_id,_org_id,_p_id,_ad_org_id,_ad_dept_id,_ad_time_from,_ad_time_end);
		String set = "event_id=?,org_id=?,ad_org_id=?,ad_dept_id=?,ad_time_from=?,ad_time_end=? where p_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _org_id);
		stm.setString(3, _ad_org_id);
		stm.setString(4, _ad_dept_id);
		stm.setString(5, _ad_time_from);
		stm.setString(6, _ad_time_end);
		stm.setString(7, _p_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _event_id,String _org_id,String _p_id,String _ad_org_id,String _ad_dept_id,String _ad_time_from,String _ad_time_end){
		if(_p_id == null) return false;
		return true;
	}
	
	public String event_id;
	public String org_id;
	public String p_id;
	public String ad_org_id;
	public String ad_dept_id;
	public String ad_time_from;
	public String ad_time_end;
	public String getEvent_id(){return event_id;}
	public String getOrg_id(){return org_id;}
	public String getP_id(){return p_id;}
	public String getAd_org_id(){return ad_org_id;}
	public String getAd_dept_id(){return ad_dept_id;}
	public String getAd_time_from(){return ad_time_from;}
	public String getAd_time_end(){return ad_time_end;}
	public Vector< Auditor > getAllObj() throws Exception{
		String tableName = getTableName();
		String fields[] = getFieldNames();
		PreparedStatement all =
			DbInit.getStatement("SELECT * from `" + tableName + "`");
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Auditor > v = new Vector< Auditor >();
			while(rs.next()){
				Auditor m = new Auditor();
				m.event_id = rs.getString("event_id");
				m.org_id = rs.getString("org_id");
				m.p_id = rs.getString("p_id");
				m.ad_org_id = rs.getString("ad_org_id");
				m.ad_dept_id = rs.getString("ad_dept_id");
				m.ad_time_from = rs.getString("ad_time_from");
				m.ad_time_end = rs.getString("ad_time_end");
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
	}
}