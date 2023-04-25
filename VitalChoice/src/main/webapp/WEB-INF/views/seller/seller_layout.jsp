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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap');
#container {
	 font-family: 'Noto Sans KR', sans-serif;	
}
#top{
	background-color: red;
	position: fixed;
	top: 0;
	width: 100%;
	height: 50px;
	padding-bottom: 50px;
	z-index: 1;
}
header {
	position: fixed;
  	top: 0;
  	width: 100%;
  	
}
#body {
	padding-top: 50px;
	margin-left: 250px;
	position: relative;
}
#footer {
	position:fixed;
	bottom:0px;
	width: 100%;
	text-align: center;
	font-size: 20px;
	line-height: 30px;
	height: 30px;
	background-color: #2C3639;
	color:white;
}
.seller_main{
	width: 100%;
	height: 50px;
	padding: 15px;
	background-color: #2C3639;
}

.seller_logo{
	height: 20px;
	width: 600px;
	position: relative;
	line-height: 20px;
	float: left;
	
}
#seller_logo_img{
	height: 100%;
	margin-right: 15px;
	position:absolute;
	bottom: 0px;
}
#seller_logo_text{
	font-size: 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 300;
	color: white;
	position:absolute;
	left: 200px;
	bottom: 0px;
}
.seller_log_info{
	height: 20px;
	float: right;
	width: 600px;
	line-height: 20px;
	position: relative;
}
#seller_name{
	color: white;
	font-size: 13px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 200;
	position:absolute;
	right: 90px;
	bottom: 0px;
}
#btn_seller_logout{
	line-height: 20px;
	display: flex;
	align-items:center;
	justify-content: center; 
	height: 20px;
	width: 80px;
	font-size: 8px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: 100;
	position:absolute;
	right: 0px;
	bottom: 0px;
	border-radius: 10px;
	background-color: transparent;
	border-color: white;
	color: white;	
}
nav{
	top: 50px;
	width: 250px;
	background-color: #eee;
	border-right: 1px solid #ddd;
	position:fixed;
	height:100%;
}
ul{
	list-style: none;
	padding-left: 0;
	background-color: #eee;
}
.vertical_menu li{
}
.vertical_menu li a{
	height: 50px;
	line-height: 50px;
	display: block;
	padding: 0px 20px;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 500;
	color: #555;
}
.vertical_menu li a:hover{
	background-color: yellowgreen;
	color: white;
}
.vertical_store_info{
	margin-top: 40px;
	width:100%;
	height: 200px;
	text-align: center;
}
.seller_img{
	width: 70px;
	height: 70px;
	margin: auto;
}
.seller_store_name{
	display: inline-block;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 15px;
	font-weight: 700;
}
.seller_img_background{
	background-color: white; 
	width: 100px; 
	height: 100px; 
	border-radius: 50px; 
	border-color: transparent; 
	display: inline-block;
	text-align: center;
	vertical-align: middle;
	padding-top: 10px;
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