<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="../_css/login.css?after">
<script>
	function check(){
		if(document.form1.id.value==""){
			alert("아이디를 입력하세요");
			document.form1.id.focus();
			return false;
		}
		if(document.form1.id.value.length<4||document.form1.id.value.length>8){
			alert("아이디는 4자 이상입니다")
			document.form1.id.focus();
			return false;
		}
		if(document.form1.pass1.value==""){
			alert("비밀번호를 입력하세요");
			document.form1.pass1.focus();
			return false;
		}
		if(document.form1.pass1.value.length>10){
			alert("비밀번호가 너무 깁니다");
			document.form1.pass1.focus();
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
					<div class="sub_title">로그인</div>
					<div class="sub_exp">Login</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 로그인 폼 -->
	<div class="wrap_1200">
		<div id="login_parents">
			<div id="login">
				<div class="select_login"></div>
				<div class="login_field">
					<form action="loginproc.jsp" method="post" name="form1">
						<table class="login_table">
							<tr class="space">
								<td class="column">아이디</td>
								<td class="inputbox"><input type="text" name="id" placeholder="아이디 입력"></td>
							</tr>
							<tr class="space"></tr>
							<tr>
								<td class="column">비밀번호</td>
								<td class="inputbox"><input type="password" name="pass1" placeholder="비밀번호 입력"></td>
							</tr>
						</table>
						<div id="login_btn"><a onClick="check()"><img src="../_img/login-btn.png" alt="로그인"></a></div>
					</form>
					<div class="etc">
						<ul>
							<li><a href="findID.jsp">아이디 찾기</a></li>
							<li><a href="findPW.jsp">비밀번호 찾기</a></li>
							<li><a href="../Signup/signup1.jsp">회원가입</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
	<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
