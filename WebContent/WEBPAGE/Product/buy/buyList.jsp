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
	String payway = request.getParameter("payway");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/order-view.css?after">
	<script>
		function buyChg() {
			document.buychg.action="buyChg.jsp";
			document.buychg.submit();
		}
	</script>
</head>
	
<body>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<jsp:include page="../../header_2.jsp"/>
	</div>

	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">주문정보</div>
					<div class="sub_exp">Order</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><!-- <img src="../../_img/list.png"><span>주문정보</span> --></div>
            
            <%
				List<BuyDataBean> buyLists = null;
				BuyDataBean buyList = null;
				int count = 0;
				int number = 0;
				int total = 0;
				long compareId=0;
				long preId=0;
				
				if(session.getAttribute("id")==null){
				   response.sendRedirect("../Main.jsp");        
				}else{
				   BuyDBBean buyProcess = BuyDBBean.getInstance();
				   count = buyProcess.getListCount(buyer);
				
				   if(count == 0){
				%>
				
				<table class="member_field">
					<tr>
                        <th>주문일자</th>
                        <th>이미지</th>    
                        <th>상품명</th>
                        <th>결제수단</th>
                        <th>주문금액(개수)</th>
                        <th>결제상태</th>
                        <th>배송상태</th>
                        <th>확인</th>
                    </tr>
                    
                    <tr>
                        <td colspan="8">구매목록이 없습니다.</td>
                    </tr>
				</table>
				<%
				  }else{
				    buyLists = buyProcess.getBuyList(buyer);
				%>
			
            <table class="member_field">
                                            
                <thead>
                    <tr>
                        <th>주문번호</th>
                        <th>이미지</th>    
                        <th>상품명</th>
                        <th>결제수단</th>
                        <th>주문금액(개수)</th>
                        <th>결제금액</th>
                        <th>배송상태</th>
                        <th>구매확정</th>
                    </tr>
                </thead>

                
<%
    for(int i=0;i<buyLists.size();i++){
       buyList = buyLists.get(i);
    	 
       if(i<buyLists.size()-1){
    	  BuyDataBean compare = buyLists.get(i+1);
    	  compareId = compare.getBuy_id();
    		 
    	BuyDataBean pre = buyLists.get(buyLists.size()-2);
    	  preId = pre.getBuy_id();
       }  	 
%>
				
					
					<tbody>
                    <tr>
                        <td><%=buyList.getBuy_id()%><input type="hidden" name="buy_id" value="<%=buyList.getBuy_id()%>"></td>
                        <td><img src="../../../imageFile/<%=buyList.getPDR_image()%>" width="100" height="100" alt="상품이미지"></td>
                        <td><%=buyList.getTitle()%><input type="hidden" name="title" value="<%=buyList.getTitle()%>"></td>
                        <td>무통장입금</td>
                        <td><%total += buyList.getBuy_count()*buyList.getBuy_price();%>
           <%=NumberFormat.getInstance().format(buyList.getBuy_count()*buyList.getBuy_price()) %>원(<%=buyList.getBuy_count()%>개)</td>
                        <td>결제완료</td>
                        <td><%=buyList.getSanction() %></td>
                        <td>
                        	<%
                        		String url = "buyChg.jsp?buy_idx="+buyList.getBuy_id()+"&titlex="+buyList.getTitle();
                        	
                        		if(buyList.getSanction().equals("배송 완료")) {
                        	%>
                        		<a onClick="javascript:window.location='<%=url%>'"><img src="../../_img/order-check.png" alt="확인"></a>
                       		<%
                        		} else if(buyList.getSanction().equals("구매 확정")) {
                       		%>  
                       			<img src="../../_img/order-comp.png" alt="확인">                  	
                        	<% 
                        		} else {
                        	%>
                        		<img src="../../_img/order-disable.png" alt="확인">
                        	<%
                        		}
                        	%>
                       	</td>
                    </tr>
                    	
                </tbody>

<%
    }
    }
}
%>			
            </table>
            
        </div>
        

		<!-- 푸터 -->
		<jsp:include page="../../footer.jsp"/>
	</div>
</body>
</html>
