<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "WEBPAGE.board.BoardBBean" %>
<%@ page import = "WEBPAGE.board.BoardDataBean" %>
<%
   String userid = (String)session.getAttribute("id");
%>
<html>
	<head>
		<title>게시판</title>
		<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
        <link rel="stylesheet" type="text/css" href="../_css/main.css?after">
        <link rel="stylesheet" type="text/css" href="../_css/write.css?after">
        <script>
            function check(){
		if(document.writeform.writer.value == ""){
			alert("이름를 입력하세요");
			document.writeform.writer.focus();
			return false;
		}
		if(document.writeform.email.value == ""){
			alert("이메일을 입력하세요")
			document.writeform.email.focus();
			return false;
		}
		if(document.writeform.subject.value == ""){
			alert("제목을 입력하세요");
			document.writeform.subject.focus();
			return false;
		}
		if(document.writeform.content.value == ""){
			alert("내용을 입력하세요");
			document.writeform.content.focus();
			return false;
		}
		if(document.writeform.passwd.value == ""){
			alert("비밀번호를 입력해주세요");
			document.writeform.passwd.focus();
			return false;
		}
		document.writeform.submit();
		return false;
	}
	
	function reset(){
		document.writeform.writer.value = "";
		document.writeform.email.value = "";
		document.writeform.subject.value = "";
		document.writeform.content.value = "";
		document.writeform.passwd.value = "";
	}
        </script>
	</head>
	<body>
		<%
  			int num = Integer.parseInt(request.getParameter("num"));
  			String pageNum = request.getParameter("pageNum");
  			try{
      			BoardBBean dbPro = BoardBBean.getInstance(); 
      			BoardDataBean article =  dbPro.updateGetArticle(num);
		%>
		
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

       
       <form method="post" name="writeform" 
					action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
			
       <table id="write-field">
           <tr>
               <td class="write-title">이름</td>
               <td>
                   <input type="text" name="writer" value="<%=article.getWriter()%>">
                   <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
                </td>
               
           </tr>
           <tr>
               <td class="write-title">이메일</td>
               <td><input type="text" name="email" value="<%=article.getEmail()%>"></td>
           </tr>
           <tr>
               <td class="write-title">제목</td>
               <td><input type="text" name="subject" value="<%=article.getSubject()%>"></td>
           </tr>
            <tr class="contents">
               <td class="write-title">내용</td>
                <td><textarea name="content"><%=article.getContent()%></textarea></td>
           </tr>
           <tr>
               <td class="write-title">비밀번호</td>
               <td><input type="password" name="passwd"></td>
           </tr> 
       </table>
       </form>
     
       <div id="write-btn">
           <div class="write-btns" onClick="check()"><a><img src="../_img/write-write-btn.png"></a></div>
           <div class="write-btns" onClick="reset()"><a><img src="../_img/write-reset-btn.png"></a></div>
           <div class="write-btns"><a onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"><img src="../_img/write-list-btn.png"></a></div>
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
			}catch(Exception e){}
		%>      
      
	</body>
</html>