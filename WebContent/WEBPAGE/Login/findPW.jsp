<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String userid = (String)session.getAttribute("id");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>findPW</title>
<link rel="stylesheet" type="text/css" href="../_css/font.css">
<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
<link rel="stylesheet" type="text/css" href="../_css/findPW.css?after">
<script>
	function check() {	
		if(document.form1.id.value==""){
			alert("아이디을 입력해주세요");
			document.form1.id.focus();
			return false;
		}
		
		if(document.form1.name.value==""){
			alert("이름을 입력해주세요");
			document.form1.email1.focus();
			return false;
		}
		
		if(document.form1.email1.value==""){
			alert("이메일을 입력해주세요");
			document.form1.email1.focus();
			return false;
		}
		
		document.form1.submit();
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
					<div class="sub_title">비밀번호 찾기</div>
					<div class="sub_exp">findPW</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 아이디 찾기 -->
	<div class="wrap_1200">
		<div id="findPW_parents">
			<div id="findPW">
				<div class="select_find">
					<div class="select_id"><a href="findID.jsp">아이디 찾기</a></div>
					<div class="select_pw"><a href="findPW.jsp">비밀번호 찾기</a></div>
				</div>
				<div class="findPW_field">
					<form action="findPW_check.jsp" method="post" name="form1">
						<table class="findPW_table">
							<tr>
								<td class="column">아이디</td>
								<td class="inputbox"><input type="text" name="id" placeholder="아이디 입력"></td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td class="column">이름</td>
								<td class="inputbox"><input type="text" name="name" placeholder="이름 입력"></td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td class="column">이메일</td>
								<td class="inputbox_email">
									<input type="text" name="email1" placeholder="이메일 입력">
									&nbsp;@&nbsp;
									<select name="email2">
										<option value="naver.com">naver.com</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
									</select>
								</td>
							</tr>
						</table>
						<div id="findPW_btn"><a onclick="check()"><img src="../_img/pw_find-btn.png" alt="로그인"></a></div>
					</form>
					<div class="etc">
						* 가입 당시 입력한 아이디 이름 이메일로 비밀번호를 확인할 수 있습니다.
					</div>
				</div>
			</div>
		</div>
		
	<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
