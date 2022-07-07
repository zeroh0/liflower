<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import = "WEBPAGE.board.BoardBBean" %>
<%@ page import = "WEBPAGE.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

	<%
  		String userid = (String)session.getAttribute("id");
	%>    

	<%!
    	int pageSize = 15;
    	SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
	%>

	<%
		String pageNum = request.getParameter("pageNum");

    	if (pageNum == null) {
        	pageNum = "1";
    	}

    	int currentPage = Integer.parseInt(pageNum);
    	int startRow = (currentPage - 1) * pageSize + 1;
    	int endRow = currentPage * pageSize;
    	int count = 0;
    	int number = 0;
   	 	List<BoardDataBean> articleList = null; 
    	
    	BoardBBean dbPro = BoardBBean.getInstance();
    	count = dbPro.getArticleCount();
    
    	if (count > 0) {
        	articleList = dbPro.getArticles(startRow, pageSize);
    	}

		number = count-(currentPage-1)*pageSize;
	%>
	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Q&A-List</title>
    <link rel="stylesheet" type="text/css" href="../_css/font.css">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
    <link href="../_css/qa_List.css?after" rel="stylesheet" type="text/css">
    
</head>
<body style="overflow-x:hidden; overflow-y:auto;">
   
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
					<li><a href=../Product/cart/cartList.jsp><img src="../_img/basket.png" alt="장바구니"></a></li>
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
					<div class="sub_title">Q&A</div>
					<div class="sub_exp">상품에 대해 궁금하신 게 있으시면 이곳에 문의해주세요.</div>
				</div>
			</div>
		</div>
	</div>
   
   <div class="wrap_1200">
   <!-- 게시판에 글이 없을 때 -->
    <% if (count == 0) { %>
    <div id="board">
    	
	    <div id="board-table">
           <table class="table">
				<thead> 
    				<tr> 
      					<th><span>번호</span></th> 
      					<th><span>제목</span></th> 
      					<th><span>작성자</span></th>
      					<th><span>작성일</span></th> 
      					<th><span>조회</span></th> 
    				</tr>
    			</thead>
    			
	    		<tbody>
	    			<tr>
	    				<td colspan="5">게시판에 저장된 글이 없습니다.</td>
	    			</tr>
	    		</tbody>
    		</table>
	    </div>
    </div>

    <!-- 게시판에 글이 있을 때 -->
    <% } else {%>
   
   <div id="board">
       
       <div id="board-table">
           <table class="table">
				<thead> 
    				<tr> 
      					<th><span>번호</span></th> 
      					<th><span>제목</span></th> 
      					<th><span>작성자</span></th>
      					<th><span>작성일</span></th> 
      					<th><span>조회</span></th> 
    				</tr>
    			</thead>
                <tbody>
                <%  
	   				for (int i = 0 ; i < articleList.size() ; i++) {
	     			BoardDataBean article = articleList.get(i);
				%>
                    <tr>
                        <!-- 번호 -->
                        <td><span><%=number--%></span></td>
                        <!-- 제목 -->
                        <td>
                        	<%
								int wid=0; 
								if(article.getRe_level()>0){
							   		wid=5*(article.getRe_level());
							%>
								<img src="../_img/re.png">
							<% } %>
                            <span>
                                <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>" style="text-align:center">
                                    <%=article.getSubject()%>
                                </a>
                            </span>					
                        </td>
                        <!-- 작성자 -->	
                        <td><span><%=article.getWriter()%></span></td>
                        <!-- 작성일 -->
                        <td><span class="sub-text"><%= sdf.format(article.getReg_date())%></span></td>
                        <!-- 조회 -->
                        <td><span class="sub-text"><%=article.getReadcount()%></span></td>	
                    </tr>
                </tbody>
                <%}%>
			</table>
			<%}%>
       </div>
    </div>
   
    <div id="board-Utility">
        <div id="wrtie-btn">
            <a href="writeForm.jsp"><img src="../_img/write-write-btn.png" alt="글작성"></a>
        </div>
        <div id="pageNum">
            <%            
           
            if (count > 0) {
                int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
                int startPage =1;

            if(currentPage % 15 != 0)
                startPage = (int)(currentPage/15)*15 + 1;
            else
                startPage = ((int)(currentPage/15)-1)*15 + 1;

            int pageBlock = 15;
            int endPage = startPage + pageBlock - 1;
            if (endPage > pageCount) endPage = pageCount;
			
            if (startPage > 15) { %>
                <a href="list.jsp?pageNum=<%= startPage - 15 %>">[이전]</a>
            <%      }

            for (int i = startPage ; i <= endPage ; i++) {  %>
                <a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
            <%      }

            if (endPage < pageCount) {  %>
                <a href="list.jsp?pageNum=<%= startPage + 15 %>">[다음]</a>

            <%
                    }
                }
            %>
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