<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	#btn_rev{
		width: 100%;
		height: 30px;
		font-size: 22px;
		text-align: center;
		background-color: #E9EDC9; 
	}
	.review_title{
		
		font-size: 22px;
		font-weight: 400;
		text-align: left;
	}
	.content{
		width: 100%;
		height: 300px;
		border-radius: 20px;
		border-color: #E9EDC9;
		padding: 30px;
	}
	.reviewnotice{
		height: 100px;
		width: 100%;
		border-radius: 20px;
		background-color: #E9EDC9;
		padding: 20px;
	}
	.star{
		font-size: 35px;
		cursor: pointer;
		color: #EA5455;
	}
	.show_prd{
		height: 120px;
	}
	.prd_review{
		margin: 50px;
	}
	.reviewline{
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.reviewbold1{
		margin-top: 20px;
		font-size: 30px;
		font-weight: bold;
		text-align: left;
	}
	#popup01{
   		display: none;
		width: 1000px;
		height: 1200px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin: -250px 0 0 -500px;
		background-color: #fff;
		z-index: 2;
		border-radius: 20px;
	}
	.backon{
	    content: "";
	    width: 100%;
	    height: 100%;
	    background: #00000054;
	    position: fixed;
	    top: 0;
	    left: 0;
	    z-index: 1;
	}
	.close{
		position:absolute;
		top:-25px;
		right: 0;
		cursor:pointer;
	}
	
	.openPopup{
		cursor:pointer;
	}
</style>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="//code.jauery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code,jwuery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function () {
		$(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
			$("#popup01").show();   //팝업 오픈
			$("body").append('<div class="backon"></div>'); //뒷배경 생성
			var prd_num = parseInt($('#btn_review').val());
			$.ajax({
				type: 'post',
				async: true,
				url: "reviewdb",
				data: {"prd_num": prd_num},
				dataType: 'json',
				success: function (result) {
					var htm="<table>" 
					htm += "<tr>"
					htm += "<td rowspan='2'>"
					htm += "<img src='thumb_img/" + result['stored_file_name'] +"' height='120px' width='120px' id='thumbimg_main'>"
					htm += "</td>"
					htm += "<td height='30%'>"
					htm+=  result['store_sname']
					htm += "</td>"
					htm += "</tr>"
					htm += "<tr>"
					htm += "<td height='70%'>"
					htm+= result['product_name'] 
					htm += "</td>"
					htm += "</tr>"
					htm+= "</table>"
					$(".show_prd").html(htm);
				},
				error: function () {
					alert("전송error");
				}
			});
		});
			    
		$("body").on("click", function(event) { 
			if(event.target.className == 'close' || event.target.className == 'backon'){
				$("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
				$(".backon").hide();
			}
		});
		
		//별점리뷰
		$("#star1").click(function () {
			$("#star1").html("★").nextAll().html("★");
			$("#star1").nextAll().html("☆");
			$("#review_grade").val(1)
		});
		$("#star2").click(function () {
			$("#star1").html("★").nextAll().html("★");
			$("#star2").nextAll().html("☆");
			$("#review_grade").val(2)
		});

		$("#star3").click(function () {
			$("#star1").html("★").nextAll().html("★");
			$("#star3").nextAll().html("☆");
			$("#review_grade").val(3)
		});

		$("#star4").click(function () {
			$("#star1").html("★").nextAll().html("★");
			$("#star4").nextAll().html("☆");
			$("#review_grade").val(4)
		});

		$("#star5").click(function () {
			$("#star1").html("★").nextAll().html("★");
			$("#star5").nextAll().html("☆");
			$("#review_grade").val(5)
		});
		//리뷰등록
		$("#btn_rev").click(function () {
			alert("전송완료");
			$("form").submit();
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="openPopup">
	<c:set value="24" var="prd_num"/>
	<button id="btn_review" type="button" value="${prd_num}">리뷰쓰기</button>
</div>   
<div id="popup01">
    <div class="close">CLOSE</div>
    <form action="reviewsave" method="post" enctype="multipart/form-data" name="form2">
    	<div class="prd_review">
    		<input type="hidden" name="product_num" value="${prd_num }">
    		<div class="reviewbold1">리뷰 작성</div>
    		<div class="reviewline"><hr size="3"></div>
    		<div class="show_prd">
   				<!-- 스크립트에서 구현 -->
    		</div>
    		<div class="reviewline"><hr size="3"></div>
    		<div class="starreview" align="left">
				<span style="margin-right: 20px;" class="review_title">상품은 어떠셨나요?</span>
				<span id="star1" class="star">☆</span>
				<span id="star2" class="star">☆</span>
				<span id="star3" class="star">☆</span>
				<span id="star4" class="star">☆</span>
				<span id="star5" class="star">☆</span>
				<!-- 유효성검사 필요 -->
				<input type="hidden" value="0" name="review_grade" id="review_grade">			
    		</div>
    		<div class="reviewline"><hr size="3"></div>
    		<div class="reviewnotice">
    			<div class="review_title">포인트 지급 안내</div>
    			<div>정성스러운 후기를 작성해주신 모든 고객님께 100P 적립해드립니다.</div>
    		</div>
    		<div class="reviewline"><hr size="3"></div>
    		<div class="reviewcontent">
    			<div class="review_title">솔직한 상품 리뷰를 남겨주세요.</div>
    			<div class="write_box">
    				<textarea class="content" rows="" cols="" name="content"></textarea>
    			
    			</div>
    		</div>
    		<div class="reviewimage">
    			<div class="review_title"></div>
    			<div class="image_upload">
    				<input type="file" name="image1" id="image1">
    				<input type="file" name="image2" id="image2">
    			</div>
    		</div>
    		<div class="btn_rev_submit">
    			<button type="button" id="btn_rev">리뷰 등록하기</button>
    		</div>
    	</div>
    </form>
</div>
</body>
</html>