<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  
  String userid = (String)session.getAttribute("id");
%>

<html>
	<head>
	<title>게시판</title>
	<link rel="stylesheet" type="text/css" href="../_css/font.css">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/qa_Delete.css?after">
    <script>
        function check() {
        	if(document.delForm.passwd.value == "") {
        		alert("비밀번호를 입력하세요.");
        		return false;
        	}
            document.delForm.submit();
		    return false;
        }
    </script>
	</head>
	<body>
	
	<!-- 헤더 -->
	<div class="wrap_1200">	
		<header>
			<div id="logo">
				<a href="../main.jsp"><img src="../_img/logo.jpg" alt="로고"></a>
			</div>
			<div id="gnb">
				<ul>
					<li><a href="../Product/list.jsp?category=100">Gift</a></li>
					<li><a href="../Product/list.jsp?category=200">Wreath</a></li>
					<li><a href="../Product/list.jsp?category=300">Bouquet</a></li>
					<li><a href="../Product/list.jsp?category=400">Grow</a></li>
				</ul>
			</div>
			<div id="icon">
				<ul>
					<%
						if(userid != null) {
					%>
					<li><a href="../Mypage/mypage.jsp"><span><%=userid %></span>님</a></li>
					<%
						} else {
					%>
					<li></li>
					<%
						}
					%>
					<li><a href="../Product/cart/cartList.jsp"><img src="../_img/basket.png" alt="장바구니"></a></li>
					<li>
						<%
							if(userid != null) {
						%>
                        <div class="dropdown">
                            <a href="../Mypage/mypage.jsp" class="dropbtn"><img src="../_img/mypage.png" alt="마이페이지"></a>
                            <div class="dropdown-content">
                                <a href="../Mypage/mypage.jsp">마이페이지</a>                        
                                <a href="../Board/list.jsp">Q&A</a>
                                <a href="../Login/logout.jsp">로그아웃</a>
                            </div>
                        </div>
                        <%
						} else {
						%>
						<div class="dropdown">
                            <a href="../Mypage/mypage.jsp" class="dropbtn"><img src="../_img/mypage.png" alt="마이페이지"></a>
                            <div class="dropdown-content">
                                <a href="../Login/login.jsp">로그인</a>
                                <a href="../Signup/signup1.jsp">회원가입</a>
                                <a href="../Board/list.jsp">Q&A</a>
                            </div>
                        </div>
                        <%
							}
						%>
                    </li>
					<li><a href="#"><img src="../_img/search.png" alt="검색"></a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">Q&A</div>
					<div class="sub_exp">상품에 대해 궁금하신 게 있으시면 이곳에 문의해주세요.</div>
				</div>
			</div>
		</div>
	</div>
        
        <div class="wrap_1200">	
        <div id="board">

        </div>
        
        <form method="POST" name="delForm" 
   						action="deletePro.jsp?pageNum=<%=pageNum%>" 
   						onsubmit="return deleteSave()"> 
        <div id="delete">
            <div id="delete-title">글삭제</div>
            <div id="delete-exp">
                이 글을 삭제하시려면 <span>비밀번호를 입력하여 주세요.</span>
                <div id="span">관리자는 확인 버튼만 누르시면 됩니다.</div>
            </div>

            <div id="delete-password">
                <div id="password-span">비밀번호</div>
                <div id="password-input"><input type="password" name="passwd"><input type="hidden" name="num" value="<%=num%>"></div>
            </div>

            <div id="delete-btn">
                <div id="delete-list"><a onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"><img src="../_img/delete-list.png"></a></div>
                <div id="delete-check"><a onClick="check()"><img src="../_img/delete-check.png"></a></div>
            </div>
        </div>
        </form>
        
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