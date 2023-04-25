<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<!-- <link rel="stylesheet" href="resources/cartinput.css"> -->
	<style type="text/css">
body {
  margin: 0;
}

/* * {
  box-sizing: border-box;
}  */

p,
span {
  margin: 0;
}

a {
  color: black;
}

.cart_img {
  display: block;
  width: 50%;
  height: 80px;
  margin: auto;
} 

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: limegreen;
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: limegreen;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn_left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn_right {
  background-color: limegreen;
  color: white;
  border: none;
}
	</style>
    <script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <script type="text/javascript">
        // productcnt 수량을 조절하는 함수
        function adjustProductCnt(index, count) {
            var productcnts = document.getElementsByClassName("productcnt");
            var currentCount = parseInt(productcnts[index].value); // 입력 필드 값은 문자열이므로 정수형으로 변환

            // 현재 수량이 1 이하이면 감소 버튼 클릭 불가
            if (currentCount <= 1 && count < 0) {
                return;
            }
            // 수량 증가 또는 감소
            productcnts[index].value = currentCount + count;
        }
        // form submit 이벤트 핸들러
        function submitForm(index) {
            var productcnts = document.getElementsByClassName("productcnt");
            var productnums = document.getElementsByClassName("productnum");
            var user_ids = document.getElementsByClassName("user_id");
            var form = document.createElement("form");
            form.method = "GET";
            form.action = "cartcntmodify";

            var productcntInput = document.createElement("input");
            productcntInput.type = "hidden";
            productcntInput.name = "product_count";
            productcntInput.value = productcnts[index].value;
            form.appendChild(productcntInput);

            var productnumInput = document.createElement("input");
            productnumInput.type = "hidden";
            productnumInput.name = "product_num";
            productnumInput.value = productnums[index].value;
            form.appendChild(productnumInput);

            var user_idInput = document.createElement("input");
            user_idInput.type = "hidden";
            user_idInput.name = "user_id";
            user_idInput.value = user_ids[index].value;
            form.appendChild(user_idInput);

            document.body.appendChild(form);
            form.submit();
        }

        function deleteForm(index) {
            var productnums = document.getElementsByClassName("productnum");
            var user_ids = document.getElementsByClassName("user_id");
            var form = document.createElement("form");
            form.method = "GET";
            form.action = "cartdelete";

            var productnumInput = document.createElement("input");
            productnumInput.type = "hidden";
            productnumInput.name = "product_num";
            productnumInput.value = productnums[index].value;
            form.appendChild(productnumInput);

            var user_idInput = document.createElement("input");
            user_idInput.type = "hidden";
            user_idInput.name = "user_id";
            user_idInput.value = user_ids[index].value;
            form.appendChild(user_idInput);

            document.body.appendChild(form);
            form.submit();
        }
        $(function() {
            $(".all_check_input").on("click", function() {
                /* 체크박스 체크/해제 */
                if ($(this).prop("checked")) {
                    $(".productcheck").prop("checked", true);
                } else {
                    $(".productcheck").prop("checked", false);
                }
                updateTotalPrice();
            });

            $(".productcheck").on("click", function() {
                updateTotalPrice();
            });
        });

        function updateTotalPrice() {
            var totalPrice = 0;
            $(".productcheck:checked").each(function() {
                var productCount = $(this).closest(".cart__list__detail").find(".productcnt").val();
                var productPrice = $(this).closest(".cart__list__detail").find(".price").text().replace(/[^0-9]/g, "");
                totalPrice += productCount * productPrice;
            });
            $(".total-price").text(totalPrice.toLocaleString() + "원");
        }
        //체크박스 클릭 시
        $(".productcheck").on("click", function() {
            calculateTotalPrice();
        });

        // 수량 변경 시
        $(".productcnt").on("change", function() {
            calculateTotalPrice();
        });

        // 체크박스 전체 선택/해제 시
        $(".all_check_input").on("click", function() {
            /* 체크박스 체크/해제 */
            if ($(".all_check_input").prop("checked")) {
                $(".productcheck").attr("checked", true);
            } else {
                $(".productcheck").attr("checked", false);
            }
            calculateTotalPrice();
        });

        // 총 가격 계산 함수
        function calculateTotalPrice() {
            var totalPrice = 0;
            $(".productcheck:checked").each(function() {
                var cnt = $(this).parents(".cart__list__detail").find(".productcnt").val();
                var price = $(this).parents(".cart__list__detail").find(".price").text().replace(/[^0-9]/g, "");
                totalPrice += cnt * price;
            });
            $(".total-price").text(totalPrice.toLocaleString() + "원");
        }

        //
        function order() {
            // 체크된 상품 정보를 담을 배열
            var selectedProducts = [];
            // 체크된 상품 정보를 가져옴
            $(".productcheck:checked").each(function() {
                var productCount = $(this).closest(".cart__list__detail").find(".productcnt").val();
                var productNum = $(this).closest(".cart__list__detail").find(".productnum").val();
                var userId = $(this).closest(".cart__list__detail").find(".user_id").val();
                var productName = $(this).closest(".cart__list__detail").find(".productname").val();
                var productPrice = $(this).closest(".cart__list__detail").find(".productprice").val();
                selectedProducts.push({
                    productNum: productNum,
                    productCount: productCount,
                    userId: userId,
                    productName: productName,
                    productPrice: productPrice
                });
            });
            // 상품 정보를 JSON 문자열로 변환하여 폼 데이터에 추가
            var data = {
                selectedProducts: JSON.stringify(selectedProducts)
            };
            // 폼 생성 및 전송
            var form = $("<form>")
                .attr("method", "post")
                .attr("action", "cartout");

            for (var key in data) {
                var input = $("<input>")
                    .attr("type", "hidden")
                    .attr("name", key)
                    .attr("value", data[key]);
                form.append(input);
            }
            form.appendTo("body").submit();
        }
        function subscribe() {
            // 체크된 상품 정보를 담을 배열
            var selectedProducts = [];
            // 체크된 상품 정보를 가져옴
            $(".productcheck:checked").each(function() {
                var productCount = $(this).closest(".cart__list__detail").find(".productcnt").val();
                var productNum = $(this).closest(".cart__list__detail").find(".productnum").val();
                var userId = $(this).closest(".cart__list__detail").find(".user_id").val();
                var productName = $(this).closest(".cart__list__detail").find(".productname").val();
                var productPrice = $(this).closest(".cart__list__detail").find(".productprice").val();
                selectedProducts.push({
                    productNum: productNum,
                    productCount: productCount,
                    userId: userId,
                    productName: productName,
                    productPrice: productPrice
                });
            });
            // 상품 정보를 JSON 문자열로 변환하여 폼 데이터에 추가
            var data = {
                selectedProducts: JSON.stringify(selectedProducts)
            };
            // 폼 생성 및 전송
            var form = $("<form>")
                .attr("method", "post")
                .attr("action", "subscribeout");

            for (var key in data) {
                var input = $("<input>")
                    .attr("type", "hidden")
                    .attr("name", key)
                    .attr("value", data[key]);
                form.append(input);
            }
            form.appendTo("body").submit();
        }
    </script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <tr>
                <td><input type="checkbox" class="all_check_input"></td>
                <td colspan="2">상품정보</td>
                <td>옵션</td>
                <td>상품금액</td>
                <td>배송비</td>
            </tr>
            <c:forEach items="${list}" var="list" varStatus="status">
                <tr class="cart__list__detail">
                    <td><input type="checkbox" class="productcheck"></td>
                    <td>
                        <a href="productout?product_num=${list.product_num}">
                            <img class="cart_img" src="thumb_img/${list.product_num}_1">
                        </a>
                    </td>
                    <td>
                        <a href="#">${list.store_sname}</a>
                        <a href="productout?product_num=${list.product_num}">
                            <p>${list.product_name}</p>
                        </a>
                        <span class="price">
                            <fmt:formatNumber value="${list.product_price}" pattern="#,##0" />원</span>
                    </td>
                    <td class="cart__list__option">
                        <button class="cart__list__optionbtn" data-index="${status.index}" onclick="adjustProductCnt(${status.index}, -1)">-</button>
                        <input type="hidden" class="cartnum" name="cart_num" value="${list.cart_num}">
                        <input type="text" class="productcnt" name="product_count" value="${list.product_count}">
                        <input type="hidden" class="productnum" name="product_num" value="${list.product_num}">
                        <input type="hidden" class="user_id" name="user_id" value="${user_dto.user_id}">
                        <input type="hidden" class="productname" name="product_name" value="${list.product_name}">
                        <input type="hidden" class="productprice" name="product_price" value="${list.product_price}">
                        <button class="cart__list__optionbtn" data-index="${status.index}" onclick="adjustProductCnt(${status.index}, 1)">+</button>
                        <button class="cart__list__optionbtn" data-index="${status.index}" onclick="submitForm(${status.index})">주문조건 추가/변경</button>
                    </td>
                    <td>
                        <span class="prices">
                            <fmt:formatNumber value="${list.product_price*list.product_count}" pattern="#,##0" />원</span><br>
                        <button class="cart__list__deletebtn" data-index="${status.index}" onclick="deleteForm(${status.index})">삭제</button>
                    </td>
                    <td>무료</td>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="4">총 금액</td>
                <td>
                    <span class="price total-price"></span>
                </td>
                <td></td>
            </tr>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn_left" onclick="subscribe()">구독하기</button>
            <button class="cart__bigorderbtn_right" onclick="order()">주문하기</button>
        </div>
    </section>
</body>
</html>