<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.CartDataBean" %>
<%@ page import = "shop.master.CartDBBean" %>
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
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/basket.css?after">
	<script>
		function uptcnt(url) {
			document.cartform.action = url;
			document.cartform.submit();
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
        <div class="member_list">
            <div class="depth_menu"></div>
            <%
List<CartDataBean> cartLists = null;
CartDataBean cartList = null;
int count = 0;
int number = 0;
int total = 0;
//int cart_id = cartList.getCart_id();

if(session.getAttribute("id")==null){
	%>
	<script>
		alert("로그인 후 이용 가능합니다");
		location.href="../../main.jsp";
	</script>
	<%
	   //response.sendRedirect("../../main.jsp");        
	}else{
	   CartDBBean bookProcess = CartDBBean.getInstance();
	   count = bookProcess.getListCount(buyer);

   if(count == 0){
%>
   <table class="member_field">
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>상품</th>    
                        <th>상품가격</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th><a><img src="../../_img/basket_all_del.png" alt="전체삭제" onclick="javascript:window.location='cartListDel.jsp?list=all&category=<%=category%>'"></a></th>
                    </tr>
                </thead>
                <tbody>
              
                    <tr>
                        <td colspan="6">장바구니에 담긴 물건이 없습니다.</td>
                    </tr>
                </tbody>
            </table>
            
            <div class="basket">
                <span class="basket_pay">최종결제금액</span>
                <table class="pay">
                    <tr>
                        <td>상품금액</td>
                        <td><%=NumberFormat.getInstance().format(total)%>원</td>
                    </tr> 
                    <tr>
                        <td>배송비</td>
                        <td>+ 0원</td>
                    </tr>    
                </table>
                <div class="amount">
                    <div class="payment">예상 결제 금액</div>     
                    <div class="price"><%=NumberFormat.getInstance().format(total)%>원</div>
                    <div class="pay_btn"><a><img src="../../_img/basket_pay.png" alt="결제하기" onclick="javascript:window.location='../buy/buyForm.jsp'"></a></div>
                </div>
                
            </div>
<%
   }else{
     cartLists = bookProcess.getCart(buyer);
 %>
 			<form name="cartform" method="POST">
            <table class="member_field">
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th colspan="2">상품</th>    
                        <th>상품가격</th>
                        <th>수량</th>
                        <th>가격</th>
                        <th><a><img src="../../_img/basket_all_del.png" alt="전체삭제" onclick="javascript:window.location='cartListDel.jsp?list=all&category=<%=category%>'"></a></th>
                    </tr>
                </thead>
                <tbody>
                <%
			   for(int i=0;i<cartLists.size();i++){
			     cartList = (CartDataBean)cartLists.get(i);
			%>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td><img src="../../../imageFile/<%=cartList.getPDR_image()%>" alt="상품이미지" width="100" height="100"></td>
                        <td><span><%=cartList.getTitle()%></span></td>
                        <td><%=NumberFormat.getInstance().format(cartList.getPrice())%></td>
                        <td><div class="count_number"><input type="text" name="buy_count" size="5" value="<%=cartList.getBuy_count()%>">
                        
                        <% 
				          String url = "updateCartForm.jsp?cart_id="+cartList.getCart_id()+"&category="+category;
				          
				          %></div>
				          <div class="count_btn"><!--<a onClick="javascript:window.location='<%=url%>'"> --><a onClick="uptcnt('<%=url%>')"><img src="../../_img/cart_count.png"></a></div>
				           
				            </td>
                        <td><%total += cartList.getBuy_count()*cartList.getPrice();%>
            <%=NumberFormat.getInstance().format(cartList.getBuy_count()*cartList.getPrice()) %>
                        <td><a onclick="javascript:window.location=
            'cartListDel.jsp?list=<%=cartList.getCart_id()%>&category=<%=category%>'"><img src="../../_img/basket_del.png" alt="삭제"></a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
            <div class="basket">
                <span class="basket_pay">최종결제금액</span>
                <table class="pay">
                    <tr>
                        <td>상품금액</td>
                        <td><%=NumberFormat.getInstance().format(total)%>원</td>
                    </tr> 
                    <tr>
                        <td>배송비</td>
                        <td>+ 0원</td>
                    </tr>    
                </table>
                <div class="amount">
                    <div class="payment">예상 결제 금액</div>     
                    <div class="price"><%=NumberFormat.getInstance().format(total)%>원</div>
                    <div class="pay_btn"><a><img src="../../_img/basket_pay.png" alt="결제하기" onclick="javascript:window.location='../buy/buyForm.jsp'"></a></div>
                </div>
                
            </div>
            </form>
            <%
   }
  } 

%>
        </div>
        

		<!-- 푸터 -->
		<jsp:include page="../../footer.jsp"/>
	</div>
</body>
</html>
