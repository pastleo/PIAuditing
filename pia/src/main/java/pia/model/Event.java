package pia.model;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Event extends BaseModel {
	private static String m_tn = "event";
	private static String m_pk = "event_id";
	private static String m_fn[] = {"event_id","event_name","event_beg","event_end"};
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll(m_tn,m_fn);
	}
	public Event(){
		event_id = event_name = event_beg = event_end =
		null;
	}
	public Event(String _id) throws Exception{
		ResultSet rs = find(m_tn,m_pk,_id);
		if(rs.next()){
			event_id = rs.getString("event_id");
			event_name = rs.getString("event_name");
			event_beg = rs.getString("event_beg");
			event_end = rs.getString("event_end");
		}else event_id = event_name = event_beg = event_end =
			  null;
	}
	public void save() throws Exception{
			ResultSet rs = find(m_tn,m_pk,event_id);
			if(rs.next())
				update(event_id,event_name,event_beg,event_end);
			else
				add(event_id,event_name,event_beg,event_end);
	}
	public static void add(String _event_id,String _event_name,String _event_beg,String _event_end) throws Exception{
		verify(_event_id,_event_name,_event_beg,_event_end);
		String sql1 = String.format("(event_id,event_name,event_beg,event_end)");
		String sql2 = String.format("(?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _event_name);
		stm.setString(3, _event_beg);
		stm.setString(4, _event_end);
		stm.executeUpdate();
	}
	public static void update(String _event_id,String _event_name,String _event_beg,String _event_end) throws Exception{
		verify(_event_id,_event_name,_event_beg,_event_end);
		String set = "event_name=?,event_beg=?,event_end=? where event_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_name);
		stm.setString(2, _event_beg);
		stm.setString(3, _event_end);
		stm.setString(4, _event_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _event_id,String _event_name,String _event_beg,String _event_end){
		if(_event_id == null) return false;
		return true;
	}
	public static void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?",m_tn,m_pk);
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeUpdate();
	}
	public String event_id;
	public String event_name;
	public String event_beg;
	public String event_end;
}