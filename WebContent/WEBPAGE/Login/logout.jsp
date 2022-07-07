<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.sql.*" %>
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% String id = (String)session.getAttribute("id"); %>
	<% if(id != null){ %>
	<script>
		alert("<%=id%>"+"님 이용해주셔서 고맙습니다");
		location.href="../main.jsp";</script> <% 
		session.invalidate();
	} else {
	%>
	<script>
		alert("이미 로그아웃된 상태입니다.");
		location.href="../main.jsp";
	</script>
	<% } %>

</body>
</html>