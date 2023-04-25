<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   .body_container{
      width: 1200px;
      margin: 0 auto;
   }
   .list_header{
      height: 60px;
      margin-top: 45px;
      font-size: 24px;
      font-weight: 500;
      text-align: center;
   }
   .cate_align_box {
       position: relative;
       height: 55px;
       border-top: 5px solid #e5e5e5;
       border-bottom: 1px solid #e5e5e5;
   }
   .cate_align_box>div {
       float: left;
       height: 50px;
   }   
   .cate_align_box .align_sort {
       position: relative;
       width: 774px;
       z-index: 1;
   }   
   .cate_align_box .align_sort>ul, .cate_align_box .align_sort>ul>li {
      padding-top: 6px;
       font-size: 14px;
       float: left;
   }
   .cate_align_box .align_sort>ul>li{
      margin-left: 15px;
      margin-right: 15px;
   }
   .cate_align_box .align_sort>ul>li.on>a {
       color: #000;
       font-size: 16px;
       font-weight: 500;
   }
   .prd_sort_list{
      margin-top: 30px;
      height: 820px;
   }
   .prd_list_ul{
      padding: 0;
      margin: 0;
      height: 820px;
   }
   .prd_list_ul li{
      padding: 0;
      margin: 0;
      float: left;
      width: 300px;
      height: 410px;
      padding-left: 30px; padding-right: 30px;
   }
   .prd_list_like{
      color: #D14D72;
      float: left;
      margin-left: 10px;
      margin-top: 3px;
   }
   .prd_list_img img{
      height: 240px;
      width: 240px;
      margin-top: 10px;
   }
   .prd_list_strname{
      margin-top: 10px;
      font-size: 14px;
      color: #aaaaaa;
      font-weight: 300;
      text-align: left;
   }
   .prd_list_prdname{
      width: 290px;
      margin-top: 3px;
      font-size: 16px;
      height: 42px;
      font-weight: 500;
      text-align: left;
   }
   .prd_list_price{
      margin-top: 15px;
      color: #ED2B2A;
      font-size: 20px;
      font-weight: 500;
      text-align: left;
   }
   .prd_list_grade{
      float: left;
      margin-top: 3px;
      text-align: left;
   }
   .pageing{
      padding-top: 60px;
      margin-bottom: 50px;
      width: 100%;
   }
   .pageing a, .pageing strong {
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
   .pageing .strong{
      border: 1px solid #666;
       color: #333;
       font-weight: 700;
   }
   .hasntresult{
      margin-top: 150px;
      font-size: 20px;
      font-weight: 500;
   }
</style>
<script type="text/javascript">
   var queryString = window.location.search;
   
   //매개 변수 이름으로 쿼리 문자열 분석
   var searchParams = new URLSearchParams(queryString);
   
   //orderby 매개 변수 값 가져오기
   var orderbyValue = searchParams.get('orderby');
   //nowPage 매개 변수 값 가져오기
   var nowPageValue = searchParams.get('nowPage');
   $(function () {
      $(".align_sort>ul>li:nth-child("+orderbyValue+")").addClass("on");
      $(".align_sort>ul>li").click(function () {
         if($(this).hasClass('on')){
            $(this).removeClass('on');
         }else{
            $(this).addClass("on");
         }
      });
      $(".pageing a:nth-child("+nowPageValue+")").addClass("strong");
      $(".pageing a").click(function () {
         if($(this).hasClass('strong')){
            $(this).removeClass('strong');
         }else{
            $(this).addClass("strong");
         }
      });
   });

   
</script>
</head>
<body>
<div class="body_container">
   <div class="list_header">
      ${list_title}
   </div>
   <div class="cate_align_box">
      <div class="align_sort">
         <ul>
            <li><a href="viewListAll?catenum=${catenum }&nowPage=1&orderby=1&keyword_searching=${keyword_searching}">최근등록순</a></li>
            <li><a href="viewListAll?catenum=${catenum }&nowPage=1&orderby=2&keyword_searching=${keyword_searching}">판매수량순</a></li>
            <li><a href="viewListAll?catenum=${catenum }&nowPage=1&orderby=3&keyword_searching=${keyword_searching}">낮은가격순</a></li>
            <li><a href="viewListAll?catenum=${catenum }&nowPage=1&orderby=4&keyword_searching=${keyword_searching}">높은가격순</a></li>
            <li><a href="viewListAll?catenum=${catenum }&nowPage=1&orderby=5&keyword_searching=${keyword_searching}">인기순(찜)</a></li>
         </ul>
      </div>
   </div>
   <c:choose>
   <c:when test="${fn:length(latest_list)!=0 }">
   <div class="prd_sort_list">
      <ul class="prd_list_ul">
      <c:forEach begin="0" end="${fn:length(latest_list)-1}" var="i">
      <a href="productout?product_num=${latest_list[i].product_num }" style="display: inline-block; float: left;">
         <li>
            <div>
               <div class="prd_list_img"><img src="thumb_img/${latest_list[i].stored_file_name }"></div>
            </div>
            <div>
               <div class="prd_list_strname">${latest_list[i].store_sname }</div>
            </div>
            <div>
               <div class="prd_list_prdname">${latest_list[i].product_name }</div>
            </div>
            <div class="prd_list_mid">
               <div class="prd_list_price"><fmt:formatNumber value="${latest_list[i].product_price}" pattern="###,###원" /></div>
            </div>
            <div>
               <div class="prd_list_grade">★${latest_list[i].product_grade}</div>
               <div class="prd_list_like">♥${latest_list[i].product_like }</div>
            </div>
         </li>
      </a>
      </c:forEach>
      </ul>
   </div>
   <br>
   <div class="pageing">
   <c:set var="pages" value="${totalcnt/pagedto.cntPerPage}" />
      <c:forEach begin="1" end="${ pages+(1-(pages%1))%1}" var="cnt">
         <a href="viewListAll?catenum=${catenum }&nowPage=${cnt}&orderby=${orderby}&keyword_searching=${keyword_searching}" data-page-no="${cnt}">${cnt}</a>   
      </c:forEach>
   </div>
   </c:when>
   <c:otherwise>
      <div class="hasntresult">
         검색결과가 없습니다.
      </div>
   </c:otherwise>
   </c:choose>
</div>
</body>
</html>