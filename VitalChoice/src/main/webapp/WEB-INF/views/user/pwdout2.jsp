<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">




</script>
</head>
<body>
	<h3>고객님의 비밀번호 찾기가 완료 되었습니다.</h3>
	<br>
	<table border="1" align="center" width="200">
	     
		<tr>
			<th>비밀번호</th>
		</tr>
	
			<tr>
				<td>${user_dto.user_pwd}</td>
			</tr>
			<tr>
			<td>
        <a href="login"><input type="button" value="로그인"></a><br>
</td></tr>
	</table>
</body>
</html>

