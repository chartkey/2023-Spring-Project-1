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
	.seller_signup_title{
		text-align: center;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 600;
		
	}
	.seller_signup_subtitle{
		text-align: left;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		font-size: 20px;
		margin-bottom: 25px;
	}
	.seller_form_group{
		margin-bottom: 30px;
	}
	.seller_input_form_phone{
		padding-left: 13px;
		margin-top: 10px;
		width: 160px;
		height: 36px;
		border-radius: 5px;
		border-width: 0.4px;
		border: solid 1px gray;
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
	.addressform1, .addressform2, .addressform3{
		padding-left: 13px;
		margin-top: 10px;
		height: 36px;
		border-radius: 5px;
		border-width: 0.4px;
		border: solid 1px gray;
	}
	.addressform2{
		width: 389px;
		
	}
	.addressform3{
		width: 140px;
		margin-right: 0;
	}
	label{
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 200;
	}
	.btn_address{
		height: 38px;
		border-radius: 5px;
		background-color: #005700;
		color: white;
		width: 100px;
		border-style: none;
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
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
		<h2 class="seller_signup_title">바이탈 초이스 판매자 회원가입</h2>
		<hr style="margin-top: 30px; margin-bottom: 50px;">
		<form action="sellersignupsave">
			<div class="seller_signup_subtitle">판매자 정보 입력</div>
		    <div class="seller_form_group">
		    	<label for="seller_id">아이디</label><br>
		    	<input type="text" class="seller_input_form" id="seller_id" placeholder="아이디를 입력하세요 (영어 대소문자, 숫자)" name="seller_id">
		    </div>
		    <div class="seller_form_group">
		    	<label for="seller_pw">패스워드</label><br>
		    	<input type="password" class="seller_input_form" id="seller_pw" placeholder="비밀번호를 입력하세요" name="seller_pw">
		    </div>
		    <div class="seller_form_group">
		    	<label for="pwd">이름</label><br>
		    	<input type="text" class="seller_input_form" id="pwd" placeholder="이름을 입력하세요" name="seller_name">
		    </div>
		    <div class="seller_form_group">
		    	<label for="seller_phone">전화번호</label><br>
		    	<div>
		    		<input type="text" class="seller_input_form_phone" id="seller_phone1" placeholder="010" name="seller_phone1"> -
		    		<input type="text" class="seller_input_form_phone" id="seller_phone2" placeholder="0000" name="seller_phone2"> -
		    		<input type="text" class="seller_input_form_phone" id="seller_phone3" placeholder="0000" name="seller_phone3">
		    	</div>
		    </div>
		    <div class="seller_form_group">
		    	<label for="seller_email">이메일</label><br>
		    	<input type="text" class="seller_input_form" id="seller_email" placeholder="이메일을 입력하세요 (ex. abc@vitalchoice.com)" name="seller_email">
		    </div>
		    <div class="seller_form_group">
		    	<label for="business_license">사업자번호</label><br>
		    	<input type="text" class="seller_input_form" id="business_license" placeholder="사업자 번호 10자리 (ex. 000-00-00000) " name="business_license">
		    </div>
		    <div class="seller_form_group">
		    	<label for="business_address">사업자주소</label><br>
		    	<input type="text" class="addressform1" id="postcode" placeholder="우편번호" name="postcode">
				<input type="button" class="btn_address" onclick="DaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" class="seller_input_form" id="address" placeholder="주소" name="address"><br>
				<div style="width: 100%;">
					<input type="text" class="addressform2" id="detailAddress" placeholder="상세주소" name="detailAddress">
					<input type="text" class="addressform3" id="extraAddress" placeholder="참고항목">
				</div>
		    </div>
		     <div class="seller_form_group">
		    	<label for="store_sname">스토어 이름</label><br>
		    	<input type="text" class="seller_input_form" id="store_sname" placeholder="소비자에게 보여질 브랜드 이름입니다." name="store_sname">
		    </div>
		    <div style="text-align: center;">
		 		<button type="submit" class="btn_seller_signup_submit">가입하기</button>
		 	</div>
		 </form>	
	</div>
</div>

</body>
</html>