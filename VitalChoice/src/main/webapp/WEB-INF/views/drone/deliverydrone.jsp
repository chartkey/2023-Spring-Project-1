<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.order_wrap{
margin: 0 auto;
width: 1200px;
}
.order_title{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.tbl_show_order{
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
   <div class="order_title">드론배송</div>
   <table class="tbl_show_order" border="1" align="center" width="1200px">
   <tr>
      <th style="width: 150px; border-left-style: none;">날짜</th>
      <th style="width: 600px;">상품정보</th>
      <th style="width: 100px; text-align: right;">결제금액</th>
      <th style="width: 100px;">상태</th>
      <th style="width: 150px; border-right-style: none;">주문상세보기</th>
      <th style="width: 100px; border-right-style: none;">드론배송</th>
   </tr>
   <c:forEach items="${deliverydrone}" var="deliverydrone">
   <tr>
      <td style="border-left-style: none;">
         ${fn:substring(deliverydrone.delivery_date, 0, 10)}   
      </td>
      <td>
         ${deliverydrone.product_name}
      </td>
      <td style="text-align: right;">
         <fmt:formatNumber value="${deliverydrone.product_price}" pattern="#,##0 원"/>
      </td>
      <td>
         <c:choose>
            <c:when test="${deliverydrone.delivery_status == 0}">
               상품준비중
            </c:when>
            <c:when test="${deliverydrone.delivery_status == 1}">
               배송대기중
            </c:when>
            <c:when test="${deliverydrone.delivery_status == 2}">
               배송완료
            </c:when>
         </c:choose>
      </td>
      <td>
         <a href="orderdetail?order_num=${deliverydrone.order_num}"><button>주문상세보기</button></a>
      </td>
      <td style="border-right-style: none;">
         <a href="dronemap2?delivery_address2=${deliverydrone.delivery_address2}&order_num=${deliverydrone.order_num}&product_num=${deliverydrone.product_num}"><button>배송시작</button></a>
      </td>
   </tr>
   </c:forEach>
   </table>
</div>
</body>
</html>