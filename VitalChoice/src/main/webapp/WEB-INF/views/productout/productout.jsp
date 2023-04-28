<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
   
   .answer_display{
      background-color: #EEEEEE;
      display: none;
      margin-top: 20px;
      padding: 25px 130px 30px 130px;
      text-align: left;
   }
   .png_qna img{
        width: 25px;
        height: 25px;
        margin-bottom: 15px; 
    }
   .qna_content_box{
      white-space: no-wrap;
      overflow: hidden;
      text-overflow: ellipsis;
   }
   .qna_display{
      margin-bottom: 1px;
      display: none;
      background-color: #EEEEEE;
   }
   .qna_user_id{
      float: right;
      text-align: right;
      margin-right: 30px;
      color: #797979;
   }
   .qna_date{
      float: right;
      text-align: right;
      color: #797979;
   }
   .qna_yesorno{
      float: left;
      height: 30px;
      width: 70px;
      border-radius: 15px;
      font-size: 12px;
      color: white;
      background-color: #D8D8D8;
      border-style: none;
      line-height: 30px;
      font-weight: 600;
   }
   .qna_list{
      padding-left: 40px;
      padding-right: 40px;
      width: 100%;
      line-height: 30px;
      height: 30px;
   }
   .title_info_product{
      margin-top: 40px;
      text-align: left;
      font-size: 22px;
      margin-bottom: 10px;
   }
   .tbl_info_product{
      width: 100%;
   }
   .info_th{
      width: 25%;
      text-align: left;
      padding-left: 15px;
   }
   .info_td{
      width: 75%;
      text-align: left;
      padding-left: 15px;
   }
   .qna_content{
      float: left;
      text-align: left;
      padding-left: 25px;
      width:700px;
         overflow:hidden;
         text-overflow:ellipsis;
         white-space:nowrap;
         display:inline-block;
         cursor: pointer;
   }
   .btn_writeqna{
      height: 40px;
      width: 150px;
      font-size: 18px;
      border-radius: 10px;
      color: white;
      font-weight: 500;
      padding-top: 3px;
      padding-bottom: 5px;
      border-style: none;
      background-color: #A3DA8D;
   }
   #btn_qna{
      height: 40px;
      width: 200px;
      font-size: 18px;
      border-radius: 10px;
      background-color: #9DC08B;
   }
   .show_prd{
      margin-top: 30px;
      margin-bottom: 20px;
      text-align: left;
      font-size: 15px;
   }
   .content{
      width: 100%;
      height: 150px;
      border-radius: 20px;
      border-color: #E9EDC9;
      padding: 30px;
      font-size: 15px;
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
   .qna_box{
      margin: 50px;
   }
   .reviewimage{
      width: 120px;
      height: 120px;
      margin-right: 10px;
   }
   .view_review_content{
      margin-top: 20px;
      font-size: 16px;
   }
   .review_box .review_box_left{
      text-align: left;
      float: left;
      width: 25%;
      font-size: 20px;
      
   }
   .review_box .review_box_right{
      text-align: left;
      float: right;
      width: 75%;
      
   }
   .review_box{
      margin: 20px;
      width: 100%;
      border-radius:30px;
      padding: 40px; 
      background-color: #ECF2FF;
      height: auto;
      overflow: hidden;
   }
   .show_star_right{
      float: left;
      margin-left: 10px;
   }
   #show_per_star_left{
      float: left;
      margin-left: 100px;
   }
   .progress-bar {
      border-radius: 5px;
      margin-left: 20px;
       width: 200px;
       height: 15px;
       background-color: #ECF2FF;
       float: left;
       font-weight: 600;
       font-size: .8rem;
   }
   
   .progress-bar .progress {  
       height: 15px;
       padding: 0;
       text-align: center;
       background-color: #37306B;
       color: #111;
   }
   .show_star{
      color: #EA5455;
   }
   .review_upside{
        width: 100%;
        height: 230px;
    }
    .rev_up_left {
       padding-top: 50px;
        width: 50%;
        float: left;
        box-sizing: border-box;
        text-align: center;
        vertical-align: middle;
    }
    .rev_up_right {
       padding-top: 50px;
        width: 50%;
        float: right;
        box-sizing: border-box;
        text-align: center;
        vertical-align: middle;
    }
    #popup01{
         display: none;
      width: 1000px;
      height: 450px;
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -500px 0 0 -500px;
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
   .product_detail{
      height: 380px;
   }
   .wrap_top{
      width: 1200px;
      margin: 0 auto;
      height: 35px;
   }
   .backToList{
      float:left;
      margin-top: 5px; margin-bottom: 5px;
   }
   .backToList a{
      color: #AAAAAA;
   }
   .product_category{
      float:right;
      text-align: right;
      color: #AAAAAA;
      margin-top: 5px; margin-bottom: 5px;
   }
   .prd_de_sname{
      font-size: 20px; color: gray;
      width: 500px;
   }
   .prd_de_prdname{
      font-size: 33px;
      width: 500px;
   }
   .prd_de_desc{
      margin-top: 20px;
      font-size: 15px; color: #2a2831; width: 500px;
   }
   .prd_de_price{
      text-align: right; padding-right: 5px; font-size: 28px; color: #4776b4; font-weight: 600;
   }
   .prd_de_totprice{
      text-align: right; padding-right: 5px; font-size: 28px; color: #4776b4; float: right; font-weight: 700;
   }
   #cnt_minus, #cnt_plus{
      height: 25px; width: 25px;
      margin-top: 18.5px;
   }
   .prd_de_line_totp{
      text-align: left; padding-left: 5px; font-size: 25px; color: #4776b4; float: left; font-weight: 500;
   }
   .product_totalprice{
      margin-bottom: 50px;
   }
   .btn_like{
      height: 65px; width: 65px;
      margin-left: 0;
      font-size: 35px; font-weight: 500;
      background-color: transparent;
      border-style: none;
   }
   .btn_like2{
      height: 65px; width: 65px;
      margin-left: 0;
      font-size: 35px; font-weight: 500; color: red;
      background-color: transparent;
      border-style: none;
   }
   .btn_gocart{
       height: 65px; width: 220px;
       margin-left: 0; padding-top:0; margin-top:0;
       font-size: 20px; font-weight: 500;
       float: right;
      background-color: transparent;
      color: black;
      border-radius: 10px;
      border-color: #F8F5F1;



   }
   .btn_gopayment{
       height: 65px;  width: 220px;
       margin-left: 0; padding-top:0; margin-left: 10px;
       font-size: 20px; font-weight: 500;
       float: right;
      background-color: #009d00;
      color: #F8F5F1;
      border-radius: 10px;
      border-color: #009d00;
   }
   .order_btn{
      height: 65px;
   }
   .num_like{
      font-size: 10px;
   }
   .subscription_btn{
      margin-top: 15px;
   }
   #btn_subscribe{
      float: right;
       height: 65px; width: 450px;
       margin-left: 0;
      font-size: 20px; font-weight: 500;
      background-color: transparent;
      color: black;
      border-radius: 10px;
      border-color: #009d00;
   }
   #thumb_img_list{
      margin-top: 10px; 
      text-align: left;
   }
   #thumb_img_list img{
      border: 1px solid #EEEEEE;
   }
</style>
<script>

$(function() {
   // 마우스 오버할때 다른 이미지 보이기
   $(".thumbimg_list").hover(function(){ 
      $("#thumbimg_main").attr("src", $(this).attr('src')); 
   });
   
   // 상품수량 '-' 클릭
   var totalprice = "<c:out value='${productdto.product_price}'/>"; 
   $("#cnt_minus").click(function () {
      var cnt = parseInt($("#productcnt").attr('value'));
      if(cnt>1){
         $("#productcnt").attr('value', cnt-1);
         $("#productcnt").val(cnt-1);
         $("#totalprice").html(totalprice*(cnt-1)+ ' 원');
      }
   });
   // 상품수량 '+' 클릭
   $("#cnt_plus").click(function () {
      var cnt = parseInt($("#productcnt").attr('value'));
      if(cnt<999){
         $("#productcnt").val(cnt+1);
         $("#productcnt").attr('value', cnt+1);
         $("#totalprice").html(totalprice*(cnt+1)+ ' 원');
      }
   });
   // 수량이 변하면 총 금액도 변하는 
   $("#productcnt").keyup(function () {
      var cnt = parseInt($(this).val());
      $(this).attr('value', cnt);
      $("#totalprice").html(totalprice*cnt + ' 원');
   });
   
   //qna팝업
   $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
      $("#popup01").show();   //팝업 오픈
      $("body").append('<div class="backon"></div>'); //뒷배경 생성
   });
          
   $("body").on("click", function(event) { 
      if(event.target.className == 'close' || event.target.className == 'backon'){
         $("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
         $(".backon").hide();
      }
   });
   $("#btn_qna").click(function () {
      alert("전송완료!");
      $("#qnaform").submit();
   });
   //장바구니 이동
   $("#go_cart").click(function () {
         var cnt = parseInt($("#productcnt").attr('value'));
         $("<form/>", {action: "gocart", method: "get"})
         .append($("<input/>", {type: "hidden", name: "product_num", value: "${productdto.product_num}"}))
         .append($("<input/>", {type: "hidden", name: "user_id", value: "${user_dto.user_id}"}))
         .append($("<input/>", {type: "hidden", name: "product_count", value: cnt}))
         .appendTo("body")
         .submit();
    });
   
   //qna 비동기 페이징처리.. 하다가 실패.. 나중에 다시 해야지..
   //qna에서 내용 클릭 시 답변 보이기
   $(".qna_whole_box").click(function () {
      var rnum = $(this).attr("rnum");
      var i = $(this).index()+1;
      console.log(i);
      if($('.qna_whole_box:nth-child('+i+') > .answer_display').is(':visible')){
         $('.qna_whole_box:nth-child('+i+') > .answer_display').hide();
      }else{
         $('.qna_whole_box > .answer_display').hide();
         $('.qna_whole_box:nth-child('+i+') > .answer_display').show();
      }
      $.ajax({
         type: "post",
         async:true,
         url: "getanswer",
         data: {"rnum": rnum}, // 보내는 이름 : 보내는 데이터
         success: function(res) {
            console.log(res);
            $(".ajax_answer").html(res);
         },
         error: function() {
            alert("전송실패!!")
         }
      });
   });
   
   //좋아요 기능
   $("#btn_like").click(function () {
      <%HttpSession hs = request.getSession();%>
      var loginstate = '<%=(boolean)hs.getAttribute("login")%>';
      if(loginstate=='false'){
         alert("해당 기능은 로그인 후 이용 가능합니다");
         return false;
      }
   });
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrap_top">
   <div class="backToList">
      <a href="#">〓 목록으로 돌아가기</a>
   </div>
   <div class="product_category">
       ${categorydto.category_main }&ensp;>&ensp;${categorydto.category_detail }
   </div>
</div>
<div class="container-fluid" style="width: 1200px;">
  <div class="row"> 
    <div class="col-sm-6" align="right" style="width: 600px; padding-left: 0px;">
       <div class="product">
         <!-- 상품이미지 -->
         <div id="thumb_img" style="width: 600px; text-align: left;">
            <div id="thumb_img_first" style="text-align: left; ">
               <img src="thumb_img/${thumblist[0].stored_file_name }" height="600" width="600" id="thumbimg_main">
            </div>
            <!-- 마우스 오버시 다른사진도 크게 볼 수 있게. -->
            <div id="thumb_img_list">
               <c:forEach begin="0" end="${fn:length(thumblist)-1 }" step="1" var="i">
               
                  <img src="thumb_img/${thumblist[i].stored_file_name }" height="120" width="120" class="thumbimg_list">
               </c:forEach>
            </div>
            <!-- 사진 밑에 고객 리뷰 별점 -->
            <div class="review_star" style="margin-top: 25px; font-size: 25px">
               <c:set value="${productdto.product_grade }" var="grade"/>
               <span style="text-align: left; padding-left: 30px;">고객 리뷰</span>
               <c:choose>
                  <c:when test="${grade>=0.5&&grade<1.5 }">
                     <span class=show_star>★☆☆☆☆ ${grade}</span><span>(${review_cnt})</span>
                  </c:when>
                  <c:when test="${grade>=1.5&&grade<2.5 }">
                     <span class=show_star>★★☆☆☆ ${grade}</span><span>(${review_cnt})</span>
                  </c:when>
                  <c:when test="${grade>=2.5&&grade<3.5 }">
                     <span class=show_star>★★★☆☆ ${grade}</span><span>(${review_cnt})</span>
                  </c:when>
                  <c:when test="${grade>=3.5&&grade<4.5 }">
                     <span class=show_star>★★★★☆ ${grade}</span><span>(${review_cnt})</span>
                  </c:when>
                  <c:when test="${grade>=4.5}">
                     <span class=show_star>★★★★★ ${grade}</span><span>(${review_cnt})</span>
                  </c:when>
                  <c:otherwise>
                     <span>☆☆☆☆☆ ${grade}</span><span><!-- 리뷰 개수가 들어가야 한다. 리뷰 테이블 만들고 다시 넣자. --></span>
                  </c:otherwise>
               </c:choose>
            </div>
         </div>
      </div>
    </div>
    <div class="col-sm-6" style=" width: 600px; padding-right: 0px;">
       <div class="product">
          <div class="product_info" style="padding-left: 30px; text-align: left;">
             <br>
             <br>
             <div class="product_detail">
                <div class="prd_de_sname">${store_sname }</div>
                <div class="prd_de_prdname">${productdto.product_name }</div>
                <div class="prd_de_price" style="font-size: 22px; "><fmt:formatNumber value="${productdto.product_price}" pattern="###,###원"/></div>
                <div class="prd_de_desc">${productdto.product_desc }</div>
             </div>
             <div class="product_order">
                <form action="productorder" method="post" >
                <div class="product_cnt" style="height: 60px; border: 1px solid #e9e9e9; background: #f9f9f9; border-radius: 5px; ">
                   <div style="height: 60px; float: left; padding-left: 10px; margin-top: 18.5px;">구매수량</div>
                   <div style="height: 60px; float: right; padding-right: 10px; margin-top: 0px; padding-top: 0px;">
                      <button type="button" id="cnt_minus" >-</button>
                      <input type="text" value="1" id="productcnt" size=1 maxlength=3 style="text-align: center; height: 25px; margin-top:18.5px;">
                      <button type="button" id="cnt_plus" value="+">+</button>
                   </div>
                </div>
               <br>
                <div class="product_totalprice">
                   <span class="prd_de_line_totp">상품금액 합계</span>
                   <span class="prd_de_totprice" id="totalprice"><fmt:formatNumber value="${productdto.product_price}" pattern="###,###원"/></span>
                   
                </div>
                <!-- 장바구니, 결제 버튼 -->
                <div class="order_btn" style="margin-top: 50px;">
                   <c:choose>
                   <c:when test="${login!=true }">
                      <button type="button" class="btn_like" id="btn_like">♡</button>
                   </c:when>
                   <c:otherwise>
                      <c:choose>
                         <c:when test="${like_yn==0 }">
                            <a href="btnLikeNo?product_num=${product_num }"><button type="button" class="btn_like" id="btn_like">♡</button></a><span class="num_like">${like_cnt }</span>
                         </c:when>
                         <c:otherwise>
                            <a href="btnLikeYes?product_num=${product_num }"><button type="button" class="btn_like2" id="btn_like">♥</button></a><span class="num_like">${like_cnt }</span>
                         </c:otherwise>
                      </c:choose>
                   </c:otherwise>
                   </c:choose>
                   <button type="button" class="btn_gopayment" id="go_payment">바로구매</button>
                   <button type="button" class="btn_gocart" id="go_cart">장바구니</button>
                   
                </div>
                <!-- 구독버튼 -->
                <div class="subscription_btn">
                   <button type="button" id="btn_subscribe">구독하기</button>
                </div>
                </form>
             </div>
          </div>
       </div>
    </div>
  </div>
  <div class="row">
     <div class="col-sm-12">
        <div style="height: 50px;"></div>
        <ul class="nav nav-tabs">
        <li class="active" style="float: left; width: 25%;"><a data-toggle="tab" href="#menu1">상품설명</a></li>
        <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu2">판매정보</a></li>
        <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu3">리뷰(${review_cnt })</a></li>
        <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu4">Q&A(${replycnt})</a></li>
      </ul>
      
      <div class="tab-content">
         <div id="menu1" class="tab-pane fade in active">
            <c:forEach items="${detaillist}" var="dl">
                 <img src="detail_img/${dl.stored_file_name }" width="1000">
              </c:forEach>
         </div>
         <div id="menu2" class="tab-pane fade">
              <div class="info_product">
                 <div class="title_info_product">상품정보 제공고시</div>
                 <table class="tbl_info_product">
                    <tr class="info_tr">
                       <th class="info_th">
                          제품명
                       </th>
                       <td class="info_td">
                          ${productdto.product_name }
                       </td>
                    </tr>
                    <tr class="info_tr">
                       <th class="info_th">
                          원산지
                       </th>
                       <td class="info_td">
                          ${productdto.product_origin }
                       </td>
                    </tr>
                    <tr class="info_tr">
                       <th class="info_th">
                          유통기한
                       </th>
                       <td class="info_td">
                          ${productdto.product_exp }
                       </td>
                    </tr>
                 </table>
              </div>
              <div class="info_product">
                 <div class="title_info_product">판매자 정보</div>
                 <table class="tbl_info_product">
                    <tr class="info_tr">
                       <th class="info_th">
                          판매자
                       </th>
                       <td class="info_td">
                          ${sellerdto.seller_name }
                       </td>
                    </tr>
                    <tr class="info_tr">
                       <th class="info_th">
                          사업자등록번호
                       </th>
                       <td class="info_td">
                          ${sellerdto.business_license}
                       </td>
                    </tr>
                    <tr class="info_tr">
                       <th class="info_th">
                          사업장주소
                       </th>
                       <td class="info_td">
                          ${sellerdto.business_address}
                       </td>
                    </tr>
                    <tr class="info_tr">
                       <th class="info_th">
                          판매자 전화번호
                       </th>
                       <td class="info_td">
                          ${sellerdto.seller_phone}
                       </td>
                    </tr>
                    
                    
                 </table>
              </div>
         </div>
         <div id="menu3" class="tab-pane fade">
              <div class="review_upside">
                 <div class="rev_up_left">
                    <div class=show_star style="font-size: 50px;">★ ${grade}</div>
                    <div>${review_cnt}명의 고객님이 리뷰를 남겼습니다.</div>
                 </div>
                 <div class="rev_up_right">
                    <c:forEach begin="1" end="5" step="1" var="i">
                       <div class="show_per_star">
                          <div class="show_star" id="show_per_star_left">★${i }</div>
                       
                          <div class="progress-bar">           
                             <c:choose>
                             <c:when test="${review_cnt!=0 }">
                                 <div class="progress" style="width: ${rev_per_cnt[i]/review_cnt*100}%;"> </div>
                              </c:when>
                              <c:otherwise>
                                 <div class="progress" style="width: 0%;"> </div>
                              </c:otherwise>
                              </c:choose>
                        </div>
                        <div class="show_star_right">(${rev_per_cnt[i] })</div>
                       </div>
                       <br>
                    </c:forEach>
                    
                 </div>
              </div>
              <div class="review_downside">
                 <c:choose>
                 <c:when test="${fn:length(reviewlist)>0}">
                 <c:forEach begin="0" end="${fn:length(reviewlist) -1}" var="i">
                 <div class="review_box">
                    <div class="review_box_left">
                       <div class="review_id">
                          ${reviewlist[i].user_id }
                       </div>
                    </div>
                    <div class="review_box_right">
                       <div class="staranddate">
                          <c:choose>
                           <c:when test="${reviewlist[i].review_grade==1}">
                              <span class=show_star>★☆☆☆☆ ${reviewlist[i].review_grade}</span>
                           </c:when>
                           <c:when test="${reviewlist[i].review_grade==2}">
                              <span class=show_star>★★☆☆☆ ${reviewlist[i].review_grade}</span>
                           </c:when>
                           <c:when test="${reviewlist[i].review_grade==3}">
                              <span class=show_star>★★★☆☆ ${reviewlist[i].review_grade}</span>
                           </c:when>
                           <c:when test="${reviewlist[i].review_grade==4}">
                              <span class=show_star>★★★★☆ ${reviewlist[i].review_grade}</span>
                           </c:when>
                           <c:when test="${reviewlist[i].review_grade==5}">
                              <span class=show_star>★★★★★ ${reviewlist[i].review_grade}</span>
                           </c:when>
                        </c:choose>
                        <span style="margin-left: 20px;">${reviewlist[i].reporting_date}</span>
                       </div>
                       <div class="view_review_content">
                          ${reviewlist[i].content}
                       </div>
                       
                       <div class="view_review_image">
                          <c:if test="${reviewlist[i].stored_img_file1 !=null }">
                             <img class="reviewimage" src="review_img/${reviewlist[i].stored_img_file1 }">
                          </c:if>
                          <c:if test="${reviewlist[i].stored_img_file2 !=null }">
                             <img class="reviewimage" src="review_img/${reviewlist[i].stored_img_file2 }">
                          </c:if>
                       </div>
                       
                    </div>
                 </div>
                 </c:forEach>
                 </c:when>
                 <c:otherwise>
                    <div>등록된 리뷰가 없습니다.</div>
                 </c:otherwise>
                 </c:choose>
              </div>
         </div>
         <div id="menu4" class="tab-pane fade">
            <!-- qna등록 부분 -->
             <div class="openPopup" style="margin-top: 30px; text-align: right;">
               <button type="button" class="btn_writeqna">상품문의</button>
            </div>   
            <div id="popup01">
                <div class="close">CLOSE</div>
                <form action="qnasave" method="post" enctype="multipart/form-data" name="qnaform" id="qnaform">
                   <div class="qna_box">
                      <input type="hidden" name="product_num" value="${productdto.product_num}">
                      <div class="reviewbold1">상품 Q&A 작성</div>
                      <div class="reviewline"><hr size="3"></div>
                      <div class="show_prd">
                           [${store_sname }]${productdto.product_name}
                      </div>
                
                      <div class="qna_content_box">
                         <div class="write_box">
                            <textarea class="content" rows="" cols="" name="content" placeholder="제품에 관련된 질문을 등록해주세요."></textarea>
                         </div>
                      </div>
                      <div class="reviewline"><hr size="3"></div>
                      <div class="btn_qna_submit">
                         <button type="button" id="btn_qna">질문 등록하기</button>
                      </div>
                   </div>
                </form>
            </div>
            <div style="height: 40px;"></div>
            <!-- qna 확인 게시판부분 -->
            
            
            <div class="qna_lists">
            <c:choose>
               <c:when test="${fn:length(replylist)>0}">
                  <div class="qnaline"><hr></div>
                  <c:forEach begin="0" end="${fn:length(replylist)-1}" step="1" var="i">
                  <div class="qna_whole_box" rnum="${replylist[i].reply_number}">
                     <div class="qna_list">
                        <c:choose>
                           <c:when test="${replylist[i].reply_yn==0 }">
                              <div class="qna_yesorno">답변대기</div>
                           </c:when>
                           <c:otherwise>
                              <div class="qna_yesorno" style="background-color: #A3DA8D;">답변완료</div>
                           </c:otherwise>
                        </c:choose>
                        <div class="qna_content" rnum="${replylist[i].content}">${replylist[i].content}</div>
                        <div class="qna_date">${fn:substring(replylist[i].reporting_date ,0,10) }</div>
                        <div class="qna_user_id">${replylist[i].user_id}</div>
                     </div>
                     
                     <div class="answer_display">
                        <div class="png_qna">
                            <img src="resources/letter-q.png"> 
                        </div>
                        <div>${replylist[i].content}</div>
                        <c:if test="${replylist[i].reply_yn==1 }">
                           <div class="qnaline" style="margin-top: 13px; margin-bottom: 13px; color: white;"><hr></div>
                           <div class="png_qna">
                               <img src="resources/letter-a.png"> 
                           </div>
                           <div class="ajax_answer"></div>
                        </c:if>
                     </div>
                     <div class="qnaline"><hr></div>
                  </div>
                  </c:forEach>
               </c:when>
               <c:otherwise>
                  <div>등록된 상품 문의가 없습니다</div>
               </c:otherwise>
            </c:choose>
            </div>
         </div>
         <div style="height: 200px;"></div>
      </div>
     </div>
</div>

</body>
</html>