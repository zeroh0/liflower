<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.CartDataBean" %>
<%@ page import = "shop.master.CartDBBean" %>
<%@ page import = "shop.master.CustomerDataBean" %>
<%@ page import = "shop.master.CustomerDBBean" %>
<%@ page import = "shop.master.BuyDBBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>



<%
   String category = request.getParameter("category");
   String buyer = (String)session.getAttribute("id");
%>
<%
   String userid = (String)session.getAttribute("id");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial=scale=1.0">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/payment.css?after">
	<style>
      
    </style>
    <script>
    	function check() {
    		if(!document.buyinput.tabmenu[0].checked) {
    			alert("현재는 무통장입금만 가능합니다.");
    			return false;
    		} else {
    			document.buyinput.submit();
    		}	
    	}
    	
    	function sameinput(form) {
    		form.deliveryName.value = form.orderName.value;
    		form.deliveryAddress.value = form.orderAddress.value;
    		form.deliveryTel.value = form.orderTel.value;
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
					<div class="sub_title">장바구니</div>
					<div class="sub_exp">Basket</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <%
List<CartDataBean> cartLists = null;
List<String> accountLists = null;
CartDataBean cartList = null;
CustomerDataBean member= null;
int number = 0;
int total = 0;

if(session.getAttribute("id")==null){
	response.sendRedirect("../Main.jsp");        
}else{
	CartDBBean bookProcess = CartDBBean.getInstance();
    cartLists = bookProcess.getCart(buyer);
    
    CustomerDBBean memberProcess = CustomerDBBean.getInstance();
    member = memberProcess.getMember(buyer);
    
    BuyDBBean buyProcess = BuyDBBean.getInstance();
    accountLists = buyProcess.getAccount();
%>
        <div class="payment_field">
            <div class="product">
                <div class="title">주문상품</div>
                <form name="inform" method="post" action="updateCart.jsp">
                <table class="product">
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>상품</th>
                        <th>상품가격</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th>배송비</th>
                        <th>합계</th>
                        <th><a><img src="../../_img/basket_all_del.png" alt="전체삭제"></a></th>
                    </tr>
                    <%
  for(int i=0;i<cartLists.size();i++){
     cartList = cartLists.get(i);
%>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><img src="../../../imageFile/<%=cartList.getPDR_image()%>" width="100" height="100"><span><%=cartList.getTitle()%></span></td>
                        <td><%=NumberFormat.getInstance().format(cartList.getPrice())%>원</td>
                        <td><%=cartList.getBuy_count()%>개</td>
                        <td><%=NumberFormat.getInstance().format(cartList.getPrice())%>원</td>
                        <td>0원</td>
                        <td><%total += cartList.getBuy_count()*cartList.getPrice();%>
          <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getPrice()) %>원</td>
                        <td><a><img src="../../_img/basket_del.png" alt="삭제"></a></td>
                    </tr>
                    <%
  }
%>
                </table>
                </form>
                <%} 
 %>
            </div>
            <form method="post" action="buyPro.jsp" name="buyinput">
            <div class="orderer">
                <div class="title">주문자정보/배송지정보</div>
                
                <table class="order_info">
                    <tr class="info_main">
                        <td rowspan="4">주문자정보</td>
                        <td class="info_title">주문하시는분</td>
                        <td class="order_name"><input type="text" value="<%=member.getName()%>" name="orderName"></td>
                    </tr>
                    <tr class="address">
                        <td class="info_title">주소</td>
                        <td class="order_name"><input type="text" value="<%=member.getAddress()%>" name="orderAddress"></td>
                    </tr>
                    <tr>
                        <td class="info_title">휴대폰</td>
                        <td class="order_name"><input type="text" value="<%=member.getTel()%>" name="orderTel"></td>
                    </tr>
                    <tr>
                        <td class="info_title">이메일</td>
                        <td class="order_name"><input type="text" value="<%=member.getEmail()%>" name="orderEmail"></td>
                    </tr>
                    
                    <tr class="goal_main">
                        <td rowspan="5">주문자정보</td>
                        <td class="goal_title" colspan="2"><label for="same" style="cursor:pointer"><input type="checkbox" name="same" id="same" onClick="javascript: sameinput(document.buyinput)">&nbsp;주문자 정보와 동일</label></td>
                    </tr>
                    <tr>
                        <td class="info_title">받으시는분</td>
                        <td class="order_name"><input type="text" name="deliveryName"></td>
                    </tr>
                    <tr class="address">
                        <td class="info_title">주소</td>
                        <td class="order_name"><input type ="text" name="deliveryAddress" ></td>
                    </tr>
                    <tr>
                        <td class="info_title">휴대폰</td>
                        <td class="order_name"><input type="text" name="deliveryTel"></td>
                    </tr>
                    <tr class="memo">
                        <td class="info_title">배송메모</td>
                        <td class="order_name"><input type="text"></td>
                    </tr>
                    
                </table>
                
            </div>
            <div class="method">
                <div class="title">결제수단</div>
                <div class="tab_content">
                    <input type="radio" name="tabmenu" id="tab01" value="무통장입금" checked>
                    <label for="tab01">무통장입금</label>
                    <input type="radio" name="tabmenu" id="tab02" value="신용/체크카드">
                    <label for="tab02">신용/체크카드</label>
                    <input type="radio" name="tabmenu" id="tab03" value="가상계좌">
                    <label for="tab03">가상계좌</label>

                    <!-- 컨텐츠 요소 -->
                    <div class="conbox con1">
                    <select name="account">
        <%
          for(int i=0;i<accountLists.size();i++){
           String accountList = accountLists.get(i);
         %>
           <option value="<%=accountList %>"><%=accountList %></option>
        <%}%>
       </select>
                    </div>
                    <div class="conbox con2">신용/체크카드</div>
                    <div class="conbox con3">가상계좌</div>
                </div>
            </div>
            </form>
            
            <div class="final">
                <div class="pay_box">
                    <table class="count">
                        <tr>
                            <td class="count_price"><%=NumberFormat.getInstance().format(total)%>원</td>
                            <td rowspan="2" class="calc"><img src="../../_img/pay_plus.png" alt="플러스"></td>
                            <td class="count_price">0원</td>
                            <td rowspan="2" class="calc"><img src="../../_img/pay_result.png" alt="는"></td>
                            <td class="count_price last"><%=NumberFormat.getInstance().format(total)%>원</td>
                        </tr>
                        <tr>
                            <td class="count_pay">총 상품금액</td>
                            <td class="count_pay">총 배송비</td>
                            <td class="count_pay">총 주문금액</td>
                        </tr>
                    </table>
                </div>
                <div class="pay_btn"><a><img src="../../_img/basket_pay.png" alt="결제" onClick="check()" id="open"></a></div>
            </div>
        </div>
        

		<!-- 푸터 -->
		<jsp:include page="../../footer.jsp"/>
	</div>
	
</body>
</html>
