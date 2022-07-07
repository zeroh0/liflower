<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*" %> 
     <% request.setCharacterEncoding("UTF-8");%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id =(String)session.getAttribute("id");
String delpw = request.getParameter("delpw");
boolean isSuccess = false;

Connection conn = null;
try {
//String dburl = "jdbc:mysql://localhost:3306/webdb";    
String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=euc-kr";
String dbid = "root";
String dbpwd = "multi2020";    
Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
conn = DriverManager.getConnection(dburl,dbid,dbpwd); //webdb 연결     
String query="select * from member where id = ? and passwd = ?";
PreparedStatement stmt = conn.prepareStatement(query);
stmt.setString(1,id);
stmt.setString(2,delpw);
ResultSet result = stmt.executeQuery();
if(result.next()) {
	if(result.getString(1).equals(id) && result.getString(2).equals(delpw)){
		isSuccess = true;
	}
	else {
		isSuccess = false;
	}
}
stmt.close();
}
finally{
	try{
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
	if(isSuccess == true)
		{
			String query ="delete from member where id = '"+id+"' and passwd = '"+delpw+"' ";
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
			pstmt.close();
			//out.println(id);
			//out.println(delpw);
		}
		
	if(isSuccess == false)
	{
		%>
		<script>alert("비밀번호가 맞지 않습니다");
		 location.href="member_edit.jsp"</script>
		 <% 
	}
	%>
	
</body>
</html>