<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sendemail" method="post">
		<table border="1" align="center">
			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>