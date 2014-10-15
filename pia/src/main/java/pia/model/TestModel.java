package pia.model;

import java.sql.*;
import java.util.*;
import pia.model.*;

// $C,$TN,$PK
// $CSV = id,author,todo,detail
// ~C @TestModel |$C
public class TestModel extends BaseModel {	//~C
	
	private static String m_tn = "test";	//~TN
	private static String m_pk = "id";	//~PK
	private static String m_fn[] = {"id","author","todo","detail"};	//~CSV @(\w*) | "\1"
	
	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll(m_tn,m_fn);
	}

	public TestModel(){	//~C
		id = author = todo = detail =	//~CSV @(\w*).? |\1 =
		null;
	}

	public TestModel(String _id) throws Exception{	//~C
		ResultSet rs = find(m_tn,m_pk,_id);
		if(rs.next()){	//~CSV @(\w*),? |\1 = rs.getString("\1");\n
			id = rs.getString("id");
			author = rs.getString("author");
			todo = rs.getString("todo");
			detail = rs.getString("detail");
		}else id = author = todo = detail = null;	//~CSV
	}

	//tested
	public void save() throws Exception{
			ResultSet rs = find(m_tn,m_pk,id);	//$id
			if(rs.next())	//update
				update(id,author,todo,detail);	//~CSV
			else 			//insert
				add(id,author,todo,detail);		//~CSV
	}
	//tested
	//~CSV @(\w*) |String _\1
	public static void add(String _id,String _author,String _todo,String _detail) throws Exception{
		verify(_id,_author,_todo,_detail);	//~CSV @(\w*) |_\1
		String sql1 = String.format("(id,author,todo,detail)");	//~CSV
		String sql2 = String.format("(?,?,?,?)");	//~CSV @(\w*) |\?
		String sql = String.format("insert into %s %s values %s ",m_tn,sql1,sql2);
		PreparedStatement stm = DbInit.getStatement(sql);
		//~CSV @(\w*),? |stm.setString(1, _\1);\n
		//count
		stm.setString(1, _id);
		stm.setString(2, _author);
		stm.setString(3, _todo);
		stm.setString(4, _detail);
		stm.executeUpdate();
	}
	//tested
	//~CSV
	public static void update(String _id,String _author,String _todo,String _detail) throws Exception{
		verify(_id,_author,_todo,_detail);	//~CSV

		String set = "author=?,todo=?,detail=? where id=?";	//~CSV @(\w*) |\1=?
		//where $id=?
		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		//~CSV && $id
		//stm.setString(1,id);
		stm.setString(1,_author);
		stm.setString(2,_todo);
		stm.setString(3,_detail);
		stm.setString(4,_id);	//where
		stm.executeUpdate();
	}

	//~CSV
	public static boolean verify(String _id,String _author,String _todo,String _detail){
		if(_id == null) return false;	//$id
		return true;
	}
	//tested
	public static void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?",m_tn,m_pk);
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeUpdate();
	}
	//~CSV @(\w*),? |public String \1;\n
	public String id;
	public String author;
	public String todo;
	public String detail;

}