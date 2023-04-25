<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#body {
	width: 100%;
}
    #visual {
    position: relative;
    height: 450px;
    max-width: 1920px;
    margin: 0 auto;
    overflow: hidden;
}

#visual > ul >li {
    position: absolute;
    top: 0px;
    left: 0px;
    display: none;
}

#visual > div {
    position: absolute;
    width: 100%;
    height: 25px;
    background: rgba(0, 157, 0, 0.8);
    bottom: 0px;
    z-index: 5;
}

#visual_section {
    position: absolute;
    bottom: 0px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 10;
}

#visual_section li {
    display: inline-block;
   /*  margin-right: 50px; */
}

#visual_section li a {
    display: block;
    padding: 2px 10px;
    color: white;
    background-color: rgba(0, 87, 0, 0.5);
    text-decoration: none;
    width: 250px;
    height: 25px;
}

#visual_section li.active a {
    background-color: rgba(0, 157, 0, 0);
    color: black;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var index = 0;
    $("#visual > ul > li").eq(index).show();
    $("#visual_section > ul > li").eq(index).addClass("active");
    var intervalId = setInterval(function() {
        // 이미지를 변경합니다.
        $("#visual > ul > li").eq(index).fadeOut(1000);
        index = (index + 1) % 5;
        $("#visual > ul > li").eq(index).fadeIn(1000);

        // 번호에 해당하는 텍스트 색상을 변경합니다.
        $("#visual_section > ul > li").removeClass("active");
        $("#visual_section > ul > li").eq(index).addClass("active");
    }, 5000);

    // li 태그를 클릭하면 해당 인덱스에 맞는 이미지를 보여줍니다.
    $("#visual_section > ul > li").click(function() {
        clearInterval(intervalId);

        var index = $(this).index();
        $("#visual > ul > li").fadeOut(1000);
        $("#visual > ul > li").eq(index).fadeIn(1000);
        $("#visual_section > ul > li").removeClass("active");
        $(this).addClass("active");

        intervalId = setInterval(function() {
            // 이미지를 변경합니다.
            $("#visual > ul > li").eq(index).fadeOut(1000);
            index = (index + 1) % 5;
            $("#visual > ul > li").eq(index).fadeIn(1000);

            // 번호에 해당하는 텍스트 색상을 변경합니다.
            $("#visual_section > ul > li").removeClass("active");
            $("#visual_section > ul > li").eq(index).addClass("active");
        }, 5000);
    });
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="visual">
        <ul>
	        <li><img src="resources/1.jpg" /></li>
	        <li><img src="resources/2.jpg" /></li>
	        <li><img src="resources/3.jpg" /></li>
	        <li><img src="resources/4.jpg" /></li>
	        <li><img src="resources/5.jpg" /></li>
    	</ul>
		<div id="visual_section">
		    <ul>
		        <li><a href="#">받고싶을때 바로받자!드론배송!</a></li>
		        <li><a href="#">자연의 힘, 건강기능식품</a></li>
		        <li><a href="#">내 몸의 건강은 내가 책임져야</a></li>
		        <li><a href="#">자연에서 온 건강</a></li>
		        <li><a href="#">건강한 삶의 시작</a></li>
		    </ul>
		</div>
	</div>
	<div id="brand_wrap">
	</div>
</body>
</html>