<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String userid = (String)session.getAttribute("id");
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>main</title>
	<link rel="stylesheet" type="text/css" href="../_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/main.css?after">
	<link rel="stylesheet" type="text/css" href="../_css/myPage.css?after">
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
		$(function(){
			//1
			$('.snip1535.my1').mouseover(function(){
				$('#my1').attr('src', '../_img/mypageimg1-hover.png');
			});
			$('.snip1535.my1').mouseout(function(){
				$('#my1').attr('src', '../_img/mypageimg1.png');
			});
			
			//2
			$('.snip1535.my2').mouseover(function(){
				$('#my2').attr('src', '../_img/mypageimg2-hover.png');
			});
			$('.snip1535.my2').mouseout(function(){
				$('#my2').attr('src', '../_img/mypageimg2.png');
			});
			
			//3
			$('.snip1535.my3').mouseover(function(){
				$('#my3').attr('src', '../_img/mypageimg3-hover.png');
			});
			$('.snip1535.my3').mouseout(function(){
				$('#my3').attr('src', '../_img/mypageimg3.png');
			});
			
			//4
			$('.snip1535.my4').mouseover(function(){
				$('#my4').attr('src', '../_img/mypageimg4-hover.png');
			});
			$('.snip1535.my4').mouseout(function(){
				$('#my4').attr('src', '../_img/mypageimg4.png');
			});
			
			//5
			$('.snip1535.my5').mouseover(function(){
				$('#my5').attr('src', '../_img/mypageimg5-hover.png');
			});
			$('.snip1535.my5').mouseout(function(){
				$('#my5').attr('src', '../_img/mypageimg5.png');
			});
			
			//6
			$('.snip1535.my6').mouseover(function(){
				$('#my6').attr('src', '../_img/mypageimg6-hover.png');
			});
			$('.snip1535.my6').mouseout(function(){
				$('#my6').attr('src', '../_img/mypageimg6.png');
			});
		});
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
					<div class="sub_title">마이페이지</div>
					<div class="sub_exp">Mypage</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품 목록 -->
	<div class="wrap_1200">
        
        <div class="page">
            <div class="page_menu">
                <div class="tr">
			        <a href="../Product/cart/cartList.jsp"><button class="snip1535 my1"><img src="../_img/mypageimg1.png" id="my1"></button></a>
			        <a href="member_edit.jsp"><button class="snip1535 my2"><img src="../_img/mypageimg2.png" id="my2"></button></a>
			        <a href="../Product/buy/buyList.jsp"><button class="snip1535 my3"><img src="../_img/mypageimg3.png" id="my3"></button></a>
                </div>
                <div class="tr">
                    <a href="../Board/list.jsp"><button class="snip1535 my4" ><img src="../_img/mypageimg4.png" id="my4"></button></a>
			        <a href="../Board/list.jsp"><button class="snip1535 my5" ><img src="../_img/mypageimg5.png" id="my5"></button></a>
			        <a href="../Login/logout.jsp"><button class="snip1535 my6" ><img src="../_img/mypageimg6.png" id="my6"></button></a>
                </div>
            </div>
        </div>

		<!-- 푸터 -->
		<jsp:include page="../footer.jsp"/>
	</div>
</body>
</html>
