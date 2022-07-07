<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String userid = (String)session.getAttribute("id");

	String pass = request.getParameter("pass");
	String chgpass1 = request.getParameter("chgpass1");
	String chgpass2 = request.getParameter("chgpass2");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

<%
String id = userid;
boolean isSuccess = false;

 Connection conn = null; 

	try{ Class.forName("com.mysql.jdbc.Driver");
	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8";
	String dbid = "root";
	String dbpwd = "multi2020";
	    conn = DriverManager.getConnection(dburl,dbid,dbpwd);
	 String query ="select passwd from member where passwd = ?";
	 PreparedStatement pstmt = conn.prepareStatement(query);
	 pstmt.setString(1,pass);
	 ResultSet result = pstmt.executeQuery();
	 if(result.next()){
		 if(result.getString(1).equals(pass)){
			 
				 isSuccess = true;
			 
			 
			 
		 }
		 else {
			 isSuccess = false;
		
		 }
	 }
	 pstmt.close();
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
		%>
			<script>
	 		location.href="modifypasswdpro.jsp";
	 		</script>
			 <%
	}
	
if(isSuccess == false)
{
	%><script>alert("비밀번호가 맞지 않습니다");
	 location.href="member_edit.jsp"</script><% 
}
%>

</body>
</html>