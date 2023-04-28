<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
		$(".li1").click(function () {
			//display: none 이면 false 반환
			if($(".li1_detail").is(':visible')){
				$(".li1_detail").hide();
			}else{
				$(".li1_detail").show();
				$(".li3_detail").hide();
				$(".li2_detail").hide();
			}
		});
		$(".li2").click(function () {
			//display: none 이면 false 반환
			if($(".li2_detail").is(':visible')){
				$(".li2_detail").hide();
			}else{
				$(".li2_detail").show();
				$(".li1_detail").hide();
				$(".li3_detail").hide();
			}
		});
		$(".li3").click(function () {
			//display: none 이면 false 반환
			if($(".li3_detail").is(':visible')){
				$(".li3_detail").hide();
			}else{
				$(".li3_detail").show();
				$(".li1_detail").hide();
				$(".li2_detail").hide();
			}
		});
	});
</script>
</head>
<header>
<div class="seller_main">
	<div class="seller_logo">
		<a href="backToHome"><img id = "seller_logo_img" src="resources/logo_h.png"></a>
		<span id = "seller_logo_text">판매자 센터</span>
	</div>
	<div class="seller_log_info">
		<span id="seller_name">${seller_log_id }님</span>
		<a href="sellerlogout"><button id="btn_seller_logout">로그아웃</button></a>
	</div>
</div>
</header>
<nav class="vertical_menu">
	<div class="vertical_store_info">
		<div class="seller_img_background">
			<img class="seller_img" src="resources/store.png">
		</div>
		<div style="height: 20px;"></div>
		<div class="seller_store_name">스토어명 : ${store_sname }</div>
	</div>
	<div style="height: 4px; width: 200px; margin-left: 25px; border-radius: 2px; background-color: white; 	margin-bottom: 50px;"></div>
	<ul>
		<li class="li1"><a href="#"><span style="float: left;">상품관리</span><span style="float: right;"><img src="resources/down-arrow.png" width="10" height="10"> </span></a></li>
		<div class="li1_detail" style="display: none;">
			<li class="li1_1" style=" background-color: #DDDDDD;"><a href="productinput">- 상품등록</a></li>
			<li class="li1_2" style=" background-color: #DDDDDD;"><a href="#">- 상품수정</a></li>
		</div>
		<div style="height: 1px; width: 230px; margin-left: 10px; background-color: white;"></div>
		<li class="li2"><a href="#"><span style="float: left;">주문관리</span><span style="float: right;"><img src="resources/down-arrow.png" width="10" height="10"> </span></a></li>
		<div class="li2_detail" style="display: none;">
			<li class="li2_1" style=" background-color: #DDDDDD;"><a href="checkorder">- 주문확인</a></li>
			<li class="li2_2" style=" background-color: #DDDDDD;"><a href="#">- 주문배송</a></li>
		</div>
		<div style="height: 1px; width: 230px; margin-left: 10px; background-color: white;"></div>
		<li class="li3"><a href="#"><span style="float: left;">문의관리</span><span style="float: right;"><img src="resources/down-arrow.png" width="10" height="10"> </span></a></li>
		<div class="li3_detail" style="display: none;">
			<li class="li3_1" style=" background-color: #DDDDDD;"><a href="#">- 리뷰확인</a></li>
			<li class="li3_2" style=" background-color: #DDDDDD;"><a href="qna_answer">- Q&A답변</a></li>
		</div>
	</ul>

</nav>
</html>