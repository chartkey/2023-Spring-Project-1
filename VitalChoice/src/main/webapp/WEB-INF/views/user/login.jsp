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
	#forgot span{
		float: right;
	}
	#forgot a{
		float: right;
	}
  
</style>

</head>
<body>
<form action="logincheck" method="post">
<div class="layout_login_wrap">
	<div class="layout_inner">
		<h2 class="seller_signup_title">로그인</h2>
		<hr style="margin-top: 30px; margin-bottom: 50px;">
		<form action="sellerloginsave" method="post">
		    <div class="seller_form_group">
		    	<label for="username">아이디</label><br>
		    	<input type="text" class="seller_input_form" id="user_id" placeholder="아이디를 입력하세요" name="user_id">
		    </div>
		    <div class="seller_form_group">
		    	<label for="password">패스워드</label><br>
		    	<input type="password" class="seller_input_form" id="user_pwd" placeholder="비밀번호를 입력하세요" name="user_pwd">
		    </div>
		    <div id="forgot">
                <a href="join">회원가입</a><span>　|　</span>　
                <a href="findid">아이디 찾기</a><span>　|　</span>　
                <a href="findpwd">비밀번호 찾기</a>
            </div>	
		    <div style="text-align: center;">
		 		<button type="submit" class="btn_seller_signup_submit">로그인</button>
		 	</div>
		 </form>	
	</div>
</div>
</form>

	
			<!-- 
		

            <div class="input-box">
                <input id="user_id" type="text" name="user_id" placeholder="아이디">
                <label for="username">아이디</label>
            </div>

            <div class="input-box">
                <input id="user_pwd" type="password" name="user_pwd" placeholder="비밀번호">
                <label for="password">비밀번호</label>
            </div>
            
                <div id="forgot">
                <a href="join" class="btn-gradient green small"><input type="button" value="회원가입"></a><br>
                <a href="findid">아이디 찾기</a>
                <a href="findpwd">비밀번호 찾기</a>		</div>
                       
                
            
            <input type="submit" value="로그인">
			
		 -->

</body>
</html>