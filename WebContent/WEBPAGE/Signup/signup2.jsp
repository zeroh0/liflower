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
<link rel="stylesheet" type="text/css" href="../_css/signup2.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function openDaumZipAddress() {
		new daum.Postcode({
			oncomplete:function(data) {
				var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
				
				console.log(data.zonecode);
                console.log(fullRoadAddr);
        	
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
				document.getElementById('address1').value = fullRoadAddr;
			}
		}).open();
	}
	
	
	function Checkid(){
		  if (document.form1.id.value == "") {
			  alert("아이디를  입력하세요");
			  document.form1.id.focus();
			  return false;}
		  var id = document.form1.id.value
		  
		  window.open("checkID.jsp?id="+id,"","width=350 ,height=250 ,scrollbars=no, resizable=yes");
	  }
	
	
	function check() {
		  if (document.form1.id.value == "") {
			  alert("아이디를  입력하세요");
			  document.form1.id.focus();
			  return false;
		  }	 
		  if(document.form1.id.value.length < 4 || document.form1.id.value.length > 8) {
			  alert("아이디를  4~8자로 입력하세요");
			  document.form1.id.focus();
			  return false;
		  }
	      if (document.form1.pass1.value == "") {
			  alert("패스워드를  입력하세요");
			  document.form1.pass1.focus();
			  return false;	 	  
		  }
	      if(document.form1.pass1.value.length < 4 || document.form1.pass1.value.length >10) {
			  alert("비번를  4~10자로 입력하세요");
			  document.form1.pass1.focus();
			  return false;
		  }
	      if (document.form1.pass1.value != document.form1.pass2.value) {
			  alert("패스워드와 패스워드 확인값이 다릅니다. 다시입력하세요. ");
			  //document.form1.pass1.value = "";
			  document.form1.pass2.value = "";		  
			  document.form1.pass2.focus();
			  return false;	 	  
		  }
	      if (document.form1.name.value == "") {
			  alert("이름을  입력하세요");
			  document.form1.name.focus();
			  return false;
		  }	 
	      if (document.form1.email1.value == "" || document.form1.email2.value=="") {
			  alert("이메일  입력하세요");
			  document.form1.email.focus();
			  return false;
		  }	 
	      if (document.form1.tel1.value == "" || document.form1.tel2.value=="" || document.form1.tel3.value=="" ) {
			  alert("폰번호를 입력하세요");
			  document.form1.cellphone.focus();
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
			
				<div id="signup_txt">
					<div id="signup_info">회원기본정보</div>
					<div id="signup_caution">* 표시는 반드시 입력하셔야 하는 항목입니다.</div>
				</div>
				
				<form action="insert.jsp" method="post" name="form1">
				<table class="signup_field">
					<tr>
						<td class="field_title">이름</td>
						<td><input type="text" class="inputbox" name="name" placeholder="이름 입력"></td>
					</tr>
					<tr class="space"></tr>
					<tr>
						<td class="field_title">아이디</td>
						<td class="inputbox_id">
							<div id="input_id"><input type="text" class="inputbox" name="id" placeholder="아이디 입력"></div>
							<div id="id_chk"><a onClick="Checkid()"><img src="../_img/id-check-btn.png" alt="아이디 중복체크"></a></div>
						</td>
					</tr>
					<tr class="space"><td></td><td></td></tr>
					<tr>
						<td class="field_title">비밀번호</td>
						<td><input type="password" class="inputbox" name="pass1" placeholder="비밀번호 입력"></td>
					</tr>
					<tr class="space"></tr>
					<tr>
						<td class="field_title">비밀번호 확인</td>
						<td><input type="password" class="inputbox" name="pass2" placeholder="비밀번호 확인 입력"></td>
					</tr>
					<tr class="space"></tr>
					<tr>
						<td class="field_title">이메일</td>
						<td class="inputbox_email">
							<input type="text" class="inputbox" name="email1" placeholder="이메일 입력"> 
							&nbsp; @ &nbsp;
							<select name="email2">
								<option value="naver.com">naver.com</option>
								<option value="nate.com">nate.com</option>
								<option value="gmail.com">gmail.com</option>
							</select>
						</td>
					</tr>
					<tr class="space"></tr>
					<tr>
						<td class="field_title">휴대폰번호</td>
						<td class="inputbox_tel">
							<select name="tel1">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
							</select>
							&nbsp; - &nbsp;
							<input type="text" name="tel2">
							&nbsp; - &nbsp;
							<input type="text" name="tel3">
						</td>
					</tr>
					<tr class="space"></tr>
					<tr class="inputbox_id">
						<td class="field_title">주소</td>
						<td>
							<div id="input_address"><input type="text" class="inputbox" name="postcode" id="postcode" placeholder="우편번호" readonly></div>
							<div id="address_find"><a href="#"><img src="../_img/postcode-btn.png" alt="우편번호 찾기" onClick="openDaumZipAddress();"></a></div>
						</td>
					</tr>
					<tr class="separation"></tr>
					<tr>
						<td class="field_title"></td>
						<td><input type="text" class="inputbox" name="address1" id="address1" placeholder="주소" readonly></td>
					</tr>
					<tr class="separation"></tr>
					<tr>
						<td class="field_title"></td>
						<td><input type="text" class="inputbox" name="address2" id="address2" placeholder="상세 주소"></td>
					</tr>
					<tr class="space"></tr>
					
				</table>
				
				
				<div id="signup_btn">
					<div id="signup_reset"><a href="signup1.jsp"><img src="../_img/register-reset.png" alt="취소"></a></div>
					<div id="signup_check"><a onClick="check()"><img src="../_img/register-check.png" alt="확인"></a></div>
				</div>
				</form>
			</div>
			
		</div>
	
	<!-- 푸터 -->
	<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
