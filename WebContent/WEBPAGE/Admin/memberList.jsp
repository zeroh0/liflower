<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%
    String userid = (String)session.getAttribute("id");
    %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/member-list.css?after">
</head>
	
<body>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<jsp:include page="../header_1.jsp"/>
	</div>

	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">회원관리</div>
					<div class="sub_exp">Member Management</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><!-- <img src="../_img/list.png"><span>회원관리</span> --></div>
            <% 
			 Class.forName("com.mysql.jdbc.Driver");
			
			String DB_URL = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
			String DB_USER = "root";
			String DB_PASSWORD = "multi2020";
			
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			
			try {
				conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
				
				
				stmt = conn.createStatement();
				
				String query = "Select id,name,email,tel,address,postcode from member";
				rs = stmt.executeQuery(query);//쿼리문 실행
			%> 
            <table class="member_field">
                <thead>
                    <tr>
                        <th>고객명</th>
                        <th>아이디</th>    
                        <th>이메일</th>
                        <th>휴대폰번호</th>
                        <th>우편번호</th>
                        <th>주소</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                <% while(rs.next()){ %>
                    <tr>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("id") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("tel") %></td>
                        <td><%= rs.getString("postcode") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><a href="member_Del.jsp?idx=<%= rs.getString("id") %>"><img src="../_img/basket_del.png"></a></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% rs.close(); 
           stmt.close();
           conn.close();
}catch(SQLException e){
	out.println("err:"+e.toString());
}
        %>
        </div>
        

		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
