<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700&display=swap');
#container {
	 font-family: 'Noto Sans KR', sans-serif;	
}
header {
	text-align: center;
	width: 1200px;
	margin: 0 auto;
}
nav {
	width: 100%;
	background-color: transparent;
	border-top: 1px solid #DDDDDD;
	border-bottom: 2px solid black;
	height: 50px;
}
#body {
text-align: center;
}
li{
list-style: none;
}
</style>
<meta charset="UTF-8">
<title><t:insertAttribute name="title"/></title>
</head>
<body>
	<div id="container">
		<div id="top">
			<t:insertAttribute name="top"/>
		</div>
		<div id="body">
			<t:insertAttribute name="body"/>
		</div>
		<div id="footer">
			<t:insertAttribute name="footer"/>
		</div>
	</div>
</body>
</html>