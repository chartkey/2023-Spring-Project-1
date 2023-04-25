<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.Layout_seller_body{
		margin: 40px;
	}
	.subtitle{
		font-size: 30px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 600;
		margin-bottom: 20px;
	}
	.inputarea{
		width: 100%;
		border: 2px solid #EEEEEE;
		background-color: #F8F8F8;
		margin-top: 10px;
		padding: 15px;
	}
	.subtitle_subtitle{
		font-size: 15px;
		font-family: 'Noto Sans KR', sans-serif;
		font-weight: 400;
		margin-bottom: 9px;
	}
	
</style>
<script type="text/javascript">
	$(function() {
		var c1=['멀티비타민', '비타민B', '비타민C', '비타민D', '기타 비타민'];
		var c2=['장건강', '간건강', '위건강', '눈건강', '관절/뼈/치아', '면역', '혈행', '오메가3'];
		var c3=['여성건강', '갱년기', '임산부'];
		var c4=['남성건강'];
		var c5=['슬리밍', '프로틴'];
		var c6=['피부케어', '모발/기타 이너뷰티케어'];
		var c7=['베이비/키즈'];
		var c8=['홍삼', '프로폴리스', '기타'];
		$('#category1').change(function() {
			var sel = $(this).val();
			if(sel == '비타민'){
				$('.op').remove();
				$.each(c1, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '영양제'){
				$('.op').remove();
				$.each(c2, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '여성'){
				$('.op').remove();
				$.each(c3, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '남성'){
				$('.op').remove();
				$.each(c4, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '체중관리'){
				$('.op').remove();
				$.each(c5, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '이너뷰티'){
				$('.op').remove();
				$.each(c6, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '베이비/키즈'){
				$('.op').remove();
				$.each(c7, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else if(sel == '기타'){
				
				$('.op').remove();
				$.each(c8, function(i, item) {
					$('#category2').append('<option class="op">'+item+'</option>');
				});
			}else{
				$('.op').remove();
			}
		});
		var tcnt = 2;
		$("#thumb_file").click(function() {
			if(tcnt<=3){
				$("#t_file").append("<br>"+"<input  type='file' name='tfile"+tcnt+"' id='tfile"+tcnt+"' />");
				tcnt++;
			}
			
		});
		
		
		var dcnt = 1;
		$("#detail_file").click(function() {
			if(dcnt<=10){
				$("#d_file").append("<br>"+"<input  type='file' name='dfile"+dcnt+"' />");
				dcnt++;
			}
		});
	});
</script>
</head>
<body>
<div class="Layout_seller_body">
	<form action="productinputsave" method="post" enctype="multipart/form-data" name="form1">
	<div class="subtitle">상품등록</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			카테고리 선택
		</div>
		<select id="category1" name="category1">
			<option value="0" selected="selected">대분류 선택</option>
			<option value="비타민">비타민</option>
			<option value="영양제">영양제</option>
			<option value="여성">여성</option>
			<option value="남성">남성</option>
			<option value="체중관리">체중관리</option>
			<option value="이너뷰티">이너뷰티</option>
			<option value="베이비/키즈">베이비/키즈</option>
			<option value="기타">기타</option>
		</select>
		>
		중분류 : 
		<select id="category2" name="category2">
			<option value="">중분류를 선택하세요.</option>
		</select>
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			상품명
		</div>
			<input type="text" name="product_name">
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			상품설명(간략히 성분 등.)
		</div>
			<input type="text" name="product_desc">
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			가격
		</div>
			<input type="text" name="product_price">원
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">	
			대표사진(최대3장)(1000px * 1000px 권장)
		</div>
		<div class='select_timg'>썸네일이미지<br><img src='' />
		<br>
		<span align="center"><input  type='file' name='tfile1' id='tfile1'></span>
		</div>
		<input type="button" value="사진추가" id="thumb_file">
		<div id="t_file" align="center">
		<!-- 스크립트에서 사진 여러개 받아오기위한 부분 -->
		
		</div>
		<script type="text/javascript">
			$("#tfile1").change(function(){
		  		if(this.files && this.files[0]) {
			    	var reader = new FileReader;
			    	reader.onload = function(data) {
			     		$(".select_timg img").attr("src", data.target.result).width(70);        
			    	}
			    	reader.readAsDataURL(this.files[0]);
		   		}
			});
		</script>
	</div>
	<div class="inputarea">	
		<div class="subtitle_subtitle">
			상세페이지(최대10장)(가로 860px 권장)
		</div>
		<input type="button" value="사진추가" id="detail_file">
		<div id="d_file" align="center">
		<!-- 스크립트에서 사진 여러개 받아오기위한 부분 -->
		</div>
	</div>
	<div></div>
	<div class="inputarea">	
		<div class="subtitle_subtitle">
			재고
		</div>
			<input type="text" name="product_stock">
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			원산지
		</div>
			<input type="text" name="product_origin">
	</div>
	<div class="inputarea">
		<div class="subtitle_subtitle">
			유통기한
		</div>
			<input type="text" name="product_exp">
	</div>
			<input type="submit" value="상품등록">
	
	</form>
</div>
</body>
</html>