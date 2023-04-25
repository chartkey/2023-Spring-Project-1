<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		${user_dto.user_nickname}님 설문지 조사결과
	</h2>
	<table border="1" align="center">
		<tr>
			<th>정보</th>
			<c:choose>
				<c:when test="${surveydetail[0].survey_age == 10}">
					<td>
					성장기에 속한 나이로 균형 잡긴 영양 섭취가 필수이다.<br>
					신체발달과 골격이 성장하는 시기이며 성인 보다 칼슘 및 철분 섭취가 중요하다.<br>
					특별한 상황을 제외 대체로 건강하고 활동량도 많은 편이므로 <br>
					면역력 향상에 성장에 도움 되는 영양제를 추천한다.
					</td>
				</c:when>
				<c:when test="${surveydetail[0].survey_age == 20}">
					<td>
					에너지를 가장 많이 생상하지만 그만큼 많이 소모하는 시기이므로 피로회복에<br>
					많은 집중을 해야 한다.<br>
					30대 이후 노화가 시작되며 중년의 건강한 삶을 위해 건강한 생활 습관과 몸에<br>
					알맞은 영양제를 장기적으로 섭취해 각종 질병에 예방해야 한다.
					</td>
				</c:when>
				<c:when test="${surveydetail[0].survey_age == 40}">
					<td>
					본격적으로 노화가 시작되는 나이이며 호르몬 변화가 시작된다.<br>
					(갱년기)호르몬을 잘 잡아주는 영양제 섭취가 필요하다.<br>
					규칙적이고 건강한 생활 습관은 물론 주기적인 건강 검진을 통해<br>
					보다 정확한 진단이 필요하다.
					</td>
				</c:when>
					<c:when test="${surveydetail[0].survey_age == 60}">
					<td>
					노화에 의한 각종 심혈관 질환, 퇴행성 관절염 등등 다양한 질병에 걸릴 확률 매우 높다.<br>
					병이 발병되기 전 다양한 영양제와 건강한 생활 습관으로 관리가 필요하며<br>
					각종 질병에 쉽게 노출되는 나이인 만큼 보다 지속적인 신체 변화의 관심과 건강 검진이 이뤄줘야 한다.
					</td>
				</c:when>
				<c:otherwise>
					<td>정보 없음</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>발병 질병</th>
			<c:choose>
				<c:when test="${surveydetail[0].survey_age == 10}">
					<td>
					천식, 중이염, 면역력 저하, 소아 당뇨, 아토피, 소아비만, 변비
					</td>
				</c:when>
				<c:when test="${surveydetail[0].survey_age == 20}">
					<td>
					위암, 유방암, 당뇨, 심근경색, 뇌졸중, 자궁경부암, 우울증, 비염, 장염대상포진, 관절염
					</td>
				</c:when>
				<c:when test="${surveydetail[0].survey_age == 40}">
					<td>
					위암, 유방암, 당뇨, 심근경색, 뇌졸중, 자궁경부암, 우울증, 비염, 장염,<br>
					대상포진, 관절염, 심장마비, 동맥류, 담석, 어지럼증, 망막 분리증, 신장결석,<br>
					폐렴, 척추협착증, 통풍, 폐색전증
					</td>
				</c:when>
					<c:when test="${surveydetail[0].survey_age == 60}">
					<td>
					위암, 유방암, 당뇨, 심근경색, 뇌졸중, 암, 우울증, 비염, 장염,<br>
					대상포진, 관절염, 심장마비, 동맥류, 담석, 어지럼증, 망막 분리증,<br>
					신장결석, 폐렴, 척추협착증, 통풍, 폐색전증, 심근경색, 치매, 고혈압,<br>
					당뇨, 골다공증, 파킨슨병, 난청, 백내장, 천식, 폐결핵
					</td>
				</c:when>
				<c:otherwise>
					<td>정보 없음</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
	<br><br><br>
	<table border="1" align="center">
		<tr>
			<th>${user_dto.user_nickname}님의 결핍 영양소<br>(클릭시 해당 영양소 상품 이동)</th>
		</tr>
		<c:forEach items="${surveydetail}" var="surveydetails">
		<tr>
			<td><a href="viewListAll?catenum=${surveydetails.category_num}&nowPage=1&orderby=1">${surveydetails.category_detail}</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>