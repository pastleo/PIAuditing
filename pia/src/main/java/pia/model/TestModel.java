package pia.model;

import java.sql.*;
import java.util.*;
import pia.model.*;

public class TestModel extends BaseModel {
	//Use this: id,author,todo,detail
	private static String m_tn = "test";
	private static String m_pk = "id";
	//private static int count = 4;
	private static String m_fn[] = {"id","author","todo","detail"};
	private static String names = String.format("(id,author,todo,detail)");
	private static String values = String.format("(?,?,?,?)");
	private static String set = "author=?,todo=?,detail=? where id=?";//take out pk, put at where

	public static Vector< Map<String,String> > getAll() throws Exception{
		return BaseModel.getAll(m_tn,m_fn);
	}

	public TestModel(){
		id = author = todo = detail = null;
	}

	public TestModel(String _id) throws Exception{
		//this();
		ResultSet rs = BaseModel.find(m_tn,m_pk,_id);
		if(rs.next()){
			id = rs.getString("id");
			author = rs.getString("author");
			todo = rs.getString("todo");
			detail = rs.getString("detail");
		}else id = author = todo = detail = null;
		//setWithMap(BaseModel.find(m_tn,m_fn,m_pk,_id));
	}

	// private void setWithMap(Map<String,String> _m){
	// 	if(_m == null)	return;
	// }
	//untested
	public void save() throws Exception{
			ResultSet rs = BaseModel.find(m_tn,m_pk,id);
			if(rs.next())	//update
				update(id,author,todo,detail);
			else 			//insert
				add(id,author,todo,detail);
	}
	//tested
	public static void add(String _id,String _author,String _todo,String _detail) throws Exception{
		verify(_id,_author,_todo,_detail);

		String sql = String.format("insert into %s %s values %s ",m_tn,names,values);
		PreparedStatement stm = DbInit.getStatement(sql);
		stm.setString(1, _id);
		stm.setString(2, _author);
		stm.setString(3, _todo);
		stm.setString(4, _detail);
		stm.executeUpdate();
	}
	//tested
	public static void update(String _id,String _author,String _todo,String _detail) throws Exception{
		verify(_id,_author,_todo,_detail);

		String sql = String.format("update %s set %s",m_tn,set);
		PreparedStatement stm = DbInit.getStatement(sql);
		//stm.setString(1,id);
		stm.setString(1,_author);
		stm.setString(2,_todo);
		stm.setString(3,_detail);
		stm.setString(4,_id);	//where
		stm.executeUpdate();
	}

	public static boolean verify(String _id,String _author,String _todo,String _detail){
		if(_id == null) return false;
		return true;
	}
	//tested as jsp code
	public static void delete(String _id) throws Exception{
		String sql = String.format("DELETE FROM %s Where %s=?",m_tn,m_pk);
		PreparedStatement del = DbInit.getStatement(sql);
		del.setString(1,_id);
		del.executeQuery();
	}

	final public String id;
	public String author;
	public String todo;
	public String detail;


}