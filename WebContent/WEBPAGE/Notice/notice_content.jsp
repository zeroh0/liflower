<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "WEBPAGE.board.BoardBBean" %>
<%@ page import = "WEBPAGE.board.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>

  <%
  	String userid = (String)session.getAttribute("id");
  %>    
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
<link rel="stylesheet" type="text/css" href="../_css/qa_View.css?after">
</head>
	
	<body>
	<%
   		int num = Integer.parseInt(request.getParameter("num"));
   		String pageNum = request.getParameter("pageNum");

   		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

   		try{
      		BoardBBean dbPro = BoardBBean.getInstance(); 
      		BoardDataBean article =  dbPro.getArticle(num);
  
		  int ref=article.getRef();
		  int re_step=article.getRe_step();
		  int re_level=article.getRe_level();
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

        
        <form>
        <table class="view-table">
               <tr>
                   <td class="view-title">제목</td>
                   <td class="view-exp"><%=article.getSubject()%></td>
               </tr>
               
               <tr>
                   <td class="view-title">작성자</td>
                   <td class="view-exp"><%=article.getWriter()%></td>
               </tr>
                  
               <tr class="view-sub">
                   <td colspan="2">
                       <div id="date">작성일 <span><%= sdf.format(article.getReg_date())%></span></div>
                       <div id="views">조회 <span><%=article.getReadcount()%></span></div>
                   </td>
               </tr>
                             
                <tr class="contents">
                    <td colspan="2"><%=article.getContent()%></td>
                </tr>           
        </table>
        </form>
        
        <div id="view-btn">
        	<!-- 답글 -->
        	<%
        		if(userid.equals("admin")) {
        	%>
        	<div class="view-btns"><a onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'"><img src="../_img/re_btn.png"></a></div>
        	<%
        		}
        	%>
            <div class="view-btns"><a onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'"><img src="../_img/view-update-btn.png"></a></div>
            <div class="view-btns"><a onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'"><img src="../_img/view-delete-btn.png"></a></div>
            <div class="view-btns"><a onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"><img src="../_img/view-list-btn.png"></a></div>
        </div>
    
         <%
 		}catch(Exception e){} 
 	%>
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