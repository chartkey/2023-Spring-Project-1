<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.order_title{
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
padding: 5px 10px 5px 10px;
background-color: #EEEEEE;
}
.order_title{
font-size: 23px;
font-weight: 500;
float: left;
margin-top: 30px; margin-bottom: 10px;
}
</style>
</head>
<body>
<div class="wrapper">
   <div class="order_title1">주문 상세내역 </div>

   <div class="order_title">상품정보 </div>
   <table class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th colspan="2">상품명</th>
         <th>수량</th>
         <th>상품금액</th>
         <th>총금액</th>
      </tr>
      <c:set var="product_total" value="${0}"/>
      <c:forEach items="${orderdetailproduct}" var="orderdetailproduct">
         <c:set var="product_total" value="${product_total + orderdetailproduct.product_totPrice}"/>
         <tr>
            <td><img src="thumb_img/${orderdetailproduct.product_num}_1" width="30px" height="30px"></td>
            <td>${orderdetailproduct.product_name}</td>
            <td>${orderdetailproduct.product_count}</td>
            <td>${orderdetailproduct.product_price}</td>
            <td>${orderdetailproduct.product_totPrice}</td>
            <td><a href="review?product_num=${orderdetailproduct.product_num}">리뷰쓰기</a></td>
         </tr>
      </c:forEach>
      <tr style="border-top: 2px solid black;">
         <th colspan="4">배송비</th><td>+${orderdetaildto.delivery_fee}</td>
      </tr>
      <tr>
         <th colspan="4">총상품금액</th><td>${product_total + orderdetaildto.delivery_fee}</td>
      </tr>
   </table>
   <div class="order_title">할인정보</div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th colspan="3">등급할인</th><td>-${orderdetaildto.grade_sale}</td>
      </tr>
      <tr>
         <th>쿠폰할인률</th><th>쿠폰할인</th>
         <td>${orderdetaildto.discount_rate}%</td>
         <td>-${orderdetaildto.coupon_sale}</td>
      </tr>
      <tr>
         <th colspan="3">포인트</th><td>-${orderdetaildto.point}</td>
      </tr>
      <tr>
         <th colspan="3">최종결제금액</th><td>${orderdetaildto.total_payment}</td>
      </tr>
      <tr>
         <th colspan="3">포인트 적립</th><td>${orderdetaildto.grade_sale}</td>
      </tr>
   </table>
   <div class="order_title">결제정보 </div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th>결제방식</th><th>승인일시</th><th>결제금액</th>
      </tr>
      <tr>
         <td>카카오페이</td>
         <td>${orderdetaildto.delivery_date}</td>
         <td>${orderdetaildto.total_payment}</td>
      </tr>
   </table>
      <div class="order_title">배송정보 </div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th>이름</th><th>연락처</th><th>주소</th><th>배송요청사항</th><th>배송상태</th>
      </tr>
      <tr>
         <td>${orderdetaildto.delivery_name}</td>
         <td>${orderdetaildto.delivery_phone}</td>
         <td>
            ${orderdetaildto.delivery_address1}
            ${orderdetaildto.delivery_address2}
            ${orderdetaildto.delivery_address3}
         </td>
         <td>${orderdetaildto.delivery_request}</td>
         <td>
            <c:choose>
               <c:when test="${orderdetaildto.delivery_status == 0}">
                  배송대기중
               </c:when>
               <c:when test="${orderdetaildto.delivery_status == 1}">
                  배송완료
               </c:when>
            </c:choose>
         </td>
      </tr>
   </table>
</div>
</body>
</html>