<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.productDBBean" %>
<%@ page import = "shop.master.productDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.NumberFormat" %>

<%
   String userid = (String)session.getAttribute("id");
String category = request.getParameter("category");	
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/product-list.css?after">
	
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
	
	<!-- Content : Store Pick = 새 소식 & 상품 소개 -->
	<div class="wrap_1200">
		<%
		 List<productDataBean> productLists = null;
		 productDataBean productList = null;
		 String categoryName="";
		  
		 productDBBean productProcess = productDBBean.getInstance();
		 
		 productLists = productProcess.getProducts(category);
		 
		%>
		<div id="list_field">
            <div class="depth"><a>Home</a> > <a>Gift</a></div>
            <div class="depth_menu"></div>
            <div class="option">
                <div class="items">
                    <div class="itemwrap">
                        <div class="itemimg"><img src="../_img/items.png"></div>
                        <div class="itemnum"><%= productLists.size() %></div>
                    </div>
                    <div class="itemtxt">ITEMS</div>
                </div>
                <div class="sort">
                    <div class="sort_menu"><a><img src="../_img/sort_high.png" alt="높은가격"></a></div>
                    <div class="sort_menu"><a><img src="../_img/sort_low.png" alt="낮은가격"></a></div>
                    <div class="sort_menu"><a><img src="../_img/sort_name.png" alt="상품명"></a></div>
                    <div class="sort_menu"><a><img src="../_img/sort_new.png" alt="신상품"></a></div>
                </div>
            </div>

            <div class="prod_list">
            <%
 for(int i=0;i<productLists.size();i++){
    productList = (productDataBean)productLists.get(i);
%>
                    <div class="prod">
                        <a href="product-view.jsp">
                            <div class="prod_img"><a href="productContent.jsp?PDR_id=<%=productList.getPDR_id()%>&category=<%=category%>">
         <img src="../../imageFile/<%=productList.getPDR_image()%>" width="370px" height="auto"></div>
                            <div class="prod_title"><a href="productContent.jsp?PDR_id=<%=productList.getPDR_id()%>&category=<%=category%>">
         <%=productList.getTitle() %></a></div>
                            <div class="prod_line"></div>
                            <div class="prod_exp"><%=productList.getContent() %></div>
                            <div class="prod_price"><%=NumberFormat.getInstance().format(productList.getPrice())%>원</div>
                        </a>
                    </div>
                    <%
						 } 
						%>					<!-- 
                    <div class="prod">
                        <a href="#">
                            <div class="prod_img"></div>
                            <div class="prod_title">상품 이름</div>
                            <div class="prod_line"></div>
                            <div class="prod_exp">상품 설명</div>
                            <div class="prod_price">00,000원</div>
                        </a>
                    </div>
                    <div class="prod">
                        <a href="#">
                            <div class="prod_img"></div>
                            <div class="prod_title">상품 이름</div>
                            <div class="prod_line"></div>
                            <div class="prod_exp">상품 설명</div>
                            <div class="prod_price">00,000원</div>
                        </a>
                    </div>
                    
                     -->

            </div> 
        </div>
		
		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
