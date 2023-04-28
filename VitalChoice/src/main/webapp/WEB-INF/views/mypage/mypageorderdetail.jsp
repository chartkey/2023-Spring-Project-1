<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrapper{
width: 800px;
margin: 0 auto;
padding-bottom: 50px;
}
.order_title1{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.order_title{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.wrapper table{
width: 100%;
border-top: 2px solid black; border-bottom: 2px solid black; border-left-style: none; border-right-style: none;

}
.tbl_order_detail1 th{
padding: 5px 10px 5px 10px;
background-color: #EEEEEE;
}
.order_title{
font-size: 23px;
font-weight: 500;
float: left;
margin-top: 30px; margin-bottom: 10px;
}
#btn_rev{
      margin-top: 30px;
      width: 100%;
      height: 60px;
      border: 3px solid #009d00; border-radius: 30px;
      font-size: 22px; font-weight: 600;
      text-align: center;
      background-color: #E9EDC9;
   }
   .review_title{
      margin-bottom: 10px;
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
      height: 60px;
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
   #thumbimg_main{
   border: 1px solid #EEEEEE;
   }
   .review_td1{
   padding-left: 20px; padding-top: 0px;
   text-align: left; vertical-align: top;
   font-size: 18px; font-weight: 300;
   color: #AAAAAA;
   }
   .review_td2{
   padding-left: 20px; padding-top: 0;
   text-align: left; vertical-align: top;
   font-size:  23px; font-weight: 500;
   }
</style>
<script type="text/javascript">
$(function () {
   $(".btn_review").on("click", function(event) {  //팝업오픈 버튼 누르면
      $("#popup01").show();   //팝업 오픈
      $("body").append('<div class="backon"></div>'); //뒷배경 생성
      var prd_num = parseInt($(this).data('product-num'));
      console.log(prd_num);
      $.ajax({
         type: 'post',
         async: true,
         url: "reviewdb",
         data: {"prd_num": prd_num},
         dataType: 'json',
         success: function (result) {
            var htm="<table height='120px'>" 
            htm += "<tr style='height: 30px; padding-top: 0px;'>"
            htm += "<td rowspan='2'>"
            htm += "<img src='thumb_img/" + result['stored_file_name'] +"' height='120px' width='120px' id='thumbimg_main'>"
            htm += "<input type='hidden' name='product_num' value='"+prd_num+"'>"
            htm += "</td>"
            htm += "<td class='review_td1'>"
            htm+=  result['store_sname']
            htm += "</td>"
            htm += "</tr>"
            htm += "<tr style='height: 90px; padding-top: 0px;'>"
            htm += "<td  class='review_td2'>"
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
</head>
<body>
<div class="wrapper">
   <div class="order_title1">주문 상세내역 </div>

   <div class="order_title">상품정보 </div>
   <table class="tbl_order_detail1" border="1" align="center" style="width: 800px;">
      <tr>
         <th colspan="2" width="40%">상품명</th>
         <th>수량</th>
         <th>상품금액</th>
         <th>총금액</th>
         <th>리뷰작성</th>
      </tr>
      <c:set var="product_total" value="${0}"/>
      <c:forEach items="${orderdetailproduct}" var="orderdetailproduct"  varStatus="loop">
         <c:set var="product_total" value="${product_total + orderdetailproduct.product_totPrice}"/>
         <tr>
            <td><img src="thumb_img/${orderdetailproduct.product_num}_1" width="30px" height="30px"></td>
            <td>${orderdetailproduct.product_name}</td>
            <td>${orderdetailproduct.product_count}</td>
            <td>${orderdetailproduct.product_price}</td>
            <td>${orderdetailproduct.product_totPrice}</td>
            <td>
               <div class="openPopup">
                  <button class="btn_review" type="button" data-product-num="${orderdetailproduct.product_num}">리뷰쓰기</button>
               </div> 
            </td>
         </tr>
      </c:forEach>
      <tr style="border-top: 2px solid black;">
         <th colspan="4">배송비</th><td>+${orderdetaildto.delivery_fee}</td><td style="background-color: #EEEEEE; border-bottom:none;"></td>
      </tr>
      <tr>
         <th colspan="4">총상품금액</th><td>${product_total + orderdetaildto.delivery_fee}</td><td style="background-color: #EEEEEE;"></td>
      </tr>
   </table>
   <div class="order_title">할인정보</div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th colspan="3">등급할인</th><td>-${orderdetaildto.grade_sale}</td>
      </tr>
      <tr>
         <th>쿠폰할인률</th><th>쿠폰할인</th>
         <td>${orderdetaildto.discount_rate}%</td>
         <td>-${orderdetaildto.coupon_sale}</td>
      </tr>
      <tr>
         <th colspan="3">포인트</th><td>-${orderdetaildto.point}</td>
      </tr>
      <tr>
         <th colspan="3">최종결제금액</th><td>${orderdetaildto.total_payment}</td>
      </tr>
      <tr>
         <th colspan="3">포인트 적립</th><td>${orderdetaildto.grade_sale}</td>
      </tr>
   </table>
   <div class="order_title">결제정보 </div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th>결제방식</th><th>승인일시</th><th>결제금액</th>
      </tr>
      <tr>
         <td>카카오페이</td>
         <td>${orderdetaildto.delivery_date}</td>
         <td>${orderdetaildto.total_payment}</td>
      </tr>
   </table>
      <div class="order_title">배송정보 </div>

   <table  class="tbl_order_detail1" border="1" align="center">
      <tr>
         <th>이름</th><th>연락처</th><th>주소</th><th>배송요청사항</th><th>배송상태</th>
      </tr>
      <tr>
         <td>${orderdetaildto.delivery_name}</td>
         <td>${orderdetaildto.delivery_phone}</td>
         <td>
            ${orderdetaildto.delivery_address1}
            ${orderdetaildto.delivery_address2}
            ${orderdetaildto.delivery_address3}
         </td>
         <td>${orderdetaildto.delivery_request}</td>
         <td>
            <c:choose>
               <c:when test="${orderdetaildto.delivery_status == 0}">
                  배송대기중
               </c:when>
               <c:when test="${orderdetaildto.delivery_status == 1}">
                  배송완료
               </c:when>
            </c:choose>
         </td>
      </tr>
   </table>
</div>
<div id="popup01">
    <div class="close">CLOSE</div>
    <form action="reviewsave" method="post" enctype="multipart/form-data" name="form2">
       <div class="prd_review">
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
             <div>고객님의 정성스러운 리뷰를 바탕으로 더욱 더 좋은 제품과 서비스를 제공하겠습니다.</div>
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
             <div class="review_title" style="margin-top:30px;">사진 업로드(최대2장)</div>
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