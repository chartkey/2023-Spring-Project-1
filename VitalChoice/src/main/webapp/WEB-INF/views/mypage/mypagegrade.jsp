<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.order_wrap{
margin: 0 auto;
width: 800px;
}
.order_title{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 50px; margin-bottom: 25px;
}
.tbl_show_order_grade{
   border-collapse: collapse; border: 1px solid #EEEEEE;
   text-align: left;
   margin-bottom: 50px;
   padding-left: 50px; padding-right: 50px;
}
.tbl_show_order_grade th{
   padding: 10px 50px 10px 50px;
   height: 25px; width: 50%;
   font-size: 17px; font-weight: 600; color: white;
   border: none;
   background-color: #009d00;

}
.tbl_show_order_grade td{
   padding: 3px 50px 3px 50px;
   font-size: 14px; font-weight: 400;
   height: 50px; text-align: center;
   border: none;
}
.grade_span1{
   font-size: 13px; font-weight: 600;
}
.tbl_show_order{
   width: 800px;
   border-collapse: collapse;
   text-align: left;
   border-top: 3px solid black; border-bottom: 3px solid black; border-left-style: none; border-right-style: none;
   margin-bottom: 50px;
}
.tbl_show_order th{
   padding: 10px 10px 10px 10px;
   font-size: 15px;
   border: 1px solid black;
   border-bottom: 2px solid black;
   background-color: #EEEEEE;
}
.tbl_show_order td{
   padding: 3px 10px 3px 10px;
   font-size: 14px;
   border: 1px solid black;
}
</style>
</head>
<body>
<div class="order_wrap">
   <h2 class="order_title">회원 등급</h2>
   <table class="tbl_show_order_grade" border="1" align="center" width="800px">
      <tr>
         <th>
            <c:choose>
                 <c:when test="${user_dto.user_grade == 1}">
                     Bronze Choice
                 </c:when>
                 <c:when test="${user_dto.user_grade == 2}">
                     Silver Choice
                 </c:when>
                 <c:when test="${user_dto.user_grade == 3}">
                     Gold Choice
                 </c:when>
                 <c:when test="${user_dto.user_grade == 4}">
                     Platinum Choice
                 </c:when>
                 <c:otherwise>
                     등급 없음
                 </c:otherwise>
             </c:choose>
             ${user_dto.user_name}님 반갑습니다.
         </th>
         <th style="text-align: right;">
            닉네임 '${user_dto.user_nickname}'
         </th>
      </tr>
      <tr>      
         <td><span class="grade_span1">누적 구매 금액</span>&ensp; <fmt:formatNumber value="${user_dto.user_totpurchase}" pattern="###,###원"/> </td>
         <td><span class="grade_span1">보유 적립금</span>&ensp; <fmt:formatNumber value="${user_dto.user_point}" pattern="###,###p"/></td>
      </tr>
   </table>
   <h2 class="order_title">보유 쿠폰</h2>
   <table class="tbl_show_order" border="1" align="center">
      <tr>
         <th style="border-left-style: none;">쿠폰번호</th><th>할인률</th><th style="border-right-style: none;">유효기한</th>
      </tr>
      <c:forEach items="${couponlist}" var="couponlist">
      <tr>
         <td style="border-left-style: none;">${couponlist.coupon_num}</td>
         <td>${couponlist.discount_rate}% 쿠폰</td>
         <td style="border-right-style: none;">${couponlist.issue_date}</td>
      </tr>
      </c:forEach>
   </table>
</div>
</body>
</html>