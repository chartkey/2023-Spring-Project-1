<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
            font-weight: 600;
            margin-bottom: 100px;
        }
         .subtitle_subtitle {
            font-size: 20px;
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
</style>
</head>
<body>
   <div class="Layout_seller_body">
      <div class="subtitle">나의 스토어 요약</div>
        <div class="subtitle_subtitle">주문 확인</div>
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
      <div style="height: 100px;"></div>
        <div class="subtitle_subtitle">스토어 매출</div>
        <div class="delivery_status">
           <div class="delivery_status_imgbox">
              <img src="resources/piggybank.png">
              
              <div class="delivery_status_detail">
                 <div class="del_status_title">판매현황</div>
                 <div class="del_status_middle">${store_sellcount}건</div>
              </div>
              <div class="delivery_status_detail"  style="color: #EB455F;">
                 <div class="del_status_title">매출현황</div>
                 <div class="del_status_middle"><fmt:formatNumber value="${store_sales }" pattern="###,###원"/> </div>
              </div>
          </div>
      </div>
   </div>
</body>
</html>