<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.CartDBBean" %>



<%
 String list = request.getParameter("list");
 String buyer = (String)session.getAttribute("id");
 String category = request.getParameter("categoery");
   
 if(session.getAttribute("id")==null){
	response.sendRedirect("../index.jsp");        
 }else{
	CartDBBean bookProcess = CartDBBean.getInstance();
	   
	if(list.equals("all"))
	   bookProcess.deleteAll(buyer);
	else
	   bookProcess.deleteList(Integer.parseInt(list));
	
	response.sendRedirect("cartList.jsp?category=" + category);
 }
%>