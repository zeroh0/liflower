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
	<link rel="stylesheet" type="text/css" href="_css/font.css?after">
	<link rel="stylesheet" type="text/css" href="_css/main.css?after">
	<link rel="stylesheet" href="./css/normalize.css">
<link rel="stylesheet" href="./css/main.css?after">
<style>
	.parallax-window {
    min-height: 400px;
    background: transparent;
}
</style>
<script src="./js/vendor/modernizr.custom.min.js"></script>
<script src="./js/vendor/jquery-1.10.2.min.js"></script>
<script src="./js/vendor/jquery-ui-1.10.3.custom.min.js"></script>
<script src="./js/main.js"></script>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css?after"
  />
</head>
	
<body>
    <!-- 헤더 -->
	<div class="wrap_1200">	
		<jsp:include page="header.jsp"/>
	</div>
	
	<!-- 메인비주얼 --> 
	<div class="wrap_1920">
        <div class="slideshow">
		    <div class="slideshow-slides">
		        <a class="slide" id="slide-1">
		        	<img src="_img/MainVisual1.jpg" alt="" width="1920" height="620">
        			<div class="animate__animated animate__fadeInUp"><img src="_img/main1_txt.png"></div>
        		</a>
		        <a class="slide" id="slide-2">
		        	<img src="_img/MainVisual3.jpg" alt="" width="1920" height="620">
		        	<div class="animate__animated animate__fadeInUp"><!-- <img src="_img/main2_txt.png">  --></div>
	        	</a>
		        <a class="slide" id="slide-3">
		        	<img src="_img/MainVisual4.jpg" alt="" width="1920" height="620">
		        	<div class="animate__animated animate__fadeInUp" id="mainimg3"><!--  <img src="_img/main3_txt.png">  --></div>
	        	</a>
		    </div>
		    <div class="slideshow-nav">
		        <a href="#" class="prev">Prev</a>
		        <a href="#" class="next">Next</a>
		    </div>
		    <div class="slideshow-indicator"></div>
		</div>
	</div>
	
	<!-- Content : Store Pick = 새 소식 & 상품 소개 -->
	<div class="wrap_1200">
		<!-- 컨텐츠-1 -->
		<div class="content1">
			<span>Store Pick</span>
			<div class="content1_inner">
				<div id="content1_left">
					<span>Flowering</span>
					<div id="line2"></div>
					<div id="exp">
						일상에서 느끼는 소소한<br>행복한 하루를 만들다!
					</div>
					<div id="hashtag">
						<div id="tag1">#작지만 확실한 행복</div>
						<div id="tag2">#비밀정원</div>
						<div id="tag3">#반려식물</div>
						<div id="tag4">#마음의 안정</div>
					</div>
					<div id="content1_img1">
						<a href="#"><img src="_img/img1.jpg" alt="이미지1"></a>
					</div>
					<div class="img_txt">
						<div class="img_hashtag"><a href="#">#작지만 확실한 행복</a></div>
						<div class="img_title"><a href="#">꽃에서 느끼는 소확행</a></div>
						<div class="img_exp"><a href="#">특별한 날에 특별한 나에게 주는 선물<br>일상적인 삶의 특별한 삶을 더해주세요.</a></div>
					</div>
				</div>
				<div id="content1_right">
					<div id="content1_img2">
						<a href="#"><img src="_img/img2.jpg" alt="이미지2"></a>
					</div>
					<div class="img_txt">
						<div class="img_hashtag"><a href="#">#반려식물</a></div>
						<div class="img_title"><a href="#">반려식물을 키우는 사람들</a></div>
						<div class="img_exp"><a href="#">공기 정화와 식물에 대한 애정</a></div>
					</div>
					<div id="contents">
						<div id="content1_3">
							<div id="content1_img3">
								<a href="#"><img src="_img/img3.jpg" alt="이미지3"></a>
							</div>
							<div class="img_txt">
								<div class="img_hashtag"><a href="#">#마음의 안정</a></div>
								<div class="img_title"><a href="#">Peace Of Mind</a></div>
								<div class="img_exp"><a href="#">나만을 위한 공간에 좋아하는 꽃으로<br>채워보자.</a></div>
							</div>
						</div>
						<div id="content1_4">
							<div id="content1_img4">
								<a href="#"><img src="_img/img4.jpg" alt="이미지4"></a>
							</div>
							<div class="img_txt">
								<div class="img_hashtag"><a href="#">#비밀정원</a></div>
								<div class="img_title"><a href="#">당신의 작은 정원</a></div>
								<div class="img_exp"><a href="#">소소한 나의 일상<br>나만의 정원을 꾸며보자.</a></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		
		<script src="./js/parallax.js"></script>
		<div class="parallax-window" data-parallax="scroll" data-image-src="_img/p1.jpg">
			<div class="wrap_1200">
				<img src="_img/logoBox.png" style="display: block;margin-left: auto;margin-right: auto;line-height:200px;padding:150px 0;">
			</div>
		</div>
		
		<div class="wrap_1200">
		<!-- 컨텐츠-2 -->
		<div id="wrap_100">
			<div class="content2">
				<div id="content2_title">RECOMMEND</div>
				<div id="content2_exp">여러분들을 위한 추천 상품</div>
				<div class="products">
				    <div class="product_list">
                        <div id="product_img"><a href="#"><img src="_img/product1.jpg" alt="추천상품1"></a></div>
                        <div class="product_name"><a href="#">은방울 꽃 부쉬</a></div>
                        <div class="product_sale">9,900원</div>
                        <div class="product_price">6,900원</div>
                        <div class="product_new"><img src="_img/new.jpg" alt="new"></div>
                    </div>
                    <div class="product_list">
                        <div id="product_img"><a href="#"><img src="_img/product2.jpg" alt="추천상품2"></a></div>
                        <div class="product_name"><a href="#">크리스마스 꽃 다발</a></div>
                        <div class="product_sale">9,900원</div>
                        <div class="product_price">6,900원</div>
                    </div>
                    <div class="product_list">
                        <div id="product_img"><a href="#"><img src="_img/product3.jpg" alt="추천상품3"></a></div>
                        <div class="product_name"><a href="#">튤립 꽃 다발</a></div>
                        <div class="product_sale">9,900원</div>
                        <div class="product_price">6,900원</div>
                    </div>
                    <div class="product_list">
                        <div id="product_img"><a href="#"><img src="_img/product4.jpg" alt="추천상품4"></a></div>
                        <div class="product_name"><a href="#">발렌타인데이 튤립</a></div>
                        <div class="product_sale">9,900원</div>
                        <div class="product_price">6,900원</div>
                    </div>
				</div>
			</div>
		</div>
		
		<!-- 푸터 -->
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
