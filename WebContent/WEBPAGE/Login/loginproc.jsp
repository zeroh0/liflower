<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
		 boolean isSuccess = false;
		 boolean admin = false;
		 String id = request.getParameter("id");
		 String pwd = request.getParameter("pass1");
		 Connection conn = null; 
 
		try{ Class.forName("com.mysql.jdbc.Driver");
		String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		conn = DriverManager.getConnection(dburl,dbid,dbpwd);
		 String query ="select passwd from member where id = ?";
		 PreparedStatement pstmt = conn.prepareStatement(query);
		 pstmt.setString(1,id);
		 ResultSet result = pstmt.executeQuery();
		 if(result.next()){
			 if(result.getString(1).equals(pwd)){
				 isSuccess = true;
				 if(id.equals("admin")){
					 admin = true;
				 }else {
					 admin = false;
				 }
			 }
			 else {
				 isSuccess = false;
				
			 }
		 }
		 pstmt.close();
		}
		catch(SQLException e){
			 isSuccess = false;
			
		}
		catch(ClassNotFoundException e){
			isSuccess = false;
		}
		finally{
			try{
				conn.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
		out.println(isSuccess);
		if(isSuccess == true){
			session.setMaxInactiveInterval(-1);
			session.setAttribute("id", id);
			session.setAttribute("pwd", pwd);
			if(admin == true){
				response.sendRedirect("../Admin/admin.jsp");
			}else{
				response.sendRedirect("../main.jsp");
			}
				
		}
		else{   
			 %>
			 <script>alert("아이디 또는 비밀번호가 맞지 않습니다");
			 	location.href="login.jsp"
			 </script>
		<%  }
		
	%>

</body>
</html>