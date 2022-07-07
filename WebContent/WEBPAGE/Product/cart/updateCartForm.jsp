<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.CartDBBean" %>



<%
 String cart_id = request.getParameter("cart_id");
 String buy_count = request.getParameter("buy_count");
 String category = request.getParameter("category");
 

 if(session.getAttribute("id")==null){
	response.sendRedirect("../index.jsp");        
 }else{
	CartDBBean productProcess = CartDBBean.getInstance();
	productProcess.updateCount(Integer.parseInt(cart_id), Byte.parseByte(buy_count));
	response.sendRedirect("cartList.jsp?category=" + category);
	
	//out.println(cart_id);
	//out.println(buy_count);
	//out.println(category);
%> 
<!-- 
<html>
<head>
<title>Book Shopping Mall</title>
<link href="../etc/style.css" rel="stylesheet" type="text/css">
</head>
<body >
<form method="POST" name="updateForm"  action="updateCart.jsp" > 
	 변경할 수량 : 
	 <input type="text" name="buy_count" size="5" value="<%=buy_count%>">
     <input type="hidden" name="cart_id" value="<%=cart_id%>">
     <input type="hidden" name="category" value="<%=category%>">
	 <input type="submit" value="변경" >  
</form>
</body>
</html>
 -->
<%}%>