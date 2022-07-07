 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%
   String userid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="../_css/font.css">
<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
<link rel="stylesheet" type="text/css" href="../_css/findPW_check.css?after">
</head>
<body>
	<%
        String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		
		Connection conn = null; //Connection 객체 생성
		Statement stmt = null; //Statement 객체 생성
		
		String dburl = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=utf-8&UTF-8&serverTimezone=Asia/Seoul";
		String dbid = "root";
		String dbpwd = "multi2020";
		
		Class.forName("com.mysql.jdbc.Driver"); //드라이버 로드
		conn = DriverManager.getConnection(dburl,dbid,dbpwd); //webdb 연결 
		stmt= conn.createStatement();
		
		String sql = "select * from member where id='"+id+"' and name='"+name+"' and email='"+email+"'";
		ResultSet rs= stmt.executeQuery(sql);
	
	%>
	
	<!-- 헤더 -->
	<div class="wrap_1200">	
		<header>
			<div id="logo">
				<a href="main.jsp"><img src="../_img/logo.jpg" alt="로고"></a>
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
					<%
						if(userid != null) {
					%>
					<script>
						alert("이미 로그인된 상태입니다.");
						location.href="main.jsp";
					</script>
					<%
						} else {
					%>
					<li></li>
					<%
						}
					%>
					<li><a href="#"><img src="../_img/basket.png" alt="장바구니"></a></li>
					<li><a href="#"><img src="../_img/mypage.png" alt="마이페이지"></a></li>
					<li><a href="logout.jsp"><img src="../_img/search.png" alt="검색"></a></li>
				</ul>
			</div>
		</header>
	</div>
	
	<!-- 서브비주얼 -->
	<div class="wrap_1920">
		<div class="subVisual">
			<div class="subVisual_wrap">
				<div class="sub_txt">
					<div class="sub_title">아이디 찾기</div>
					<div class="sub_exp">findID</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디 찾기 -->
	<div class="wrap_1200">
		<div id="findID_parents">
			<div id="findID">
			
				<div class="select_find">
					<div class="select_id"><a href="findID.jsp">아이디 찾기</a></div>
					<div class="select_pw"><a href="findPW.jsp">비밀번호 찾기</a></div>
				</div>
				<div class="find_result">
					<%
						if(rs.next()){
							String passwd = rs.getString("passwd");
					%>
					<div class="result">회원님의 비밀번호는 <span><%=passwd %></span> 입니다.</div>
					<% } else { %>
					<script>
						alert("<%= name%>" + " 와/과 일치하는 비밀번호가 존재하지 않습니다.");
						location.href="findPW.jsp";
					</script>
					<%
						}
					%>
					<div class="find_login"><a href="login.jsp"><img src="../_img/login-btn.png" alt="로그인"></a></div>
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
	
</body>
</html>