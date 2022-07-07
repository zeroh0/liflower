<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%String userid = (String)session.getAttribute("id");
String delpw = request.getParameter("delpw");
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
	Class.forName("com.mysql.jdbc.Driver");
	String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8";
	String dbid = "root";
	String dbpwd = "multi2020";
	    conn = DriverManager.getConnection(dburl,dbid,dbpwd);
	 String query ="delete from member where id = '"+userid+"' and passwd = '"+delpw+"' ";
	 PreparedStatement pstmt = conn.prepareStatement(query);
	 pstmt.executeUpdate();
	 pstmt.close();
	 
	 out.println(userid);
	 out.println(delpw);
		
%>
<!-- 
<script>
		alert("회원탈퇴가 완료되었습니다.");
        location.href="mypage.jsp";</script> -->
</body>
</html>