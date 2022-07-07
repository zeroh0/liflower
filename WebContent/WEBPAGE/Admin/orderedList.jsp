<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.BuyDataBean" %>
<%@ page import = "shop.master.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>
<%
  String buyer = (String)session.getAttribute("id");

	
%>
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
	<link rel="stylesheet" type="text/css" href="../_css/order-manage.css?after">
	<script>
		function check() {
			document.form1.submit();
		}
	</script>
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
					<div class="sub_title">주문관리</div>
					<div class="sub_exp">Order Management</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><!-- <img src="../_img/list.png"><span>주문관리</span> --></div>
            <form action="sanctionUpdate.jsp" name="form1">
            <%
            List<BuyDataBean> buyLists = null;
            BuyDataBean buyList = null; 
            int count = 0;

            BuyDBBean buyProcess = BuyDBBean.getInstance();
            count = buyProcess.getListCount();

            if(count == 0){
			%>
			   <table class="member_field">
                <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>이미지</th>    
                        <th>상품명(상품번호)</th>
                        <th>고객명</th>
                        <th>결제수단</th>
                        <th>주문금액(개수)</th>
                        <th>배송상태</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="7">구매목록이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
			<%
			}else{
				buyLists = buyProcess.getBuyList();
			%>
            <table class="member_field">
                <thead>
                    <tr>
                        <th>주문시간</th>
                        <th>이미지</th>    
                        <th>상품명(상품번호)</th>
                        <th>고객명</th>
                        <th>결제수단</th>
                        <th>주문금액(개수)</th>
                        <th>배송상태</th>
                    </tr>
                </thead>
                <tbody>
                	<%
                	for(int i=0;i<buyLists.size();i++){
                	    buyList = (BuyDataBean)buyLists.get(i);	  
					%>
                    <tr>
                        <td><%=buyList.getBuy_date().toString() %><input type="hidden" name="buy_id"  value=<%=buyList.getBuy_id() %>></td>
                        <td><img src="../../imageFile/<%=buyList.getPDR_image()%>" width="100px" height="auto"></td>
                        <td><%=buyList.getTitle() %>(<%=buyList.getPDR_id() %><input type="hidden" name="PDR_id" value="<%=buyList.getPDR_id() %>">)</td>
                        <td><input type="hidden" name="buyer"  value=<%=buyList.getBuyer() %>><%=buyList.getBuyer() %></td>
                        <td>무통장입금</td>
                        <td><%=buyList.getBuy_price() %>원(<%=buyList.getBuy_count()%>개)</td>
                        <td >
                        <div class="ordering">
                            <div id="order_select">
                                <select name="sanction">
							         <option value="결제 확인"<% if(buyList.getSanction().equals("결재 확인")){ %> selected <%} %>>결재 확인</option>
							         <option value="상품 준비중"<% if(buyList.getSanction().equals("상품 준비중")){ %> selected <%} %>>상품 준비중</option>
							         <option value="배송 준비중"<% if(buyList.getSanction().equals("배송 준비중")){ %> selected <%} %>>배송 준비중</option>
							         <option value="배송중"<% if(buyList.getSanction().equals("배송중")){ %> selected <%} %>>배송중</option>
							         <option value="배송 완료"<% if(buyList.getSanction().equals("배송 완료")){ %> selected <%} %>>배송 완료</option>
							         <option value="구매 확정" disabled <% if(buyList.getSanction().equals("구매 확정")){ %> selected <%} %>>구매 확정</option>
 								</select>
                            </div>
                            <div id="order_chg"><a onClick="check()"><img src="../_img/order_chg.png"></a></div>
                        </div>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%}%>
            </form>
        </div>
        

		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
