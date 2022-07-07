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
		<jsp:include page="../footer.jsp"/>
	</div>
        
</body>
</html>