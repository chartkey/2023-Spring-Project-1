<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
        .Layout_seller_body {
            margin: 40px;
        }
        .subtitle {
            font-size: 30px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .tbl_inputarea {
            width: 100%;
            border: 2px solid #EEEEEE;
            background-color: #F8F8F8;
            margin-top: 10px;
            padding: 30px;
            height: 450px;
            pointer-events: auto;
        }

        .tbl_input_inputarea {
            width: 100%;
            height: 100%;
            /* 부모 요소에서 10px 작은 높이값으로 설정 */
            overflow: auto;
            pointer-events: auto;
        }

        .subtitle_subtitle {
            font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 600;
            margin-bottom: 10px;
        }
        .delivery_status{
           height: 100px;
           padding-top: 20px;
           margin-bottom: 40px;
        }
        .delivery_status_imgbox{
           padding-left: 30px;
           padding-top : 10px;
           float: left;
           background-color: #DDF7E3;
           height: 80px; width:600px;
           text-align: center;
           border-radius: 5px;
        }
        .delivery_status_imgbox img{
           float: left;
           width: 60px; height: 60px;
        }
        .delivery_status_detail{
           padding-top: 5px;
           margin-left: 80px;
           float: left;
           text-align: center;
           cursor: pointer;
        }
        .del_status_title{
           font-size: 18px;
           font-weight: 600;
        }
        .del_status_middle{
           font-size: 16px;
           font-weight: 400;
        }
        .scrolltable {
           margin-top: 20px;
            display: block;
            width: 1060px;
            overflow: auto;  
            max-height: 300px;    
            margin-bottom: 20px;    
        }
        .scrolltable th,td{
           padding-left: 5px;
        }
        #popup_del{
         display: none;
      width: 700px;
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -300px 0 0 -400px;
      background-color: #fff;
      z-index: 2;
      border: 3px solid #DDDDDD;
      border-radius: 20px;
      padding: 30px;
      text-align: center;
      }
      .openPopup{
         cursor:pointer;
      }
      .tbl_pop_del{
         padding: 10px;
         width: 100%;
         border: 3px solid #DDF7E3;
         margin-bottom: 20px;
         text-align: left;
      }
      .tbl_pop_del td{
         padding: 10px;
         padding-left: 15px;
      }
      .tbl_pop_del th{
         padding: 10px;
         padding-left: 15px;
      }
      .btn_closePop{
         width: 80px;   
      }
      .not_exist_order{
         text-align: center;
         margin-top: 150px;
        }
        #btn_check_order{
           font-size: 15px;
           font-weight: 600;
           padding: 3px;
           width: 300px;
           background-color: #EEEEEE;
           border-radius: 1px;
           border-style: solid;
           
        }
        #btn_check_order:hover{
           background-color: #DDF7E3;
        }
</style>
<script type="text/javascript">
   $(function () {
      $(".delivery_status_detail").click(function () {
         $(this).css('color', '#EB455F').siblings().css('color', 'black');
         $("#del_status_subtitle").html($('.del_status_title', this).html());
         if($('.delivery_status_imgbox').children().eq(1).is($(this))){
            $(".del_div1").show().siblings().hide();
         }else if($('.delivery_status_imgbox').children().eq(2).is($(this))){
            $(".del_div2").show().siblings().hide();
         }else{
            $(".del_div3").show().siblings().hide();
         }
      });
      $(".checkAll").click(function() {
          // 전체선택 체크박스가 체크되어 있으면
          if ($(this).prop("checked")) {
            // 모든 체크박스를 체크상태로 만듦
            $(".check").prop("checked", true);
          } else {
            // 모든 체크박스의 체크를 해제함
            $(".check").prop("checked", false);
          }
      });
       //팝업
      $(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
         $("#popup_del").show();   //팝업 오픈
         var param1 = $(this).attr("param1");
         var param2 = $(this).attr("param2").substring(0,10);
         var param3 = $(this).attr("param3");
         var param4 = $(this).attr("param4").toLocaleString();
         var param5 = $(this).attr("param5");
         var param6 = $(this).attr("param6").toLocaleString();
         var param7 = $(this).attr("param7");
         var param8 = $(this).attr("param8");
         var param9 = $(this).attr("param9");
         var param10 = $(this).attr("param10");
         var param11 = $(this).attr("param11");
         var param12 = $(this).attr("param12");
         var param13 = $(this).attr("param13");
         $(".td_order_num").html(param1);
         $(".td_delivery_date").html(param2);
         $(".td_product_name").html(param3);
         $(".td_product_price").html(param4+"원");
         $(".td_product_count").html(param5);
         $(".td_product_totprice").html(param6+"원");
         $(".td_user_id").html(param7);
         $(".td_delivery_name").html(param8);
         $(".td_delivery_address1").html(param9);
         $(".td_delivery_address2").html(param10);
         $(".td_delivery_address3").html(param11);
         $(".td_delivery_phone").html(param12);
         $(".td_delivery_request").html(param13);
      });
             
      $(".btn_closePop").click(function () {
         $("#popup_del").hide();
      });
      $("#btn_check_order").click(function () {
         $("#neworderform").submit();
      });
   });
</script>
</head>
<body>
   <div class="Layout_seller_body">
        <div class="subtitle">주문 확인/발송관리</div>
        <div class="subtitle_subtitle" style="color: #AAAAAA; font-weight: 400;">발주 확인(신규 주문 확인), 발송처리를 할 수 있습니다.</div>
        <div class="delivery_status">
           <div class="delivery_status_imgbox">
              <img src="resources/delivery.png">
              
              <div class="delivery_status_detail" style="color: #EB455F;">
                 <div class="del_status_title">신규주문</div>
                 <div class="del_status_middle">${beforecnt}건</div>
              </div>
              <div class="delivery_status_detail">
                 <div class="del_status_title">배송대기</div>
                 <div class="del_status_middle">${middlecnt}건</div>
              </div>
              <div class="delivery_status_detail">
                 <div class="del_status_title">배송완료</div>
                 <div class="del_status_middle">${aftercnt}건</div>
              </div>
           </div>
        </div>
        <div class="subtitle_subtitle" id="del_status_subtitle" style="font-size: 18px;">신규주문</div>
        <div class="tbl_inputarea">
            <div class="tbl_input_inputarea">
                 <!-- 신규주문 -->
                 <div class=del_div1>
                 <c:choose>
                 <c:when test="${beforecnt!=0 }">
                    <form action="neworderform" id="neworderform">
                    
                    <table border="1" class="scrolltable">
                       <div class="subtitle_subtitle" style="color: #DF2E38;">상품 배송준비가 완료된다면 주문을 확정해주세요. 주문번호를 클릭하여 배송 상세정보를 확인할 수 있습니다.</div>
                       <tr>
                           <th style="width: 30px;"><input type="checkbox" class="checkAll"></th>
                           <th style="width: 100px;">주문번호</th>
                           <th style="width: 100px;">주문일자</th>
                           <th style="width: 400px;">제품명</th>
                           <th style="width: 120px;">제품가격</th>
                           <th style="width: 100px;">주문수량</th>
                           <th style="width: 130px;">결제금액</th>
                           <th style="width: 80px;"></th>
                       </tr>
                       <c:forEach begin="0" end="${beforecnt-1 }" var="i">
                           <tr>
                              <td><input type="checkbox" value="${sellerorderlist[i].order_num},${sellerorderlist[i].product_num},${sellerorderlist[i].product_totprice}" class="check" name="checked"></td>
                               <td>${sellerorderlist[i].order_num }</td>
                               <td>${fn:substring(sellerorderlist[i].delivery_date, 0, 10) }</td>
                               <td>${sellerorderlist[i].product_name }</td>
                               <td>${sellerorderlist[i].product_price }</td>
                               <td>${sellerorderlist[i].product_count }</td>
                               <td>${sellerorderlist[i].product_totprice }</td>
                               <td><button type="button" class="openPopup" param1="${sellerorderlist[i].order_num}" param2="${sellerorderlist[i].delivery_date}" param3="${sellerorderlist[i].product_name}" param4="${sellerorderlist[i].product_price}" param5="${sellerorderlist[i].product_count}" param6="${sellerorderlist[i].product_totprice}" param7="${sellerorderlist[i].user_id}" param8="${sellerorderlist[i].delivery_name}" param9="${sellerorderlist[i].delivery_address1}" param10="${sellerorderlist[i].delivery_address2}" param11="${sellerorderlist[i].delivery_address3}" param12="${sellerorderlist[i].delivery_phone}"param13="${sellerorderlist[i].delivery_request}">배송정보</button></td>
                           </tr>
                       </c:forEach>
                   </table>
                   <button type="button" id="btn_check_order">선택 목록 주문확정/배송대기</button>
                   </form>
               </c:when>
               <c:otherwise>
                  <div class="not_exist_order">
                     <div>
                        <img src="resources/exclamation.png" width="80" height="80px">
                     </div>
                     <br><br>
                     <div class="subtitle_subtitle">
                        신규주문이 없습니다.
                     </div>
                  </div>
               </c:otherwise>
               </c:choose>
                 </div>
                 
                 <!-- 배송대기 -->
                 <div class=del_div2 style="display: none;">
                    <c:choose>
                    <c:when test="${middlecnt!=0 }">
                       <table border="1" class="scrolltable">
                          <div class="subtitle_subtitle" style="color: #DF2E38;">상품은 준비되었으나, 고객이 아직 '배송시작'을 요청하지 않은 상태입니다. 배송이 시작되면 배송 완료 탭으로 이동됩니다.</div>
                          <tr>
                             <th style="width: 30px;"></th>
                              <th style="width: 100px;">주문번호</th>
                              <th style="width: 100px;">주문일자</th>
                              <th style="width: 400px;">제품명</th>
                              <th style="width: 120px;">제품가격</th>
                              <th style="width: 100px;">주문수량</th>
                              <th style="width: 130px;">결제금액</th>
                              <th style="width: 80px;"></th>
                          </tr>
                          <c:forEach begin="0" end="${middlecnt-1 }" var="i">
                              <tr>
                                 <td></td>
                                  <td>${sellerorderlist2[i].order_num }</td>
                                  <td>${fn:substring(sellerorderlist2[i].delivery_date, 0, 10) }</td>
                                  <td>${sellerorderlist2[i].product_name }</td>
                                  <td>${sellerorderlist2[i].product_price }</td>
                                  <td>${sellerorderlist2[i].product_count }</td>
                                  <td>${sellerorderlist2[i].product_totprice }</td>
                                  <td><button type="button" class="openPopup" param1="${sellerorderlist2[i].order_num}" param2="${sellerorderlist2[i].delivery_date}" param3="${sellerorderlist2[i].product_name}" param4="${sellerorderlist2[i].product_price}" param5="${sellerorderlist2[i].product_count}" param6="${sellerorderlist2[i].product_totprice}" param7="${sellerorderlist2[i].user_id}" param8="${sellerorderlist2[i].delivery_name}" param9="${sellerorderlist2[i].delivery_address1}" param10="${sellerorderlist2[i].delivery_address2}" param11="${sellerorderlist2[i].delivery_address3}" param12="${sellerorderlist2[i].delivery_phone}"param13="${sellerorderlist2[i].delivery_request}">배송정보</button></td>
                              </tr>
                          </c:forEach>
                      </table>
                      </form>
                  </c:when>
                  <c:otherwise>
                     <div class="not_exist_order">
                        <div>
                           <img src="resources/exclamation.png" width="80" height="80px">
                        </div>
                        <br><br>
                        <div class="subtitle_subtitle">
                        배송 대기중인 주문이 없습니다.
                        </div>
                     </div>
                  </c:otherwise>
                  </c:choose>
                 </div>
                 <!-- 배송완료 -->
                 <div class=del_div3 style="display: none;">
                    <c:choose>
                    <c:when test="${aftercnt!=0 }">
                       <table border="1" class="scrolltable">
                          <div class="subtitle_subtitle" style="color: #DF2E38;">배송 완료된 주문 목록입니다.</div>
                          <tr>
                             <th style="width: 30px;"></th>
                              <th style="width: 100px;">주문번호</th>
                              <th style="width: 100px;">주문일자</th>
                              <th style="width: 400px;">제품명</th>
                              <th style="width: 120px;">제품가격</th>
                              <th style="width: 100px;">주문수량</th>
                              <th style="width: 130px;">결제금액</th>
                              <th style="width: 80px;"></th>
                          </tr>
                          <c:forEach begin="0" end="${aftercnt-1 }" var="i">
                              <tr>
                                 <td></td>
                                  <td>${sellerorderlist3[i].order_num }</td>
                                  <td>${fn:substring(sellerorderlist2[i].delivery_date, 0, 10) }</td>
                                  <td>${sellerorderlist3[i].product_name }</td>
                                  <td>${sellerorderlist3[i].product_price }</td>
                                  <td>${sellerorderlist3[i].product_count }</td>
                                  <td>${sellerorderlist3[i].product_totprice }</td>
                                  <td><button type="button" class="openPopup" param1="${sellerorderlist3[i].order_num}" param2="${sellerorderlist3[i].delivery_date}" param3="${sellerorderlist3[i].product_name}" param4="${sellerorderlist3[i].product_price}" param5="${sellerorderlist3[i].product_count}" param6="${sellerorderlist3[i].product_totprice}" param7="${sellerorderlist3[i].user_id}" param8="${sellerorderlist3[i].delivery_name}" param9="${sellerorderlist3[i].delivery_address1}" param10="${sellerorderlist3[i].delivery_address2}" param11="${sellerorderlist3[i].delivery_address3}" param12="${sellerorderlist3[i].delivery_phone}"param13="${sellerorderlist3[i].delivery_request}">배송정보</button></td>
                              </tr>
                          </c:forEach>
                      </table>
                      </form>
                  </c:when>
                  <c:otherwise>
                     <div class="not_exist_order">
                        <div>
                           <img src="resources/exclamation.png" width="80" height="80px">
                        </div>
                        <br><br>
                        <div class="subtitle_subtitle">
                        배송 완료된 주문이 없습니다.
                        </div>
                     </div>
                  </c:otherwise>
                  </c:choose>
                 </div>
            </div>
        </div>   
    </div>
    <!-- Popup -->
    <div id="popup_del">
       <div class="subtitle_subtitle" style="font-size: 18px;">주문/배송 정보</div>
       <table class=tbl_pop_del border="1">
          <tr>
             <th>주문번호</th>
             <td class="td_order_num"></td>
          </tr>
          <tr>
             <th>주문일자</th>
             <td class="td_delivery_date"></td>
          </tr>
          <tr>
             <th>제품이름</th>
             <td class="td_product_name"></td>
          </tr>
          <tr>
             <th>제품가격</th>
             <td class="td_product_price"></td>
          </tr>
          <tr>
             <th>주문수량</th>
             <td class="td_product_count"></td>
          </tr>
          <tr>
             <th>결제금액</th>
             <td class="td_product_totprice"></td>
          </tr>
          <tr>
             <th>주문ID</th>
             <td class="td_user_id"></td>
          </tr>
          <tr>
             <th>수령인 성함</th>
             <td class="td_delivery_name"></td>
          </tr>
          <tr>
             <th>배송지 우편번호</th>
             <td class="td_delivery_address1"></td>
          </tr>
          <tr>
             <th>배송지 주소</th>
             <td class="td_delivery_address2"></td>
          </tr>
          <tr>
             <th>배송지 상세주소</th>
             <td class="td_delivery_address3"></td>
          </tr>
          <tr>
             <th>연락처</th>
             <td class="td_delivery_phone"></td>
          </tr>
          <tr>
             <th>배송 요청사항</th>
             <td class="td_delivery_request"></td>
          </tr>
       </table>
       <button class="btn_closePop" type="button">닫기</button>
    </div>
</body>
</html>