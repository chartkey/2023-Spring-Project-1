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
		color: black;
	}
	.layout_login_wrap{
		width: 600px;
		margin: 0 auto;
	}
	.layout_inner{
		width: 570px;
		margin: auto;
	}
	.seller_form_group{
		margin-bottom: 30px;
	}
	.seller_input_form{
		padding-left: 13px;
		margin-top: 10px;
		width: 553px;
		height: 36px;
		border-radius: 5px;
		border-width: 0.4px;
		border: solid 1px gray;
	}
	label{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
	}
	.btn_seller_signup_submit{
		height: 38px;
		border-radius: 5px;
		background-color: #005700;
		color: white;
		width: 250px;	
		border-style: none;
		margin: 50px;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="seller_main">
	<div class="seller_logo">
		<a href="backToHome"><img id = "seller_logo_img" src="resources/logo_h.png"></a>
		<span id = "seller_logo_text">판매자 센터</span>
	</div>
</div>
	<hr size="0.5px" color="gray" style="opacity: 0.5;">
<div style="margin-top: 30px; margin-bottom: 50px;"></div>
<!-- 로그인부분 -->
<div class="layout_login_wrap">
	<div class="layout_inner">
		<h2 class="seller_signup_title">판매자 회원 로그인</h2>
		<hr style="margin-top: 30px; margin-bottom: 50px;">
		<form action="sellerloginsave" method="post">
		    <div class="seller_form_group">
		    	<label for="seller_id">아이디</label><br>
		    	<input type="text" class="seller_input_form" id="seller_id" placeholder="아이디를 입력하세요" name="seller_id">
		    </div>
		    <div class="seller_form_group">
		    	<label for="seller_pw">패스워드</label><br>
		    	<input type="password" class="seller_input_form" id="seller_pw" placeholder="비밀번호를 입력하세요" name="seller_pw">
		    </div>
		    <div style="text-align: center;">
		 		<button type="submit" class="btn_seller_signup_submit">로그인</button>
		 	</div>
		 </form>	
	</div>
</div>

</body>
</html>