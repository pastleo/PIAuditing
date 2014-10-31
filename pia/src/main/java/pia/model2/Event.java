package pia.model2;
import java.sql.*;
import java.util.*;
import pia.model.*;
public class Event extends BaseModel {
	private static String m_tn = "event";
	private static String m_pk = "event_id";
	private static String m_fn[] = {"event_id","event_name","event_from","event_end"};
	
	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return m_pk;}
	public String getId(){return event_id;}
	public String getTokens(){return "eventId,eventName,eventFrom,eventEnd";}
	public Event(){
		event_id = event_name = event_from = event_end =
		null;
	}
	public Event(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){
			event_id = rs.getString("event_id");
			event_name = rs.getString("event_name");
			event_from = rs.getString("event_from");
			event_end = rs.getString("event_end");
		}else event_id = event_name = event_from = event_end =
			  null;
	}
	public void save() throws Exception{
			ResultSet rs = find(event_id);
			if(rs.next())
				update(event_id,event_name,event_from,event_end);
			else
				add(event_id,event_name,event_from,event_end);
	}
	public static void add(String _event_id,String _event_name,String _event_from,String _event_end) throws Exception{
		verify(_event_id,_event_name,_event_from,_event_end);
		String sql1 = String.format("(event_id,event_name,event_from,event_end)");
		String sql2 = String.format("(?,?,?,?)");
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_id);
		stm.setString(2, _event_name);
		stm.setString(3, _event_from);
		stm.setString(4, _event_end);
		stm.executeUpdate();
	}
	public static void update(String _event_id,String _event_name,String _event_from,String _event_end) throws Exception{
		verify(_event_id,_event_name,_event_from,_event_end);
		String set = "event_name=?,event_from=?,event_end=? where event_id=?";
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _event_name);
		stm.setString(2, _event_from);
		stm.setString(3, _event_end);
		stm.setString(4, _event_id);
		stm.executeUpdate();
	}
	public static boolean verify(String _event_id,String _event_name,String _event_from,String _event_end){
		if(_event_id == null) return false;
		return true;
	}
	
	public String event_id;
	public String event_name;
	public String event_from;
	public String event_end;
	public String getEventId(){return event_id;}
	public String getEventName(){return event_name;}
	public String getEventFrom(){return event_from;}
	public String getEventEnd(){return event_end;}
	public Vector< Event > getAllObj() throws Exception{
		String tableName = getTableName();
		String fields[] = getFieldNames();
		PreparedStatement all =
			DbInit.getStatement("SELECT * from `" + tableName + "`");
		ResultSet rs;
		try{
			rs = all.executeQuery();

			Vector< Event > v = new Vector< Event >();
			while(rs.next()){
				if(this instanceof Event) ;
				Event m = new Event();
				m.event_id = rs.getString("event_id");
				m.event_name = rs.getString("event_name");
				m.event_from = rs.getString("event_from");
				m.event_end = rs.getString("event_end");
				v.add(m);
			}
			return v;
		}catch(Exception e){throw e;}
	}
}