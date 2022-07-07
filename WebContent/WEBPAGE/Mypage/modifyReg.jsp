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

String name = request.getParameter("name");
String email = request.getParameter("email");
String tel = request.getParameter("tel");
String address = request.getParameter("address");

boolean isSuccess = false;

Connection conn = null;
try {
//String dburl = "jdbc:mysql://localhost:3306/webdb";    
String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=euc-kr";
String dbid = "root";
String dbpwd = "multi2020";    
Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
conn = DriverManager.getConnection(dburl,dbid,dbpwd); //webdb 연결     
String query ="update member set name = '"+name+"', email = '"+email+"', tel = '"+tel+"', address = '"+address+"' where id = '"+id+"' ";
PreparedStatement stmt = conn.prepareStatement(query);
stmt.executeUpdate();
//stmt.close();
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
	%>
	<script>
		alert("회원정보수정이 완료되었습니다.");
		location.href="member_edit.jsp";
	</script>
</body>
</html>