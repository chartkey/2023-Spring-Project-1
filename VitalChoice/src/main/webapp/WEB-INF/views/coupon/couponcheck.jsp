<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
<style type="text/css">
.order_wrap{
margin: 0 auto;
width: 600px;
position: relative;
}
.order_title{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.btn_coupon_start{
 position: absolute;
  top: 540px;
  left : 185px; 
  width: 232px; height: 88px;
  background-color: transparent;
  border-radius: 44px; border-color: transparent;
}
</style>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta charset="UTF-8">
    <c:choose>
        <c:when test="${param.result == 'couponissued'}">
            <script type="text/javascript">
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: '금일 쿠폰룰렛 이미 돌리셨습니다.',
                    showConfirmButton: false,
                    timer: 1500
                })
            </script>
        </c:when>
    </c:choose>
    <title>Insert title here</title>
    <script>
        $(document).ready(function() {
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1;
            var day = today.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            var todayString = year + "" + month + "" + day;
            $("#date").val(todayString);
        });
    </script>
</head>

<body>
<div class="order_wrap">
   <div class="order_title">룰렛돌리기</div>
   <hr>
    <form action="couponcheck2" method="post">
      <img src="resources/couponimg.jpg">
      <input type="hidden" name="user_id" value="${user_dto.user_id}">
      <input type="hidden" id="date" name="date" value="<%=new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date())%>" />
      <button type="submit" value="쿠폰돌리기" class="btn_coupon_start"></button>
    </form>
</div>
</body>

</html>