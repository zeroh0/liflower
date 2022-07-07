<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "shop.master.productDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
	
  int PDR_id = Integer.parseInt(request.getParameter("PDR_id"));
  String category = request.getParameter("category");
 
  productDBBean productProcess = productDBBean.getInstance();
  productProcess.deleteProduct(PDR_id); 

  response.sendRedirect("productList.jsp?category="+category);
%>