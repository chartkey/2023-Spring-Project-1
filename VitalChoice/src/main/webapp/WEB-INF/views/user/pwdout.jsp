<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
    $("#check").click(function() {
        //id검사
        var id = $("#user_id").val();
        var vid = /^[a-zA-Z0-9]{6,10}$/;
        if (id == "") {
            alert("아이디 입력이 잘못되었습니다.");
            $("#user_id").focus();
            return;
        }

        if (!vid.test(id)) {
            alert("아이디는 띄어쓰기 없이 영/숫자 6~10자!");
            $("#user_id").focus();
            return;
        }

        var email = $("#user_email").val();
        var emailChk = $("#emailDoubleChk").val();
        if (email == "") {
            alert("이메일 입력이 잘못되었습니다.");
            $("#user_email").focus();
            return;
        }

        if (emailChk !== "true") {
            alert("이메일 인증을 완료해주세요.");
            return;
        }

        $("#form1").submit();
    });

    var code = "error";
    $("#emailChk").click(function() {
        var userEmail = $("#user_email").val();
        if (userEmail) {
            $.ajax({
                type: "POST",
                url: "sendemail2",
                cashe: false,
                data: {
                    "user_email": userEmail
                },
                success: function(data) {
                    alert("인증번호가 전송되었습니다.");
                    if (data == "error") {
                        alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
                        $("#user_email").attr("autofocus", true);
                        $(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
                        $(".successEmailChk").css("color", "red");
                    } else {
                        alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
                        $("#user_email2").attr("disabled", false);
                        $("#emailChk2").css("display", "inline-block");
                        $(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
                        $(".successEmailChk").css("color", "green");
                        code = data;
                    }

                },
            });
        } else {
            alert("이메일 주소가 올바르지 않습니다.");
        }

    });
//이메일 인증번호 대조
$("#emailChk2").click(function() {
    if ($("#user_email2").val() == code) {
        $(".successEmailChk").text("인증번호가 일치합니다.");
        $(".successEmailChk").css("color", "green");
        $("#emailDoubleChk").val("true");
        $("#user_email2").attr("disabled", true);

    } else {
        $(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
        $(".successEmailChk").css("color", "red");
        $("#emailDoubleChk").val("false");
        $("#user_email2").attr("autofocus", true);
        return false;
    }
});
});

</script>
</head>
<body>
<form action="pwdout2" id="form1" name="form1" method="post"></form>
<table border="1" align="center">
       <tr class="email">
                <th>
                    <label for="useremail">이메일</label>
                </th>
                <td>

                    <input id="user_email" type="text" name="user_email" placeholder="이메일 주소를 입력해주세요." required />
                    <button type="button" id="emailChk">인증번호 보내기</button><br>
                    <input id="user_email2" type="text" name="user_email2" placeholder="인증번호 입력" disabled required />
                    <button type="button" id="emailChk2">이메일인증</button>
                    <span class="point successEmailChk">이메일 입력후 인증번호 보내기를 해주십시오.</span>
                    <input type="hidden" id="emailDoubleChk" />


                </td>
            </tr>
            <tr>
            
            <tr>
                <td colspan="2" align="center">
                    <button type="button" id="check">확인</button>
                    <input type="reset" value="취소"></td>
            </tr>
</table>
</body>
</html>