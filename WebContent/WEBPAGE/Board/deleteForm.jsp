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
		<jsp:include page="../footer.jsp"/>
	</div>
	
	</body>
</html>