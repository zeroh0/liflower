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
		
		String buy_id = request.getParameter("buy_idx");
		String title = request.getParameter("titlex");
		
		Connection conn = null;
		PreparedStatement pst = null;
		String sql = null;
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(dburl, dbid, dbpwd);
        
        pst = conn.prepareStatement("update buy set sanction=? where buy_id=? and Title=?");
        pst.setString(1, "구매 확정");
        pst.setString(2, buy_id);
        pst.setString(3, title);
        pst.executeUpdate();
        
        pst.close();
        conn.close();
        %>
        
        <script>
        	alert("변경되었습니다.");
        	location.href="buyList.jsp";
        </script>
</body>
</html>