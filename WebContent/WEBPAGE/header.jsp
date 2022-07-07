<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String userid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
			<div id="logo">
				<a href="main.jsp"><img src="_img/logo.jpg" alt="로고"></a>
			</div>
			<div id="gnb">
				<ul>
					<li><a href="Product/list.jsp?category=Gift">Gift</a></li>
					<li><a href="Product/list.jsp?category=Wreath">Wreath</a></li>
					<li><a href="Product/list.jsp?category=Bouquet">Bouquet</a></li>
					<li><a href="Product/list.jsp?category=Grow">Grow</a></li>
				</ul>
			</div>
			<div id="icon">
				<ul>
				    <%
						if(userid == null) {
					%>
					<li></li>
					<%
						} else if(userid.equals("admin")) {
					%>
					<li><a href="Admin/admin.jsp"><span><%=userid %></span>님</a></li>
					<%
						} else if(userid != null){
					%>
					<li><a href="Mypage/mypage.jsp"><span><%=userid %></span>님</a></li>
					<%
						}
					%>
					<li><a href="Product/cart/cartList.jsp"><img src="_img/basket.png" alt="장바구니"></a></li>
					<li>
						<%
						 if(userid== null) {
						%>
                            <a href="Login/login.jsp" class="dropbtn"><img src="_img/mypage.png" alt="마이페이지"></a>
						<%
						 } else if(userid.equals("admin")) {
						%>
                            <a href="Admin/admin.jsp" class="dropbtn"><img src="_img/mypage.png" alt="마이페이지"></a>            
                        <%
							} else if(userid != null) {
                        %>             
                            <a href="Mypage/mypage.jsp" class="dropbtn"><img src="_img/mypage.png" alt="마이페이지"></a>                    
                         <%
							}
						%>
                    </li>
					<li><a href="#"><img src="_img/search.png" alt="검색"></a></li>
                </ul>
			</div>
		</header>
</body>
</html>