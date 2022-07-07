<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "shop.master.CartDBBean" %>

<% request.setCharacterEncoding("utf-8");%>

<%
   String category = request.getParameter("category");
   String buy_count = request.getParameter("buy_count");
   String PDR_id=request.getParameter("PDR_id");
   String Title = request.getParameter("Title");
   String PDR_image = request.getParameter("PDR_image");
   String buy_price = request.getParameter("Price");
   String buyer = (String)session.getAttribute("id");
%>

<jsp:useBean id="cart" scope="page"
           class="shop.master.CartDataBean">
</jsp:useBean>

<%
  cart.setPDR_id(Integer.parseInt(PDR_id));
  cart.setPDR_image(PDR_image);
  cart.setTitle(Title);
  cart.setBuy_count(Byte.parseByte(buy_count));
  cart.setPrice(Integer.parseInt(buy_price));
  cart.setBuyer(buyer);
  
  CartDBBean bookProcess = CartDBBean.getInstance();
  bookProcess.insertCart(cart);
  response.sendRedirect("cartList.jsp?category="+category);
%>