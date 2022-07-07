<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		
		String idx = request.getParameter("idx");
		
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dburl, dbid, dbpwd);
        
        pst = conn.prepareStatement("delete from member where id = ?");
        pst.setString(1, idx);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
        %>
        
        <script>
        	alert("삭제되었습니다");
        	location.href="memberList.jsp";
        </script>
</body>
</html>