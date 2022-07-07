<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.productDBBean" %>
<%@ page import = "shop.master.productDataBean" %>
<%@ page import = "java.text.NumberFormat" %>
 
<%
 String category = request.getParameter("category");
 String  PDR_id = request.getParameter("PDR_id");
 String id = "";
 int buy_price=0;
 int pdr_id = Integer.parseInt(PDR_id);

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
	<link rel="stylesheet" type="text/css" href="../_css/product-view.css?after">
	<script>
	
	function comma(num){
	    var len, point, str; 
	       
	    num = num + ""; 
	    point = num.length % 3 ;
	    len = num.length; 
	   
	    str = num.substring(0, point); 
	    while (point < len) { 
	        if (str != "") str += ","; 
	        str += num.substring(point, point + 3); 
	        point += 3; 
	    } 
	     
	    return str;
	 
	}
	
		function check() {
			document.inform.submit();
		}
		
		function change(num) {
			var price = document.inform.pricechg.value;
			
			var x = document.inform.buy_count;
			var y = Number(x.value) + num;
			if(y < 1) {
				y = 1;
			}
			else {
				x.value = y;
				var amount;
				amount = price * y;

				const name = comma(amount);
				document.getElementById("priceResult").innerText = name + "원";
				document.getElementById("amountResult").innerText = name;
				//alert(amount);
			}
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
					<div class="sub_title"><%=category %></div>
					<div class="sub_exp">상품</div>
				</div>
			</div>
		</div>
	</div>
	
	<%
productDataBean productList = null;
String product_kindName="";
  
productDBBean productProcess = productDBBean.getInstance();
 
productList = productProcess.getProduct(Integer.parseInt(PDR_id));
     
if(category.equals("100"))
	product_kindName="100";
else if(category.equals("200"))
	product_kindName="200";  
else if(category.equals("300"))
	product_kindName="300";
else if(category.equals("400"))
	product_kindName="400";

%>

	<!-- Content : Store Pick = 새 소식 & 상품 소개 -->
	<div class="wrap_1200">
		<div class="view_field">
            <div class="row">
                <div class="view_img">
                    <div class="title_img"><img src="../../imageFile/<%=productList.getPDR_image()%>" width="530px" height="580px"></div>
                    <div class="sub_img"></div>
                </div>
                <div class="view_txt">
                    <div class="name"><%=productList.getTitle() %></div>
                    <form name="inform" method="post" action="cart/cartInsert.jsp">        
                    <div class="prod_table">
                    
                        <table>
                            <tr>
                                <td>상품번호</td>
                                <td><%=PDR_id %></td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td><span><%=NumberFormat.getInstance().format(productList.getPrice())%></span>원</td>
                            </tr>
                            <tr>
                                <td>배송비</td>
                                <td>0원</td>
                            </tr>
                            <tr>
                                <td>수량</td>
                                <td><%=productList.getCount()%>개
                                
					<%  
					                 
					     if(productList.getCount()==0){
					%>
					         <b>일시품절</b>
					                           
					<%   }else{ %>	 
					       <input type="hidden" name="PDR_id" value="<%=PDR_id %>">
					       <input type="hidden" name="PDR_image" value="<%=productList.getPDR_image()%>">
					       <input type="hidden" name="Title" value="<%=productList.getTitle() %>">
					       <input type="hidden" name="Price" value="<%=productList.getPrice() %>">
					       <input type="hidden" name="category" value="<%=category %>">              
					<%}%>
                                </td>
                            </tr>
                            
                       </table>
                    </div>
                    <div class="prod_box">
                        <table>
                          <tr>
                              <td><%=productList.getTitle() %></td>
                              <td>
                                  <div class="amount_box">
                                      <div class="minus"><a><img src="../_img/minus.png" alt="마이너스" style="vertical-align: middle" onClick="change(-1)"></a></div>
                                      <div class="input_number">
                                          <input type=hidden name="sell_price" value="5500">
                                          <input type="text" name="buy_count" value="1">
                                      </div>
                                      <div class="plus"><a><img src="../_img/plus.png" alt="플러스" style="vertical-align: middle" onClick="change(1)"></a></div>
                                  </div>
                              </td>
                              <td><input type="hidden" name="prod_price" value="<%=NumberFormat.getInstance().format(productList.getPrice())%>">
                              <%
                              	String prod_price_str1 = NumberFormat.getInstance().format(productList.getPrice());
                              	String prod_price_str2 = prod_price_str1.replaceAll(",", "");
                              	int prod_price = Integer.parseInt(prod_price_str2); 
                              %>
                              <input type="hidden" name="pricechg" value="<%=prod_price%>" onkeyup="change(num)">
                              <%
                              	int pricechg = prod_price;
                              	String pricechg_str = Integer.toString(pricechg);
                              %>
                              <div id="priceResult"><%=NumberFormat.getInstance().format(productList.getPrice())%>원</div></td>
                          </tr>
                           
                        </table>
                        
                        
                    </div>
                    	
                    
                    <div class="total">
                        <table>
                            <tr>
                                <td>총 합계금액</td>
                                <td><span id="amountResult"><%=NumberFormat.getInstance().format(productList.getPrice())%></span>원</td>
                            </tr>
                        </table>
                    </div>
                    </form>
                    <div class="view_btn">
                        <div class="basket"><a onclick="check()"><img src="../_img/basket_btn.png" alt="장바구니"></a></div>
                        <div class="purchase"><a href="#"><img src="../_img/buy_btn.png" alt="구매"></a></div>
                    </div>
                </div>
            </div>
        </div>
		
		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
