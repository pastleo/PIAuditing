package pia.model2;

import java.sql.*;
import java.util.*;

// $C,$TN,$PK
// $CSV = id,author,todo,detail
// ~C @TestModel |$C
// ~assign = ~CSV @(\w*).? |\1 = 
//
// ~param = ~CSV @(\w*) |String _\1
//
// ~args = ~CSV @(\w*) |_\1
//
public class TestModel extends BaseModel {
	
	private static String m_tn = "test";	//~TN
	//private static String m_pk = "id";	//~PK
	private static String m_fn[] = {"id","author","todo","detail"};	//~CSV @(\w*) | "\1"
		
	public String[] getFieldNames(){return m_fn;}
	public String getTableName(){return m_tn;}
	public String getPk(){return "id";}
	public String getId(){return id;}
	public String getTokens(){return "id,author,todo,detail";}

	public String getIdAttr(){return id;}	//oops naming conflict
	public String getAuthor(){return author;}
	public String getTodo(){return todo;}
	public String getDetail(){return detail;}
	public TestModel(){
		//#assign
		id = author = todo = detail =
		null;
	}

	public TestModel(String _id) throws Exception{
		ResultSet rs = find(_id);
		if(rs.next()){	//~CSV @(\w*),? |\1 = rs.getString("\1");\n
			id = rs.getString("id");
			author = rs.getString("author");
			todo = rs.getString("todo");
			detail = rs.getString("detail");
		}else //#assign
			id = author = todo = detail = 
			null;
	}

	//tested
	public void save() throws Exception{
			ResultSet rs = find(id);	//$id
			if(rs.next())	//update
				//update(#CSV);
				update(id,author,todo,detail);
			else 			//insert
				//add(#CSV);
				add(id,author,todo,detail);
	}
	//tested
	
	//public static void add(#param) throws Exception{
	public static void add(String _id,String _author,String _todo,String _detail) throws Exception{
		//verify(#args);
		verify(_id,_author,_todo,_detail);
		//String sql1 = String.format("(#CSV)");
		String sql1 = String.format("(id,author,todo,detail)");
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
	//public static void update(#param) throws Exception{
	public static void update(String _id,String _author,String _todo,String _detail) throws Exception{
		//verify(#args);
		verify(_id,_author,_todo,_detail);

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

	//public static boolean verify(#param){
	public static boolean verify(String _id,String _author,String _todo,String _detail){
		if(_id == null) return false;	//$id
		return true;
	}
	
	//~CSV @(\w*),? |public String \1;\n
	public String id;
	public String author;
	public String todo;
	public String detail;

}