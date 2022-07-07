<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "shop.master.productDBBean" %>
<%@ page import = "shop.master.productDataBean" %>
<%
    String userid = (String)session.getAttribute("id");
    %>
 
<%
int PDR_id = Integer.parseInt(request.getParameter("PDR_id"));
String category = request.getParameter("category");
try{
	productDBBean productProcess = productDBBean.getInstance();
    productDataBean pdr =  productProcess.getProduct(PDR_id);
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/product_manage_form.css?after">
	<script>
		function check() {
			document.writeform.submit();
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
					<div class="sub_title">상품관리</div>
					<div class="sub_exp">Product Management </div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><!--  <img src="../../_img/list.png"><span>상품관리</span>--></div>
            <form method="post" name="writeform" action="productUpdatePro.jsp"  enctype="multipart/form-data">
            <table class="member_field">
                <tr class="imgfile">
                    <td>이미지1</td>
                    <td><input type="file" name="PDR_image"> <%=pdr.getPDR_image() %></td>
                </tr>
                <tr class="imgfile">
                    <td>이미지2</td>
                    <td><img src="../../_img/file.png"></td>
                </tr>
                <tr class="imgfile">
                    <td>이미지3</td>
                    <td><img src="../../_img/file.png"></td>
                </tr>
                <tr class="imgfile">
                    <td>이미지4</td>
                    <td><img src="../../_img/file.png"></td>
                </tr>
                <tr class="prod_name">
                    <td>상품명</td>
                    <td><input type="text" name="title" value="<%=pdr.getTitle() %>">
                    <input type="hidden" name="PDR_id" value="<%=pdr.getPDR_id()%>"></td>
                </tr>
                <tr class="prod_info">
                    <td>가격</td>
                    <td><input type="text" name="price" value="<%=pdr.getPrice()%>"> 원</td>
                </tr>
                <tr class="prod_info">
                    <td>수량</td>
                    <td><input type="text" name="count" value="<%=pdr.getCount() %>"> 개</td>
                </tr>
                <tr class="prod_info">
                    <td>분류</td>
                    <td>
                        <select name="category">
			           <option value="Gift" 
			             <%if (pdr.getCategory().equals("Gift")) {%>selected<%} %>
			              > Gift</option>
			           <option value="Wreath" 
			             <%if (pdr.getCategory().equals("Wreath")) {%>selected<%} %>
			             >Wreath</option>
			           <option value="Bouquet" 
			             <%if (pdr.getCategory().equals("Bouquet")) {%>selected<%} %>
			             >Bouquet</option>
			               <option value="Grow" 
			             <%if (pdr.getCategory().equals("Grow")) {%>selected<%} %>
			             >Grow</option>
			       </select>
                    </td>
                </tr>
                <tr class="prod_exp">
                    <td>상품설명</td>
                    <td><input type="text" name="content" value="<%=pdr.getContent() %>"></td>
                </tr>
                <tr class="prod_exp">
                    <td>제조사</td>
                    <td><input type="text" name="manufacturer" value="<%=pdr.getManufacturer()%>"></td>
                </tr>   
                <tr class="prod_exp">
                    <td>판매일</td>
                    <td><select name="publishing_year">
                   
        <%
        Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
        int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
           for(int i=lastYear;i>=2010;i--){
        %>
             <option value="<%=i %>"  
             <%if (Integer.parseInt(pdr.getPublishing_date().substring(0,4))==i) {%>
             selected<%} %>><%=i %></option>
        <%} %>
        </select>년
        
        <select name="publishing_month">
        <%
           for(int i=1;i<=12;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(pdr.getPublishing_date().substring(5,7))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>월
        
        <select name="publishing_day">
        <%
           for(int i=1;i<=31;i++){
        %>
             <option value="<%=i %>" 
             <%if (Integer.parseInt(pdr.getPublishing_date().substring(8))==i) {%>
               selected<%} %>><%=i %></option>
        <%} %>
        </select>일</td>
                </tr>
            </table>
            </form>
            
            <div class="reg_prod_btn">
                <div class="prod_list"><a><img src="../../_img/reg-prod-list.png"></a></div>
                <div class="reg_reg">
                    <div class="prod_cancel"><a><img src="../../_img/reg-prod-cancel.png"></a></div>
                    <div class="prod_check"><a><img src="../../_img/reg-prod-check.png" onClick="check()"></a></div>
                </div>
            </div>
            
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
	<%
}catch(Exception e){
	e.printStackTrace();
}%>         
</body>
</html>