<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String userid = (String)session.getAttribute("id");
   String userpwd = (String)session.getAttribute("pwd");
   String username = (String)session.getAttribute("name");
%>    
<!doctype html>
<html>
<head>
<meta charset="utf-8">
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
	int num = 0, ref = 1, re_step = 0, re_level = 0;
		String strV = "";
		try{
		if(request.getParameter("num")!=null){
   		num=Integer.parseInt(request.getParameter("num"));
   		ref=Integer.parseInt(request.getParameter("ref"));
   		re_step=Integer.parseInt(request.getParameter("re_step"));
   		re_level=Integer.parseInt(request.getParameter("re_level"));
	}
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

       
       <form method="post" name="writeform" action="writePro.jsp" onsubmit="return writeSave()">
				<input type="hidden" name="num" value="<%=num%>">
				<input type="hidden" name="ref" value="<%=ref%>">
				<input type="hidden" name="re_step" value="<%=re_step%>">
				<input type="hidden" name="re_level" value="<%=re_level%>">
       <table id="write-field">
           <tr>
               <td class="write-title">이름</td>
               <td><input type="text" name="writer"></td>
           </tr>
           <tr>
               <td class="write-title">이메일</td>
               <td><input type="text" name="email"></td>
           </tr>
           <tr>
           	   <%
			      if(request.getParameter("num")==null) 
			    	 strV = "";
			      else
			    	 strV = "[답변]";
			    %>
               <td class="write-title">제목</td>
               <td><input type="text" value="<%=strV %>" name="subject"></td>
           </tr>
            <tr class="contents">
               <td class="write-title">내용</td>
                <td><textarea name="content"></textarea></td>
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
           <div class="write-btns"><a href="list.jsp"><img src="../_img/write-list-btn.png"></a></div>
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