<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../../_css/order-view.css?after">
</head>
	
<body>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<header>
			<div id="logo">
				<a href="#"><img src="../../_img/logo.jpg" alt="로고"></a>
			</div>
			<div id="gnb">
				<ul>
					<li><a href="#">Gift</a></li>
					<li><a href="#">Wreath</a></li>
					<li><a href="#">Bouquet</a></li>
					<li><a href="#">Grow</a></li>
				</ul>
			</div>
			<div id="icon">
				<ul>
					<li><a href="#"><span>홍길동</span>님</a></li>
					<li><a href="#"><img src="../../_img/basket.png" alt="장바구니"></a></li>
					<li>
						<div class="dropdown">
							<a href="#" class="dropbtn"><img src="../../_img/mypage.png" alt="마이페이지"></a>
							<div class="dropdown-content">
								<a href="#">로그인</a>
								<a href="#">회원가입</a>
								<a href="#">Q&A</a>
							</div>
						</div>
					</li>
					<li><a href="#"><img src="../../_img/search.png" alt="검색"></a></li>
				</ul>
			</div>
		</header>
	</div>

	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">주문</div>
					<div class="sub_exp">Order</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        <div class="member_list">
            <div class="depth_menu"><img src="../../_img/list.png"><span>주문정보</span></div>
            <table class="member_field">
                <thead>
                    <tr>
                        <th>주문일자</th>
                        <th>이미지</th>    
                        <th>상품명(상품번호)</th>
                        <th>결제수단</th>
                        <th>주문금액(개수)</th>
                        <th>결제금액</th>
                        <th>배송상태</th>
                        <th>확인</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2020-02-20 00:00:00</td>
                        <td><img src="../../_img/eximg.jpg" alt="상품이미지"></td>
                        <td>은방울 꽃 부쉬(1)</td>
                        <td>무통장입금</td>
                        <td>99,000(10개)</td>
                        <td>결제완료</td>
                        <td>결제대기</td>
                        <td><a><img src="../../_img/order-check.png" alt="확인"></a></td>
                    </tr>
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
