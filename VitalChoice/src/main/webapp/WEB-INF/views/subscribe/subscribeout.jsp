<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
    font-family: 'Nanum Gothic', sans-serif;
    background-color: #f5f5f5;
}
.wrapper{
   width: 800px;
   margin: 0 auto;
}
.wrapper h4 {
   text-align: left;
    color: #555;
    margin: 30px 0 20px 0;
}
.wrapper h6 {
   text-align: left;
    color: #555;
    margin: 10px 0 5px 0;
}
.wrapper table {
    border-collapse: collapse;
    width: 100%;
    max-width: 800px;
    margin: 20px auto;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.wrapper th,
.wrapper td {
    padding: 10px;
    text-align: center;
    border: 1px solid #ddd;
}

.wrapper th {
    background-color: #f5f5f5;
    font-weight: normal;
}

.wrapper tr:nth-child(even) {
    background-color: #f9f9f9;
}

.wrapper img {
    vertical-align: middle;
}

.wrapper input[type="text"],
.wrapper input[type="number"] {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 5px;
    outline: none;
    font-size: 16px;
    margin-bottom: 10px;
}

.wrapper input[type="button"],
.wrapper button {
    padding: 10px;
    border: none;
    border-radius: 5px;
    outline: none;
    font-size: 16px;
    background-color: limegreen;
    color: #fff;
    cursor: pointer;
    margin-bottom: 10px;
}

.wrapper input[type="button"]:hover,
.wrapper button:hover {
    background-color: #555;
}

.wrapper input[type="checkbox"] {
    margin-right: 10px;
}

#discount {
    font-weight: bold;
    font-size: 18px;
    color: #f00;
}

#deliveryFee,
#totalPayment {
    font-weight: bold;
    font-size: 20px;
    color: #f00;
}

#apibtn {
    width: 200px;
    height: 50px;
    font-size: 18px;
    background-color: limegreen;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 20px;
}

#apibtn:hover {
    background-color: #ffa500;
}
#deliveryInfoTable td{
   text-align: left;
}
.wrapper_middle{
   text-align: left;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<div class="wrapper">
    <h4>구독 상품정보</h4>
    <table border="1" align="center">
        <tr>
            <input type="hidden" id="id" name="id" value="${user_dto.user_id}">
            <td>상품번호</td>
            <td colspan="2">상품정보</td>
            <td>옵션</td>
            <td>상품금액</td>
            <td>상품총금액</td>
        </tr>
        <c:forEach items="${splist}" var="splist">
            <tr>
               <td class="product-num">${splist.productNum}</td>
                <td><img src="thumb_img/${splist.productNum}_1" width="20px" height="20px"></td>
                <td class="product-name">${splist.productName}</td>
                <td class="product-count">${splist.productCount}</td>
                <td class="price">${splist.productPrice}</td>
                <td class="product-totprice">${splist.productCount*splist.productPrice}</td>
            </tr>
        </c:forEach>
    </table>
    <h4>구매자 정보</h4>
    <table border="1" align="center">
       <input type="hidden" id="payerid" name="payerid" value="${payerdto.user_id}">
        <tr>
            <th>이름</th>
            <td>${payerdto.user_name}</td>
        </tr>
        <tr>
            <th>이메일</th>
            <td>${payerdto.user_email}</td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td>${payerdto.user_phone}</td>
        </tr>      
    </table>
    <h4>구독받으시는분 정보</h4>
    <table border="1" align="center" id="deliveryInfoTable">
       <tr>
            <th>구독일자(매달)</th>
            <td>
               <select name="subscribeday">
                  <option value="1">1일<option value="5">5일<option value="10">10일<option value="15">15일<option value="20">20일<option value="25">25일
               </select>
            </td>
        </tr>
        <tr>
            <th>이름</th>
            <td><input type="text" id="deliveryname" name="deliveryname" value="${payerdto.user_name}"></td>
        </tr>
        <tr>
            <th>배송주소</th>
            <td>
            <input type="text" id="deliveryaddress1" name="deliveryaddress1" value="${payerdto.user_address1}" readonly="readonly">
            <button id="searchAddressBtn">우편번호 검색</button>
            <br>
            <input type="text" id="deliveryaddress2" name="deliveryaddress2" value="${payerdto.user_address2}" readonly="readonly">
            <input type="text" id="deliveryaddress3" name="deliveryaddress3" value="${payerdto.user_address3}">
            
            </td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><input type="text" id="deliveryphone" name="deliveryphone" value="${payerdto.user_phone}"></td>
        </tr>
        <tr>
            <th>배송요청사항</th>
            <td><input type="text" id="deliveryrequest" name="deliveryrequest" value="정성을 다해 배송하겠습니다."></td>
        </tr>
    </table>
    <h4>결제정보</h4>
    <div class="wrapper_middle">
       <h6>총상품가격</h6>
       <input type="text" id="totprice" value="${totprice}" style="border: none" readonly>
    </div>
    <div class="wrapper_middle">
       <h6>등급할인</h6>
       <input type="text" id="gradesale" name="gradesale" value="${Math.floor(totprice*payerdto.user_grade*0.01)}" style="border: none;" readonly>원
       <span>(Lv.${payerdto.user_grade}단계 할인)</span><br>
    </div>
    <div class="wrapper_middle">
       <h6>할인쿠폰</h6>
       <button id="couponBtn">쿠폰보기</button><br>
       <div id="couponList"></div>
       <div id="selectedCoupon"></div>
    </div>
    <h4>적립금</h4>
    <div class="wrapper_middle">
       사용가능한 적립금:${payerdto.user_point}<br>
       <input type="number" id="point" name="point" maxVal="${payerdto.user_point}" value="0">
       <input type="checkbox" id="allin" onclick="handleAllIn()">모두사용<br>
    </div>
    <div class="wrapper_middle">
       <h4>쿠폰할인금액</h4>
       <span id="discount">0</span>원<br>
   </div>
   <div class="wrapper_middle">
       <h4>배송비</h4>
       <span id="deliveryFee"></span>원<br>
   </div>
   <div class="wrapper_middle">
       <h4>총결제금액</h4>
       <span id="totalPayment"></span>원<br>
       <button id="apibtn">구독하기</button>
    </div>
</div>   
    <script type="text/javascript">
     //유림 적립금 수정부분
      $(function () {
         var maxVal = $("#point").attr('maxVal');
         $('#point').change(function () {
             var inputValue = parseInt($(this).val());
             if (isNaN(inputValue) || inputValue > maxVal) { // 입력 값이 숫자가 아니거나 최대값보다 큰 경우
                    $(this).val(maxVal); // 최대값으로 입력 값을 변경합니다.
                 }
         });
      });
        $(document).ready(function() {
            $("#couponBtn").click(function() {
                var id = $("#id").val();
                $.ajax({
                    url: "couponlist",
                    type: "POST",
                    data: {
                        "id": id
                    },
                    dataType: "json",
                    success: function(data) {
                        var couponListHtml = "<table border='1' align='center'>";
                        couponListHtml += "<tr><th>쿠폰번호</th><th>할인율</th><th>발행일</th><th></th></tr>";
                        $.each(data, function(key, value) {
                            couponListHtml += "<tr><td>" + value.coupon_num + "</td><td>" + value.discount_rate + "</td><td>" + value.issue_date + "</td><td><button class='applyCouponBtn' data-coupon-num='" + value.coupon_num + "'>적용</button></td></tr>";
                        });
                        couponListHtml += "</table>";
                        $("#couponList").html(couponListHtml);
                    },
                    error: function(request, status, error) {
                        alert("error");
                    }
                });
            });

            $(document).on("click", ".applyCouponBtn", function() {
                var couponNum = $(this).data("coupon-num");
                var totprice = Number($("#totprice").val());
                $.ajax({
                    url: "applyCoupon",
                    type: "POST",
                    data: {
                        "couponNum": couponNum
                    },
                    dataType: "json",
                    success: function(data) {
                        var couponListHtml = "<table border='1' align='center'>";
                        couponListHtml += "<tr><th>쿠폰번호</th><th>할인율</th><th>발행일</th><th>할인금액</th></tr>";
                        $.each(data, function(key, value) {
                            var discount = totprice * value.discount_rate / 100;
                            var totalDiscount = Number($("#discount").text());
                            var newTotalDiscount = totalDiscount + discount;
                            $("#discount").text(newTotalDiscount);
                            couponListHtml += "<tr><td id='couponnum'>" + value.coupon_num + "</td><td id='couponrate'>" + value.discount_rate + "</td><td>" + value.issue_date + "</td><td>" + discount + "</td></tr>";
                        });
                        couponListHtml += "</table>";
                        $("#couponList").hide();
                        $("#selectedCoupon").html(couponListHtml);
                        updateTotalPayment();
                    },
                    error: function(request, status, error) {
                        alert("error");
                    }
                });
            });
            $("#allin").on("click", function() {
                handleAllIn();
            });

            function handleAllIn() {
                if ($("#allin").is(":checked")) {
                    var userPoint = Number($("#point").attr("max"));
                    $("#point").val(userPoint);
                } else {
                    $("#point").val("");
                }
                updateTotalPayment();
            }

            function updateTotalPayment() {
                var totprice = Number($("#totprice").val());
                var deliveryFee = totprice >= 30000 ? 0 : 3000;
                var discount = Number($("#discount").text());
                var point = Number($("#point").val());
                var gradesale = Number($("#gradesale").val());
                var totalPayment = totprice - gradesale - discount - point + deliveryFee;
                $("#deliveryFee").text(deliveryFee);
                $("#totalPayment").text(totalPayment);
            }
            $("#point").on("input", function() {
                updateTotalPayment();
            });
            updateTotalPayment();
        });
        $(function(){
             $('#apibtn').click(function(){
               var data = {
                 "productNum": [],
                 "productName": [],
                 "productCount": [],
                 "productPrice": [],
                 "producttotPrice": [],
                 "payerid": $("input[name=payerid]").val(),
                 "subscribeday": $("select[name=subscribeday]").val(),
                 "deliveryname": $("input[name=deliveryname]").val(),
                 "deliveryaddress1": $("input[name=deliveryaddress1]").val(),
                 "deliveryaddress2": $("input[name=deliveryaddress2]").val(),
                 "deliveryaddress3": $("input[name=deliveryaddress3]").val(),
                 "deliveryphone": $("input[name=deliveryphone]").val(),
                 "deliveryrequest": $("input[name=deliveryrequest]").val(),
                 "couponnum": $("#couponnum").text() || 0,
                 "couponrate": $("#couponrate").text() || 0,
                 "discount": $("#discount").text(),
                 "gradesale": $("#gradesale").val(),
                 "point": $("#point").val(),
                     "deliveryFee": $("#deliveryFee").text(),
                 "totalPayment": $("#totalPayment").text()
               };
               // 상품정보 추가
               $(".product-num").each(function(){
                 data["productNum"].push($(this).text());
               });
               $("td.product-name").each(function(){
                 data["productName"].push($(this).text());
               });
               $("td.product-count").each(function(){
                 data["productCount"].push($(this).text());
               });
               $(".price").each(function(){
                 data["productPrice"].push($(this).text());
               });
               $("td.product-totprice").each(function(){
                 data["producttotPrice"].push($(this).text());
               });
               $.ajax({
                 url:'/web/subscribepay',
                 dataType:'json',
                 data: data,
                 success:function(data) {
                    alert(data.tid)
                   var box = data.next_redirect_pc_url;
                   window.location.href = box;
                 }
               });
             });
           });
        $(document).ready(function() {
            $("#searchAddressBtn").click(function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        $("#deliveryaddress1").val(data.zonecode);
                        $("#deliveryaddress2").val(data.address);
                        $("#deliveryaddress3").focus();
                    }
                }).open();
            });
        });
    </script>
</body>
</html>