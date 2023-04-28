<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>

    <style type="text/css">
       .total_body_wrap{
       width: 1200px;
       margin: 0 auto;
       }
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

        #visual>ul>li {
            position: absolute;
            top: 0px;
            left: 0px;
            display: none;
        }

        #visual>div {
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

        /*  */
        #brand_wrap {
            width: 1200px;
            margin: 0 auto;
        }
      #banner_wrap{
         width: 1200px;
            margin: 0 auto;
      }
        .list_header {
            height: 50px;
            margin-top: 80px; margin-bottom: 20px;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
        }

        .prd_sort_list {
            margin-top: 30px;
            height: 350px;
        }

        .prd_list_ul {
            padding: 0;
            margin: 0;
            height: 350px;
        }

        .prd_list_ul li {
            padding: 0;
            margin: 0;
            float: left;
            width: 300px;
            height: 350px;
            padding-left: 30px;
            padding-right: 30px;
        }

        .prd_list_like {
            color: #D14D72;
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }

        .prd_list_img img {
            height: 200px;
            width: 200px;
            margin-top: 10px;
        }

        .prd_list_strname {
            margin-top: 10px;
            font-size: 15px;
            color: #aaaaaa;
            font-weight: 300;
            text-align: left;
        }

        .prd_list_prdname {
            width: 260px;
            margin-top: 3px;
            font-size: 14px;
            height: 42px;
            font-weight: 500;
            text-align: left;
        }

        .prd_list_price {
            margin-top: 5px;
            color: #ED2B2A;
            font-size: 16px;
            font-weight: 500;
            text-align: left;
        }

        .prd_list_grade {
            float: left;
            margin-top: 3px;
            text-align: left;
        }

        .pageing {
            padding-top: 60px;
            margin-bottom: 50px;
            width: 100%;
        }

        .pageing a,
        .pageing strong {
            display: inline-block;
            width: 30px;
            height: 30px;
            margin: 0 2px;
            border: 1px solid #e5e5e5;
            color: #888;
            font-size: 14px;
            line-height: 28px;
            vertical-align: top;
            box-sizing: border-box;
            font-weight: 700;
        }

        .pageing .strong {
            border: 1px solid #666;
            color: #333;
            font-weight: 700;
        }

        .hasntresult {
            margin-top: 150px;
            font-size: 20px;
            font-weight: 500;
        }


.customer_service_info {
  margin-top: 30px;
  font-size: 16px;
}

.customer_service_info p {
  margin-bottom: 10px;
}

#customer_service_form {
  margin-top: 30px;
}

#customer_service_form label {
  display: block;
  margin-bottom: 10px;
}

#customer_service_form input,
#customer_service_form textarea {
  display: block;
  width: 100%;
  padding: 10px;
  margin-bottom: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 16px;
}

#customer_service_form textarea {
  height: 120px;
}

#customer_service_form button {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #00a0c6;
  color: #fff;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
}

#customer_service_form button:hover {
  background-color: #007f9b;
}
#customer_service_wrap {
  width: 1200px; height:200px;
}

.customer_service_info{
   float: left; text-align: left;
   padding-top: 20px; margin-top: 0px;
}
.customer_service_info p{
   font-size: 14px; color: #AAAAAA;
   
}
.customer_service_logo{
   float: left;
}
.vertical_line{
   float: left;
   background-color: #CCCCCC;
   height: 150px; width: 1px;
   margin: 20px 100px 0 100px;
}
.customer_service_logo img{
   margin-left: 100px; margin-top: 50px;
   height: 80px;
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
<div class="total_body_wrap">
    <div id="brand_wrap">
        <div class="list_header">
            AI 회원별 추천상품
        </div>
        <div class="prd_sort_list">
            <ul class="prd_list_ul">
                <c:forEach begin="0" end="${fn:length(list)-1}" var="i">
                    <li>
                        <a href="productout?product_num=${list[i].product_num }" style="display: inline-block; float: left;">
                            <div>
                                <div class="prd_list_img"><img src="thumb_img/${list[i].product_num}_1"></div>
                            </div>
                            <div>
                                <div class="prd_list_strname">${list[i].store_sname }</div>
                            </div>
                            <div>
                                <div class="prd_list_prdname">${list[i].product_name }</div>
                            </div>
                            <div class="prd_list_mid">
                                <div class="prd_list_price">
                                    <fmt:formatNumber value="${list[i].product_price}" pattern="###,###원" />
                                </div>
                            </div>
                            <div>
                                <div class="prd_list_grade">★${list[i].product_grade}</div>
                                <div class="prd_list_like">♥${list[i].product_like }</div>
                            </div>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div id="banner_wrap">
       <div class="list_header">
            이벤트
        </div>
        <br>
       <a href="survey">
          <img src="resources/배너1.png" width="1100px" height="110px">
       </a>
       <a href="couponcheck">
          <img src="resources/배너2.png" width="1100px" height="110px">
       </a>
    </div>
    <div class="list_header">
            고객센터
        </div>
   <div id="customer_service_wrap">
        <div class="customer_service_logo">
           <img src="resources/logo.png">
        </div>
        <div class="vertical_line"></div>
        <div class="customer_service_info">
          <p>고객센터 안내</p>
         <p>전화번호: 02-1234-5678 | 이메일: info@vitalchoice.com</p>
         <p>운영시간: 월 ~ 금 09:00~18:00</p>
         <p>호스팅사업자명 : (주)바이탈초이스 통신판매업신고 : 제2010-OOOO-1234</p>
         <p>부가통신사업신고 : OO349호 건강기능식품판매업 영업신고증 : 2001-0123456</p>
        </div>
   </div>
</div>
</body>
</html>