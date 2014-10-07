<%@ page import="pia.model.TestModel" %>
<%@ page import="java.util.Vector" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>
<body>
	<%
		Vector<String[]> v = TestModel.getAll();
		if(v==null) out.print("Oops go go die.");
		else
		for(int i=0; i<3; ++i){
			String a[] = v.get(i);
			out.print("id:"+a[0]+" author:"+a[1]+" todo:"+a[2]+" detail:"+a[3]);
		}
	%>
</body>
</html>
