<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

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
</style>
<script>

$(function() {
	// 마우스 오버할때 다른 이미지 보이기
	$(".thumbimg_list").hover(function(){ 
		console.log($(this).attr('src'));
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
	// 경훈 장바구니 추가작업
	$("#go_cart").click(function () {
		var cnt = parseInt($("#productcnt").attr('value'));
		$("<form/>", {action: "gocart", method: "get"})
		.append($("<input/>", {type: "hidden", name: "product_num", value: "${productdto.product_num}"}))
		.append($("<input/>", {type: "hidden", name: "user_id", value: "${user_dto.user_id}"}))
		.append($("<input/>", {type: "hidden", name: "product_count", value: cnt}))
		.appendTo("body")
		.submit();
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container-fluid" style="width: 1200px;">
  <div class="row"> 
    <div class="col-sm-6" align="right" style="width: 600px; background-color: yellow; padding-left: 0px;">
       <div class="product">
         <!-- 상품이미지 -->
         <div id="thumb_img" style="width: 600px; text-align: left;">
            <div id="thumb_img_first" style="text-align: left; ">
               <img src="thumb_img/${thumblist[0].stored_file_name }" height="600" width="600" id="thumbimg_main">
            </div>
            <!-- 마우스 오버시 다른사진도 크게 볼 수 있게. -->
            <div id="thumb_img_list" style="text-align: left;">
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
    <div class="col-sm-6" style="background-color:lavenderblush; width: 600px; padding-right: 0px;">
       <div class="product">
          <div class="product_info" style="padding-left: 30px; text-align: left;">
             <div class="product_category">
                <span>${categorydto.category_main }&ensp;>&ensp;${categorydto.category_detail }</span>
             </div>
             <br>
             <br>
             <div class="product_detail">
                <div style="font-size: 20px; color: gray;">${store_sname }</div>
                <div style="font-size: 30px; ">${productdto.product_name }</div>
                <div style="font-size: 18px; color: gray;">${productdto.product_name }</div>
                <br>
                <br>
                <br>
                <br>
                <div style="font-size: 30px; ">${productdto.product_price}원</div>
             </div>
             <br>
             <br>
             <div class="product_order">
                <form action="productorder" method="post" >
                <div class="product_cnt" style="position: relative; min-height: 60px; border: 1px solid #e9e9e9; background: #f9f9f9; border-radius: 5px; ">
                   <span style="line-height: 60px; float: left; padding-left: 10px; ">구매수량</span>
                   <span style="line-height: 60px; float: right; padding-right: 10px;">
                      <button type="button" id="cnt_minus" style=" line-height: 20px; vertical-align: middle;">-</button>
                      <input type="text" value="1" id="productcnt" size=1 maxlength=3 style="text-align: center; height: 25px;">
                      <button type="button" id="cnt_plus" value="+" style="  line-height: 20px; vertical-align: middle; " >+</button>
                   </span>
                </div>
                <br>
                <br>
                <div class="product_totalprice">
                   <span style="text-align: left; padding-left: 5px; font-size: 25px; color: red; float: left;">상품금액 합계</span>
                   <span id="totalprice" style="text-align: right; padding-right: 5px; font-size: 25px; color: red; float: right;">${productdto.product_price} 원</span>
                </div>
                <!-- 장바구니, 결제 버튼 -->
                <div class="order_btn" style="margin-top: 50px;">
                   <button type="button" id="btn_like" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">♡</button>
                   <button type="button" id="go_cart" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">장바구니</button>
                   <button type="button" id="go_payment" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">바로구매</button>
                </div>
                <!-- 구독버튼 -->
                <div class="subscription_btn">
                   <span>한 달에 한 번! 구독으로 이용하세요</span>
                   <br>
                   <button type="button" id="go_cart" style="height: 65px; margin-left: 0;font-size: 20px; font-weight: 500;">구독하기</button>
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
        <li style="float: left; width: 25%;"><a data-toggle="tab" href="#menu4">Q&A</a></li>
      </ul>
      
      <div class="tab-content">
         <div id="menu1" class="tab-pane fade in active">
            <c:forEach items="${detaillist}" var="dl">
                 <img src="detail_img/${dl.stored_file_name }" width="1000">
              </c:forEach>
         </div>
         <div id="menu2" class="tab-pane fade">
              <div class="review_upside">
                 <div class="rev_up_left">
                    <span class=show_star>★★★★★ ${grade}</span><span>(${review_cnt})</span>
                 </div>
                 <div class="rev_up_right">
                 
                 </div>
              </div>
              <div class="review_downside">
              
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
                 <c:when test="${reviewlist[0]!=null }">
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
                    <div>작성된 리뷰가 없습니다.</div>
                 </c:otherwise>
                 </c:choose>
              </div>
         </div>
         <div id="menu4" class="tab-pane fade">
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
                
                      <div class="qna_content">
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
            <div style="height: 200px;"></div>
            
         </div>
         <div style="height: 200px;"></div>
      </div>
     </div>
</div>

</body>
</html>