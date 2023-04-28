<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.wrapper{
width: 800px;
margin: 0 auto;
padding-bottom: 50px;
}
.order_title1{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.wrapper table{
width: 100%;
border-top: 2px solid black; border-bottom: 2px solid black; border-left-style: none; border-right-style: none;
}
.tbl_order_detail1 th{
background-color: #EEEEEE;
padding: 5px 10px 5px 10px;

}
.order_title{
font-size: 23px;
font-weight: 500;
float: left;
margin-top: 30px; margin-bottom: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper">
   <div class="order_title1">정기배송 상세내역 </div>
   <div class="order_title">배송날짜</div>
   <table class="tbl_order_detail1"  border="1" align="center">
      <tr>
         <th>정기배송일</th>
      </tr>
      <tr>
         <td>매 월 ${subscribedetaildto.subscribe_day}일</td>
      </tr>
   </table>
   <div class="order_title">상품정보 </div>
   <table class="tbl_order_detail1"  border="1" align="center">
      <tr>
         <th colspan="2">상품명</th>
         <th>수량</th>
         <th>상품금액</th>
         <th>총금액</th>
      </tr>
      <c:set var="product_total" value="${0}"/>
      <c:forEach items="${subscribedetailproduct}" var="subscribedetailproduct">
         <c:set var="product_total" value="${product_total + subscribedetailproduct.product_totPrice}"/>
         <tr>
            <td><img src="thumb_img/${subscribedetailproduct.product_num}_1" width="30px" height="30px"></td>
            <td>${subscribedetailproduct.product_name}</td>
            <td>${subscribedetailproduct.product_count}</td>
            <td>${subscribedetailproduct.product_price}</td>
            <td>${subscribedetailproduct.product_totPrice}</td>
         </tr>
      </c:forEach>
      <tr>
         <th colspan="4">배송비</th><td>+${subscribedetaildto.delivery_fee}</td>
      </tr>
      <tr>
         <th colspan="4">총상품금액</th><td>${product_total + subscribedetaildto.delivery_fee}</td>
      </tr>
   </table>
   <div class="order_title">할인내역 </div>
   <table class="tbl_order_detail1"  border="1" align="center">
      <tr>
         <th colspan="3">등급할인</th><td>-${subscribedetaildto.grade_sale}</td>
      </tr>
      <tr>
         <th>쿠폰할인률</th><th>쿠폰할인</th>
         <td>${subscribedetaildto.discount_rate}%</td>
         <td>-${subscribedetaildto.coupon_sale}</td>
      </tr>
      <tr>
         <th colspan="3">포인트</th><td>-${subscribedetaildto.point}</td>
      </tr>
      <tr>
         <th colspan="3">최종결제금액</th><td>${subscribedetaildto.total_payment}</td>
      </tr>
      <tr>
         <th colspan="3">포인트 적립</th><td>${subscribedetaildto.grade_sale}</td>
      </tr>
   </table>
   <div class="order_title">결제정보 </div>
   <table class="tbl_order_detail1"  border="1" align="center">
      <tr>
         <th>결제방식</th><th>승인일시</th><th>결제금액</th>
      </tr>
      <tr>
         <td>카카오페이</td>
         <td>${subscribedetaildto.delivery_date}</td>
         <td>${subscribedetaildto.total_payment}</td>
      </tr>
   </table>
   <div class="order_title">정기배송정보 </div>
   <table class="tbl_order_detail1"  border="1" align="center">
      <tr>
         <th>이름</th><th>연락처</th><th>주소</th><th>배송요청사항</th><th>배송상태</th>
      </tr>
      <tr>
         <td>${subscribedetaildto.delivery_name}</td>
         <td>${subscribedetaildto.delivery_phone}</td>
         <td>
            ${subscribedetaildto.delivery_address1}
            ${subscribedetaildto.delivery_address2}
            ${subscribedetaildto.delivery_address3}
         </td>
         <td>${subscribedetaildto.delivery_request}</td>
         <td>
            <c:choose>
               <c:when test="${subscribedetaildto.delivery_status == 0}">
                  정기배송대기중
               </c:when>
               <c:when test="${subscribedetaildto.delivery_status == 1}">
                  정기배송완료
               </c:when>
            </c:choose>
         </td>
      </tr>
   </table>
</div>
</body>
</html>