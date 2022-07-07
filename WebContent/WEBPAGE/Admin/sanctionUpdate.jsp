<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.BuyDBBean" %>
<%@ page import = "shop.master.BuyDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
String[] buy_id = request.getParameterValues("buy_id");
String[] buyer = request.getParameterValues("buyer");
String[] sanction = request.getParameterValues("sanction");
String[] PDR_id = request.getParameterValues("PDR_id");
int long1 = buy_id.length;
Long [] BUY_ID = new Long[long1];
for (int i = 0; i<long1 ; i++){
	BUY_ID[i] = Long.parseLong(buy_id[i]);
	BuyDBBean buyProcess = BuyDBBean.getInstance();
	buyProcess.updatebuy(BUY_ID[i], sanction[i], buyer[i], PDR_id[i]);
}

response.sendRedirect(" orderedList.jsp ");
%>