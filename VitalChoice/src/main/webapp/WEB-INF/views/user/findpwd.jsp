<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.seller_main{
		width: 1200px;
		margin: 0 auto;
	}
	.layout_login_wrap{
		width: 600px;
		margin: 0 auto;
		text-align: left;
		
	}
	.layout_inner{
		width: 570px;
		margin: 0 auto;
		margin-top: 50px;
	}
	.layout_inner h2{
		font-weight: 600;
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
</head>
<body>
<form action="pwdfind" method="post">
<div class="layout_login_wrap">
	<div class="layout_inner">
		<h2 class="seller_signup_title">비밀번호 찾기</h2>
		<hr style="margin-top: 30px; margin-bottom: 50px;">
		<form action="sellerloginsave" method="post">
		    <div class="seller_form_group">
		    	<label for="userid">아이디</label><br>
		    	<input type="text" class="seller_input_form" id="user_id" placeholder="아이디를 입력하세요" name="user_id">
		    </div>
		    <div class="seller_form_group">
		    	<label for="email">이메일</label><br>
		    	<input type="password" class="seller_input_form" id="user_email" placeholder="abcd@abcd.com 형식으로 입력해주세요." name="user_email">
		    </div>
		    <div style="text-align: center;">
		 		<button type="submit" class="btn_seller_signup_submit">비밀번호 찾기</button>
		 	</div>
		 </form>	
	</div>
</div>

</body>
</html>