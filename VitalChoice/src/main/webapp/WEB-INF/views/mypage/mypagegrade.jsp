<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
  border-collapse: collapse;
  width: 60%;
  margin: auto;
}

th, td {
  text-align: center;
  padding: 8px;
}

th {
  color:#ffffff;
  background-color: #009d00;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}
</style>
</head>
<body>
	<h2 align="center">회원 등급</h2>
	<table border="1" align="center">
		<tr>
			<th>이름</th><th>닉네임</th><th>등급</th><th>총구매액</th><th>포인트</th>
		</tr>
		<tr>
			<td>${user_dto.user_name}</td>
			<td>${user_dto.user_nickname}</td>
			<td>
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
			</td>
			<td>${user_dto.user_totpurchase}</td>
			<td>${user_dto.user_point}</td>
		</tr>
	</table>
	<h2 align="center">보유 쿠폰</h2>
	<table border="1" align="center">
		<tr>
			<th>쿠폰번호</th><th>할인률</th><th>유효기한</th>
		</tr>
		<c:forEach items="${couponlist}" var="couponlist">
		<tr>
			<td>${couponlist.coupon_num}</td>
			<td>${couponlist.discount_rate}% 쿠폰</td>
			<td>${couponlist.issue_date}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>