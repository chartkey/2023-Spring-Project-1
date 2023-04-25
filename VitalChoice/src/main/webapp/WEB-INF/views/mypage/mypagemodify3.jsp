<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<table border="1" align="center">
			<tr>
				<th>아이디</th>
				<td><input type="text" id="id" value="${dto.user_id}"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" id="pw" value="${dto.user_pwd}"></td>
			</tr>
			<tr>
				<th>주소1</th>
				<td><input type="text" id="id" value="${dto.user_address1}"></td>
			</tr>
			<tr>
				<th>주소2</th>
				<td><input type="text" id="id" value="${dto.user_address2}"></td>
			</tr>
			<tr>
				<th>주소3</th>
				<td><input type="text" id="id" value="${dto.user_address3}"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="정보수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>