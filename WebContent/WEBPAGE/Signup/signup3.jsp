<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String userid = (String)session.getAttribute("id");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>signup1</title>
<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
<link rel="stylesheet" type="text/css" href="../_css/signup3.css?after">
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
					<div class="sub_title">회원가입</div>
					<div class="sub_exp">Signup</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 회원가입 -->
	<div class="wrap_1200">
		<div class="signup">
			
			<div class="process">
				<ul>
					<li>STEP1.약관동의</li>
					<li>STEP2.회원정보 입력</li>
					<li>STEP3.가입완료</li>
				</ul>
			</div>
			
			<div id="signup_form">
			
				<div id="welcome_txt">WELCOME! 회원가입이 완료되었습니다.</div>
				<div id="welcome_btn"><a href="../main.jsp"><img src="../_img/go-main-btn.png"></a></div>
			
			</div>
			
		</div>
	
	<!-- 푸터 -->
	<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
