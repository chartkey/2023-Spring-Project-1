<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

  <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="//code.jauery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta charset="UTF-8">
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <script type="text/javascript">
        function sample6_execDaumPostcode() {
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
                    if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== '' &&
                            /[동|로|가]$/g.test(data.bname)) {
                            extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== '' &&
                            data.apartment === 'Y') {
                            extraAddr += (extraAddr !== '' ? ', ' +
                                data.buildingName :
                                data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                        if (extraAddr !== '') {
                            extraAddr = ' (' + extraAddr + ')';
                        }
                        // 조합된 참고항목을 해당 필드에 넣는다.
                        document.getElementById("user_address4").value = extraAddr;

                    } else {
                        document.getElementById("user_address4").value = '';
                    }

                    // 우편번호와 주소 정보를 해당 필드에 넣는다.
                    document.getElementById('user_address1').value = data.zonecode;
                    document.getElementById('user_address2').value = addr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById('user_address3').focus();

                }
            }).open();
        }
    </script>
    <script type="text/javascript">
    $(function() {
        $("#check").click(function() {
            //패스워드 입력
            
            
            var pw = $("#user_pwd").val();
            var vpw = /^[a-zA-Z0-9?=.*\W]{8,15}$/;
            if (pw == "") {
                alert("비밀번호 항목은 필수 입력값입니다.");
                $("#user_pwd").focus();
                return;
            }
           
            if (!vpw.test(pw)) {
                alert("비밀번호는 띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자 또는 특수문자 조합으로 입력하셔야 합니다.");
                $("#user_pwd").focus();
                return;
            }
            //패스워드 재확인
            var pw2 = $("#user_pwd2").val();
            var vpw2 = /^[a-zA-Z0-9?=.*\W]{8,15}$/;
            if (pw2 == "") {
                alert("비밀번호를 입력하세요.");
                $("#user_pwd2").focus();
                return;
            }
            if (!vpw.test(pw2)) {
                alert("비밀번호는 띄어쓰기 없는 8~15자의 영문 대/소문자, 숫자 또는 특수문자 조합으로 입력하셔야 합니다.");
                $("#user_pwd2").focus();
                return;
            }
            if (pw != pw2) {
                alert("비밀번호가 다르니 다시 입력하세요");
                $("#user_pwd").val('');
                $("#user_pwd2").val('');
                $("#user_pwd").focus();
                return;
            }
     
            //주소입력
            var address = $("#user_address3").val();
            if (address == "") {
                alert("상세주소를 입력해주세요.");
                $("#user_address3").focus();
                return;
            }
            

            $("#form1").submit();
        });
});
    
    
    </script>
 
<title>Insert title here</title>
   <style type="text/css">
   body *{
      text-align: left;
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
      margin-top: 50px;
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
   .seller_input_form:disabled{
      background-color: #DDDDDD;
   }
   .user_gender_wrap{
      padding-left: 13px; padding-top: 7px;
      margin-top: 10px;
      width: 553px; height: 36px;
      background-color: #F6FFDE;
      border-width: 0.4px; border: none; border-radius: 5px;
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
      width: 160px;
      margin-right: 0;
   }
   label{
      font-family: 'Noto Sans KR', sans-serif;
      font-weight: 400; font-size: 15px;
   }
   .btn_address{
      height: 36px;
      border-radius: 5px;
      background-color: #005700;
      color: white;
      width: 120px;
      border-style: none;
      text-align: center;
   }
   .btn_seller_signup_submit{
      height: 36px;
      border-radius: 5px;
      background-color: #005700;
      color: white;
      text-align: center;
      width: 250px;   
      border-style: none;
      margin: 50px;
   }
   .emailform1{
      padding-left: 13px;
      margin-top: 10px;
      height: 36px; width: 290px; 
      border-radius: 5px;
      border-width: 0.4px;
      border: solid 1px gray;
   }
   .btn_email1{
      height: 36px; width: 128px;
      text-align: center;
      border-radius: 5px; border-style: none;
      background-color: #005700; color: white;
   }
   .successEmailChk{
      color: #FF6969;
   }
   #emailChk2{
      border: 1px solid #009d00; border-radius: 4px;
   }
   .user_gender{
      
   }
</style>
</head>
<body>
<div class="layout_join_wrap">
   <div class="layout_inner">
      <h2 class="seller_signup_title">회원정보수정</h2>
      <hr style="margin-top: 30px; margin-bottom: 50px;">
      
       <form id="form1" name="form1" action="save" method="post" >
           <div class="seller_signup_subtitle">고객 정보 입력</div>
          <div class="seller_form_group">
             <label for="user_id">아이디</label><br>
             <input class="seller_input_form" type="text" name="user_id" id="user_id" value="${dto1.user_id}"  readonly style="background:#EBEBE4">
          </div>
         <div class="seller_form_group">
             <label for="user_pwd">비밀번호</label><br>
             <input type="password" class="seller_input_form" name="user_pwd" id="user_pwd" size="30" placeholder="띄어쓰기 없이8~15 영문대/소문자 또는 특수문자" maxlength="15">
          </div>
         <div class="seller_form_group">
             <label for="user_pwd2" style="color: #005700;">비밀번호 재확인</label><br>
             <input type="password" class="seller_input_form" name="user_pwd2" id="user_pwd2" placeholder="비밀번호 재확인" maxlength="15">
          </div>
         <div class="seller_form_group">
             <label for="user_name">이름</label><br>
             <input type="text" class="seller_input_form" name="user_name" id="user_name" placeholder="이름을 입력하세요." maxlength="8" value="${dto1.user_name}" readonly   style="background:#EBEBE4" >
          </div>
          <div class="seller_form_group">
             <label for="user_nickname">닉네임</label><br>
             <input type="text" class="seller_input_form"  name="user_nickname" id="user_nickname" placeholder="닉네임을 입력하세요." maxlength="10" value="${dto1.user_nickname}" readonly  style="background:#EBEBE4"
             <input type="text" class="seller_input_form" name="user_nickname" id="user_nickname" placeholder="닉네임을 입력하세요." maxlength="10">
          </div>
           <div class="seller_form_group">
             <label for="user_phone">전화번호</label><br>
             <input type="text" class="seller_input_form" name="user_phone" id="user_phone" placeholder=" -없이 숫자만입력" maxlength="11" value="${dto1.user_phone}">
          </div>
         <div class="seller_form_group">
             <label for="business_address">주소</label><br>
             <input type="text" class="addressform1" name="user_address1" id="user_addrss1" placeholder="우편번호" readonly="readonly" value="${dto1.user_address1}" style="background:#EBEBE4" >
             <input type="button" class="btn_address" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
             <input type="text" class="seller_input_form" name="user_address2" id="user_address2" placeholder="주소 " readonly="readonly" value="${dto1.user_address2}" style="background:#EBEBE4" ><br>
            <div style="width: 100%;">
               <input type="text" class="addressform2" name="user_address3" id="user_address3" placeholder="상세주소 " value="${dto1.user_address3}" >
               <input type="text" class="addressform3" name="user_address4" id="user_address4" placeholder="참고항목 " readonly="readonly" style="background:#EBEBE4" >
            </div>
          </div>
         <div class="seller_form_group">
            <label for="useremail">이메일</label><br>
               
          </div> 
           <div class="seller_form_group">
                
             <label for="user_birthday">생년월일</label><br>
             <input type="text" class="seller_input_form" name="user_birthday" id="user_birthday" placeholder="ex) 19990415" maxlength="8" value="${fn:substring(fn:trim(dto1.user_birthday), 0, 4)}${fn:substring(fn:trim(dto1.user_birthday), 5, 7)}${fn:substring(fn:trim(dto1.user_birthday), 8,10)}" readonly style="background:#EBEBE4">
             
          </div>  
         <div class="seller_form_group">
             <label for="user_gender">성별</label><br>
             <div class="user_gender_wrap">
                <input type="radio" name="user_gender" class="user_gender" value="남자"  checked="${dto1.user_gender}">남자&emsp;
                  <input type="radio" name="user_gender" class="user_gender" value="여자" >여자&emsp;
                  <input type="radio" name="user_gender" class="user_gender" value="선택안함" >선택안함
               </div>
          </div> 

          <div class="seller_form_group">
             <label for="email_check">이메일 수신여부</label><br>
             <div class="user_gender_wrap">
                <input type="radio" name="email_check" class="email_check" value="Y"  checked="${dto1.email_check}" >수신&emsp;
                  <input type="radio" name="email_check" class="email_check" value="N" >비수신
               </div>
          </div>      
           <div style="text-align: center;">
           
              <button type="button" id="check"  class="btn_seller_signup_submit">수정</button>
          </div>
   
       </form>
    </div>
</div>  

</body>
</html>