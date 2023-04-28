<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
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
	background: #eeeeee;
}
.tbl_show_order td{
	padding: 3px 10px 3px 10px;
	font-size: 14px;
	border: 1px solid black;
	
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="order_wrap">
	<div class="order_title">나의 구독내역 </div>
	<br>
	<table class="tbl_show_order" border="1" align="center" width="1200px">
	<tr>
		<th style=" border-left-style: none;">날짜</th>
		<th>상품정보</th>
		<th style="text-align: right;">가격</th>
		<th>정기배송일</th>
		<th>상태</th>
		<th style=" border-right-style: none;">상세보기</th>
	</tr>
	<c:forEach items="${subscribelist}" var="subscribelist">
	<tr>
		<td style=" border-left-style: none;">
			${fn:substring(subscribelist.delivery_date, 0, 10)}
		</td>
		<td>
			<c:choose>
			<c:when test="${subscribelist.total_cnt == 0}">
			${subscribelist.product_name}
			</c:when>
			<c:otherwise>
			${subscribelist.product_name} 외 ${subscribelist.total_cnt}종
			</c:otherwise>
		</c:choose>
		</td>
		<td style="text-align: right;">
			<fmt:formatNumber value="${subscribelist.total_payment}" pattern="#,##0 원"/>
			
		</td>
		<td>
			${subscribelist.subscribe_day}일
		</td>
		<td>
			<c:choose>
				<c:when test="${subscribelist.delivery_status == 0}">
					정기배송대기중
				</c:when>
				<c:when test="${subscribelist.delivery_status == 1}">
					정기배송완료
				</c:when>
			</c:choose>
		</td>
		<td  style=" border-right-style: none;">
			<a href="subscribedetail?subscribe_num=${subscribelist.subscribe_num}"><button>주문상세보기</button></a>
		</td>
	</tr>
	</c:forEach>
	</table>
</div>
</body>
</html>