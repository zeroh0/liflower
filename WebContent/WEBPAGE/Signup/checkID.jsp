 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.util.*" %>
<%
  boolean isExist = false;
  String id = request.getParameter("id");
  
  Connection conn = null; //Connection 객체 
  Statement stmt = null;

  
	  Class.forName("com.mysql.jdbc.Driver");
	  String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
	  String dbid = "root";
	  String dbpwd = "multi2020";
	  conn = DriverManager.getConnection(dburl,dbid,dbpwd);
	     
	  
	  String query = "select id from member where id = '"+id+"'";
	  stmt = conn.createStatement();
	  ResultSet rs = stmt.executeQuery(query);
	  
	  if(rs.next()){
		  isExist = true;
	  }
	  else {
		  isExist = false;
	  }
	  rs.close();
	  stmt.close();
%>
<!DOCTYPE html>
<html>
<head>
<style>
body {

	height: 250px;
	margin:0;
	padding: 0;
	font-family: Noto Sans KR;
	text-align: center;
	color: #222;
}

.title {
	width: 412px;
	height: 70px;
	background-color: #497320;
	color: #fff;
	font-size: 20px;
	line-height: 70px;
	padding-left: 30px;
	text-align: left;
}

.selectID {
	margin-top: 40px;
	width: 250px;
	height: 60px;
	border-top: 1px solid #ccc;
	border-bottom : 1px solid #ccc;
	background-color: #f5f5f5;
	font-size: 18px;
	color: #222;
	font-weight: 500;
	display: inline-block;
	line-height: 60px;
}

.result-text {
	margin-top: 20px;
	font-size: 17px;
	text-align: center;
}

.btn {
	margin-top: 20px;
}
/*
div {
	positiob:absolute;
	margin: 0 auto;
	width:350px;
	height: 250px;
	top:50%;
	transform:TransformY(50%);
}
table{

	width:300px;
 border:1px solid #222;
 border-spacing: 0px;
}

tr td {
	border:1px solid #222;
}
body{
background:#fff;
}
*/

</style>
</head>
<body>
	<div class="title">아이디 중복 체크</div>
	<div class="selectID"><%=id %></div>
	<div class="result-text">
		<%  if(isExist) { %>
			사용할 수 없는 아이디 입니다.
		<%} else { %>
			사용 가능한 아이디입니다.
		<%} %>
	</div>
	<div class="btn"><a href="javascript:window.close()"><img alt="확인" src="../_img/register-check.png"></a></div>
	<!--
	<div>
		<table width="288" border="0" cellspacing="1" cellpaddin="3" height="51">
			<tr>
				<td height="25" align=center>신청 ID</td>
				<td><%=id %></td>
			</tr>
			<tr>
				<td height="25" align=center colspan="2">
					<%  if(isExist) { %>
						사용할 수 없는 아이디 입니다.<br>
						<a href="javascript:window.close()" >로그인 화면으로</a>
					<%} else { %>
						사용 가능한 아이디입니다.<br>
						<a href="javascript:window.close()" >로그인 화면으로</a>
					<%} %>
				</td>
			</tr>
		</table>
	</div>
	-->
</body>
</html>