<%@ page import="pia.model.DbInit" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8"%> 

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<p>comment executeUpdate() to prevent from accetentally execution</p>
	<%	//Transferring data in "pims_user" to "person"
		//*pims_user*	->	*person*
		//user_name		->	p_name
		//user_mail		->	p_mail
		//user_dept		->	dept_id	
		//user_passwd	->	p_pass
		int count = 4;
		String from[] = {"user_name","user_mail","user_dept","user_passwd"};
		String to[] = {"p_name","p_mail","dept_id","p_pass"};

		Statement st = DbInit.getConnection().createStatement();
		ResultSet rs = DbInit.getConnection().createStatement()
					.executeQuery("select * from pims_user");
		while(rs.next()){
			String tmp[] = new String[4];
			for(int i=0; i<count; ++i)
				tmp[i] = rs.getString( from[i] );
			String sql = String.format("insert into person (p_name,p_mail,dept_id,p_pass) values ('%s','%s','%s','%s')"
			,tmp[0],tmp[1],tmp[2],tmp[3]);
			out.print("<br>" + sql);
			//st.executeUpdate(sql);
		}
	%>
</body>
</html>