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
		<jsp:include page="../header_1.jsp"/>
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
                <a href="list.jsp?pageNum=<%= i %>">
                <%
                	if(currentPage == i) {
            	%>
            		<img src="../_img/board<%= i %>_select.png">
            	<%
                	} else {
                %>
                	<img src="../_img/board<%= i %>.png">
                <%
                	}
                %>
               	</a>
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
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>