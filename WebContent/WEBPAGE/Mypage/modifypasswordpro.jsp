<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%String userid = (String)session.getAttribute("id");
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

 Connection conn = null; 
	try{ Class.forName("com.mysql.jdbc.Driver");
	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8";
	String dbid = "root";
	String dbpwd = "multi2020";
	    conn = DriverManager.getConnection(dburl,dbid,dbpwd);
	 String query ="update member set passwd ='"+chgpass2+"' where id ='"+id+"' and passwd ='"+pass+"' ";
	 PreparedStatement pstmt = conn.prepareStatement(query);
	 pstmt.executeUpdate();
	 

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
%>
<script>alert("비밀번호 수정을 완료하였습니다");
        location.href="mypage.jsp";</script>
</body>
</html>