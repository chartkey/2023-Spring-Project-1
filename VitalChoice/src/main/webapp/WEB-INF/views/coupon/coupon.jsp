<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="resources/coupon.css">
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script>
        $(document).ready(function() {
            var today = new Date();
            var year = today.getFullYear();
            var month = today.getMonth() + 1;
            var day = today.getDate();
            if (month < 10) {
                month = "0" + month;
            }
            if (day < 10) {
                day = "0" + day;
            }
            var todayString = year + "" + month + "" + day;
            $("#date").val(todayString);
        });
    </script>
</head>
<body>
	<br><br><br>
    <input type="hidden" id="user_id" name="user_id" value="${user_dto.user_id}">
    <input type="hidden" id="date" name="date" value="<%=new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date())%>" />
    <div id="app" align="center"></div>
    <script src="resources/coupon.js"></script>
</body>
</html>