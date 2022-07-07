<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "shop.master.productDBBean" %>
<%@ page import = "shop.master.productDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>
<%
    String userid = (String)session.getAttribute("id");
    %>
<%
	List<productDataBean> productList = null; 
    int number =0;
    String category="";
    
    category = "all";
 
    productDBBean productProcess = productDBBean.getInstance();
    int count = productProcess.getProductCount();
    
    if (count > 0) {
    	productList = productProcess.getProducts(category);
    }
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/product_manage_list.css?after">
	<script>

	</script>
</head>
	
<body>
	<%
	String categoryName="all";

	   categoryName="전체";
%>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<jsp:include page="../../header_2.jsp"/>
	</div>

	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">상품관리</div>
					<div class="sub_exp">Product Management</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><!-- <img src="../../_img/list.png"><span>상품관리</span> --></div>
            <div class="reg_btn"><a href="productRegisterForm.jsp"><img src="../../_img/reg-product.png"></a></div>
            <table class="member_field">
                <thead>
                    <tr>
                        <th>상품번호</th>
                        <th>이미지</th>    
                        <th>상품명</th>
                        <th>가격</th>
                        <th>분류</th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                <%
					for (int i = 0 ; i <productList.size() ; i++) {
				      productDataBean pdr = 
				    		  (productDataBean)productList.get(i);
				%>
                    <tr>
                        <td><%=++number%></td>
                        <td><img src="../../../imageFile/<%=pdr.getPDR_image()%>" width="auto" height="100px"></td>
                        <td><%=pdr.getTitle()%></td>
                        <td><%=pdr.getPrice()%>원</td>
                        <td><%=pdr.getCategory()%></td>
                        <td>
                            <a href="productUpdateForm.jsp?PDR_id=<%=pdr.getPDR_id()%>&category=<%=pdr.getCategory()%>"><img src="../../_img/product-update.png"></a>
                            <span><a href="productDeleteForm.jsp?PDR_id=<%=pdr.getPDR_id()%>&category=<%=pdr.getCategory()%>"><img src="../../_img/product-del.png"></a></span>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            
        </div>
        

		<!-- 푸터 -->
		<footer>
			<div class="footer">
				<div class="footer_menu">
					<ul>
						<li>브랜드소개</li>
						<li>이용약관</li>
						<li>개인정보취급방침</li>
						<li>고객센터</li>
						<li>제휴/유통 문의</li>
					</ul>
				</div>
				<div class="footer_exp">
					<div id="customer" class="footer_section">
						<div class="section_title">CUSTOMER CENTER</div>
						<div class="line3"></div>
						<div id="customer_tel">0000 - 0000</div>
						<div class="exp"><span>MON-FRI</span>00:00 ~ 00:00</div>
						<div class="exp"><span>LUNCH</span>00:00 ~ 00:00</div>
						<div class="exp"><span>CLOSE</span>SAT, SUN, HOLIDAY</div>
					</div>
					<div id="bank" class="footer_section">
						<div class="section_title">BANK INFO</div>
						<div class="line3"></div>
						<div class="exp"><span>장안은행</span>000000 - 00 - 000000</div>
						<div class="exp"><span>예금주</span>(주)아무개</div>
					</div>
					<div id="order" class="footer_section">
						<div class="section_title">ORDER INFO</div>
						<div class="line3"></div>
						<div class="delivery">장안택배</div>
						<div class="delivery_exp">배송 정보는 해당 택배사를 통해 조회가 가능하십니다. </div>
						<div id="delivery_info">RETURN & EXCHANGE</div>
						<div class="delivery">반품배송지<span>경기도 화성시 봉담읍 삼천병마로 1182</span></div>
						<div class="delivery_exp">공지사항 및 이용안내를 참고하셔서 지정택배사로 반품 요청해주세요.</div>
					</div>
					<div id="company" class="footer_section">
						<div class="section_title">COMPANY INFO</div>
						<div class="line3"></div>
						<div class="company_exp">
							<span><span>회사명</span>(주)아무개</span>
							<span><span>대표</span>아무개</span>
							<span><span>대표전화</span>000 - 0000</span>
						</div>
						<div class="company_exp">
							<span><span>주소</span>경기도 화성시 봉담읍 삼천병마로 1182</span>
						</div>
						<div class="company_exp">
							<span><span>사업자등록번호</span>000 - 00 - 00000</span>
						</div>
						<div class="company_exp">
							<span><span>개인정보관리책임자</span>아무개</span>
							<span><span>이메일</span>amugae@jangan.ac.kr</span>
						</div>
					</div>
				</div>
				<div class="footer_copyright">
					<div class="copyright">COPYRIGHT © 2020 WEBJOLJAK. ALL RIGHTS RESERVED.</div>
				</div>
			</div>
		</footer>
	</div>
</body>
</html>
