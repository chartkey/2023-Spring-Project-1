<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<c:set value="${param.result }" var="result"/>
<c:choose>
	<c:when test="${result=='loginfail' }">
		<script type="text/javascript">
			alert("Id 혹은 PW가 잘못되었습니다.");
		</script>
	</c:when>
	<c:when test="${result=='logout' }">
		<script type="text/javascript">
			alert("로그아웃되었습니다!");
		</script>
	</c:when>
	<c:when test="${result=='nologin' }">
		<script type="text/javascript">
			alert("로그인 후 이용 가능합니다!");
		</script>
	</c:when>
</c:choose>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	Header .top_util {
	    position: relative;
	    width: 100%;
	    height: 30px;
	    letter-spacing: -.005em;	
	}
	Header .top_util .menu_list {
    	overflow: hidden;
    	position: absolute;
    	top: 0;
    	right: 0;
	}
	Header .top_util .menu_list>li {
	    float: left;
	    padding: 0 9px 0 10px;
	    line-height: 30px;
	    white-space: nowrap;
	}
	a{
		color: #2C3333; 
	}
	a:hover{
		text-decoration: none;
		color: #2C3333;
	}
	a:active{
		text-decoration: none;
		color: #2C3333;
	}
	a:visited {
		text-decoration: none;
		color: #2C3333;
	}
	.top_header{
		position: relative;
		height: 100px;
		margin-bottom: 30px;
	}
	.top_header .top_logo{
		text-align: left;
		float: left;
		bottom: 0;
		position: absolute;
	}
	.top_header .top_logo .top_logo_line{
		margin-bottom: 8px;
		font-size: 17px;
	}
	.top_header .top_search_box{
		float: right;
		height: 50px;
		width: 400px;
		border-radius: 25px;
		border: thick;
		border-color: #009d00;
		border-style: solid;
		bottom: 0;
		position: absolute;
		right: 0;
	}
	.top_search_box .top_search_input{
		float: left;
		margin-left: 15px;
		height: 100%;
		line-height: 50px;
	}
	.top_search_box .top_search_input input{
		position: absolute;
		top:0;
		height: 100%;
		width: 300px;
		border-style: none;
		background: transparent;
	}
	.top_search_box .top_search_input input:focus{
		outline: none;
	}
	.top_search_box .top_search_img{
		float: right;
		height: 40px;
		width: 40px;
		margin-right: 15px;
	}
	.top_search_box .top_search_img img{
		width: 35px; height: 35px;
		margin-top: 2.5px; 
	}
	.nav_whole_container{
		margin: 0 auto;
		width: 1200px;
		height: 100%;
		padding-left: 0;
	}
	.nav_container{
		height: 100%;
		width: 100%;
		margin-left: 0;
	    padding-left: 0;
	    margin-bottom: 0;
	    padding-bottom: 0;
	}
	.nav_container li {
		font-weight: 600;
	    float: left;
	    padding: 10px 40px 10px 25px;
	    
	    white-space: nowrap;
	    font-size: 19px;
	}
	.nav_item a:hover{
		color: #FF8787;
	}
	.category_menu_img{
		width: 15px;
		display: inline-block;
	}
	.nav_container .show_category{
		float: left;
		height: 100%;
		width: 180px;
		padding: 0 auto;
		border-left : 1px solid #DDDDDD;
		border-right : 1px solid #DDDDDD;
		margin-right: 50px;
		cursor: pointer;
	}
	.nav_container .show_category img{
		margin-right: 10px;
		margin-bottom: 7px;
	}
	 #popup_category{
	 	
   		display: none;
		width: 1200px;
		height: 450px;
		position: relative;
		
		background-color: #fff;
		z-index: 2;
		border: 3px solid black;
	}
	
	.btn_close_popcategory{
		position:absolute;
		bottom:2px;
		right: 4px;
		font-size: 30px;
		font-weight: 700;
		cursor:pointer;
	}
	table{
		width: 100%;
		height: 95%;
	}
	td, th{
		font-size: 19px;
		width: 25%;
		border-left: 1px solid #EEEEEE;
	}
	th{
		padding-left: 20px;
		font-size: 20px;
		font-weight: 600;
	}
	td{
		padding-left: 23px;
		color: #4B5D67;
	}
</style>
<script type="text/javascript">
	$(function () {
		$(".show_category").click(function () {
			if($("#popup_category").is(':visible')){
				$("#popup_category").hide(); 
				$(".show_category").css('background-color', 'transparent');
			}else{
				$("#popup_category").show();   //팝업 오픈
				$(".show_category").css('background-color', '#A3DA8D');
			}
		});
		$(".btn_close_popcategory").click(function () {
			$("#popup_category").hide(); //X버튼 클릭시 팝업 down
			$(".show_category").css('background-color', 'transparent');
		});
	});
</script>
</head>
<header>
<!-- 로그인 X  -->
<div class="top_util">
	<ul class="menu_list" id="menu_list_header">
		<li class="signup"><a href="#">회원가입</a></li>
		<li class="login"><a href="#">로그인</a></li>
		<li class="cart"><a href="javascript:common.link.moveCartPage();" data-attr="공통^헤더^장바구니">장바구니<span id="cartToCnt">(5)</span></a></li>
	</ul>
</div>
<!-- 로그인 O  -->

<div class="top_header">
	<div class="top_logo">
		<a href="/web/"><img src="resources/logo_h2.png" height="75"></a>
	</div>
	<div class="top_search_box">
		<li class="top_search_input"><input type="text" name="keyword_searching" placeholder="제품 이름을 검색해보세요."></li>
		<li class="top_search_img"><img src="resources/magnifier.png"></li>
	</div>
</div>

</header>
<nav>
	<div class="nav_whole_container">
		<ul class="nav_container">
			<li class="show_category">
				<img src="resources/menu.png" class="category_menu_img"> 카테고리
			</li>
			<li class="nav_item"><a href="viewListAll?catenum=0&nowPage=1&orderby=1">전체상품보기</a></li>
			<li class="nav_item"><a href="#">설문</a></li>
			<li class="nav_item"><a href="#">AI진단</a></li>
			<li class="nav_item"><a href="#">행운의룰렛</a></li>
		</ul>
		<!-- 모달 팝업으로 카테고리 구현 -->
		<div id="popup_category">
			<table>
				<tr>
					<th>비타민 ></th><th>영양제 ></th><th>여성 ></th><th>이너뷰티 ></th>
				</tr>
				<tr>
					<td><a href="viewListAll?catenum=1&nowPage=1&orderby=1">멀티비타민</a></td><td><a href="viewListAll?catenum=6&nowPage=1&orderby=1">장건강</a></td><td><a href="viewListAll?catenum=14&nowPage=1&orderby=1">여성건강</a></td><td><a href="viewListAll?catenum=20&nowPage=1&orderby=1">피부케어</a></td>
				</tr>
				<tr>
					<td><a href="viewListAll?catenum=2&nowPage=1&orderby=1">비타민B</a></td><td><a href="viewListAll?catenum=7&nowPage=1&orderby=1">간겅강</a></td><td><a href="viewListAll?catenum=15&nowPage=1&orderby=1">갱년기</a></td><td><a href="viewListAll?catenum=21&nowPage=1&orderby=1">모발/기타</a></td>
				</tr>
				<tr>
					<td><a href="viewListAll?catenum=3&nowPage=1&orderby=1">비타민C</a></td><td><a href="viewListAll?catenum=8&nowPage=1&orderby=1">위건강</a></td><td><a href="viewListAll?catenum=16&nowPage=1&orderby=1">임산부</a></td><th>베이비/키즈 ></th>
				</tr>
				<tr>
					<td><a href="viewListAll?catenum=4&nowPage=1&orderby=1">비타민D</a></td><td><a href="viewListAll?catenum=9&nowPage=1&orderby=1">눈건강</a></td><th>남성 ></th><td><a href="viewListAll?catenum=22&nowPage=1&orderby=1">베이비/키즈</a></td>
				</tr>
				<tr>
					<td><a href="viewListAll?catenum=5&nowPage=1&orderby=1">기타비타민</a></td><td><a href="viewListAll?catenum=10&nowPage=1&orderby=1">관절/뼈/치아</a></td><td><a href="viewListAll?catenum=17&nowPage=1&orderby=1">남성건강</a></td><th>기타 ></th>
				</tr>
				<tr>
					<td></td><td><a href="viewListAll?catenum=11&nowPage=1&orderby=1">면역</a></td><th>체중관리 ></th><td><a href="viewListAll?catenum=23&nowPage=1&orderby=1">홍삼</a></td>
				</tr>
				<tr>
					<td></td><td><a href="viewListAll?catenum=12&nowPage=1&orderby=1">혈행</a></td><td><a href="viewListAll?catenum=18&nowPage=1&orderby=1">슬리밍</a></td><td><a href="viewListAll?catenum=24&nowPage=1&orderby=1">프로폴리스</a></td>
				</tr>
				<tr>
					<td></td><td><a href="viewListAll?catenum=13&nowPage=1&orderby=1">오메가3</a></td><td><a href="viewListAll?catenum=19&nowPage=1&orderby=1">프로틴</a></td><td><a href="viewListAll?catenum=25&nowPage=1&orderby=1">기타</a></td>
				</tr>
			</table>
			<div class="btn_close_popcategory">X</div>
		</div>
	</div>
	
</nav>
</html>