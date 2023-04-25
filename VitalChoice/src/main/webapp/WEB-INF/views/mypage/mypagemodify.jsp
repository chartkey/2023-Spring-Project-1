<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="UTF-8">
<c:choose>
	<c:when test="${param.result == 'pwfail'}">
		<script type="text/javascript">
		Swal.fire({
			position: 'center',
			icon: 'error',
			title: '비밀번호가 일치하지않음',
			showConfirmButton: false,
			timer: 1500
		})
		</script>
	</c:when>
</c:choose>
<title>Insert title here</title>
</head>
<body>
	${user_dto.user_id}님의 비밀번호를 재확인 필요합니다.
	<form action="MyPagemodify2" method="post">
		<table border="1" align="center">
			<input type="hidden" name="id" value="${user_dto.user_id}">
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pw"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="비밀번호확인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>