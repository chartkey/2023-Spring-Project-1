<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>고객님의 아이디 찾기가 완료 되었습니다.</h3>
	
	<table border="1" align="center" width="200">
	
		<tr>
			<th>아이디</th>
		</tr>
	
			<tr>
				<td>${user_dto.user_id}</td>
			</tr>

	</table>
</body>
</html>

