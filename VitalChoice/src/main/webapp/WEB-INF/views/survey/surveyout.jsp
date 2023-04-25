<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="suveysave">
	    <table border="1" align="center">
	        <tr>
	            <th>질문지</th>
	            <th>답변</th>
	        </tr>
	        <input type="hidden" name="user_id" value="${user_dto.user_id}">
	        <c:forEach items="${surveylist}" var="survey" varStatus="status">
	            <tr>
	                <td>
	                    ${survey.survey_bigo}
	                    <input type="hidden" name="survey[${status.index}].survey_num" value="${survey.survey_num}">
	                    <input type="hidden" name="survey[${status.index}].category_num" value="${survey.category_num}">
	                    <input type="hidden" name="survey[${status.index}].survey_age" value="${survey.survey_age}">
	                </td>
	                <td>
	                    <input type="radio" name="survey[${status.index}].survey_check" value="0">예
	                    <input type="radio" name="survey[${status.index}].survey_check" value="1">아니오
	                </td>
	            </tr>
	        </c:forEach>
	        <tr>
	            <td colspan="2">
	                <input type="submit" value="전송">
	            </td>
	        </tr>
	    </table>
	</form>
</body>
</html>