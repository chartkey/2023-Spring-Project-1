<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
	.seller_main{
		width: 1200px;
		margin: 0 auto;
	}
	.seller_logo{
		margin-top: 25px;
		margin-bottom: 20px;
	}
	#seller_logo_img{
		height: 25px;
		margin-right: 15px;
	}
	#seller_logo_text{
		font-size: 25px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 300;
		color: #F8F5F1;
	}
	.seller_body{
		margin-top: 80px;
	}
	.seller_body_text{
		margin-bottom: 80px;
	}
	.seller_body_text1{
		font-size: 40px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		color: #F8F5F1;
	}
	.seller_body_text2{
		font-size: 60px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 600;
		color: #005700;
	}
	.btn_seller_signup{
		height: 80px;
		width: 300px;
		background-color: #009d00;
		color: #F8F5F1;
		border-radius: 10px;
		border-color: #009d00;
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
		cursor: pointer;
	}
	.btn_seller_login{
		height: 80px;
		width: 300px;
		background-color: transparent;
		color: #F8F5F1;
		border-radius: 10px;
		border-color: #F8F5F1;
		font-size: 18px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
		cursor: pointer;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body style="background-size: cover; background-image: linear-gradient( rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6) ), url('resources/seller_main.jpg');">
<div class="seller_main">
	<div class="seller_logo">
		<img id = "seller_logo_img" src="resources/logo_h.png">
		<span id = "seller_logo_text">판매자 센터</span>
	</div>
</div>
	<hr size="0.5px" color="#F8F5F1" style="opacity: 0.5;">
<div class="seller_main">
	<div class="seller_body">
		<div class="seller_body_text">
			<div class="seller_body_text1">건강 기능 식품 NO.1</div>
			<div class="seller_body_text2"><span style="color: #009d00;">바이탈 초이스</span>와 함께하세요.</div>
		</div>
		<div class="seller_body_btn">
			<a href="sellerlogin"><button type="button" class="btn_seller_signup">로그인하기</button></a>
			<a href="sellersignup"><button type="button" class="btn_seller_login">가입하기</button></a>
		</div>
	</div>
</div>

</body>
</html>