<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.order_wrap{
margin: 0 auto;
width: 800px;
}
.order_title{
font-size: 25px;
font-weight: 700;
text-align: left;
margin-top: 30px; margin-bottom: 10px;
}
.order_subtitle{
font-size: 14px;
font-weight: 300;
text-align: left;
 margin-bottom: 10px;
}
.survey_radio input[type="radio"] {
display: none;
}
.survey_group{
   text-align: center;
   width: 100%; height: 150px;
}
.survey_radio span{
   margin-left: 20px;
   display: inline-block;
   float:left;
   width: 100px; height: 100px;
   border: 5px solid #EEEEEE;
   cursor: pointer;
   border-radius: 80px;
   font-size: 22px; font-weight: 700;
   padding-top: 28px;
}
.survey_radio span:hover{
   background-color: #576CBC;
   color: white;
}
.survey_radio input[type="radio"]:checked + span {
        background-color: #113a6b;
        color: #ffffff;
    }
.survey_inside_title{
font-size: 18px;
font-weight: 500;
text-align: center;
margin-top: 40px; margin-bottom: 25px;
width: 100%;
}
.btn_survey_submit{
   margin: 100px 0 0 0;
   height: 50px; width: 200px;
   border: 3px solid #009d00;
   border-radius: 25px;
   background-color: white;
   font-size: 17px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   $(function() {
      $('.survey_radio span').on('click', function() {
          $(this).prev('input[type=radio]').prop('checked', true);
      });
   });
</script>
</head>
<body>
<div class="order_wrap">
   <div class="order_title">맞춤설문</div>
   <div class="order_subtitle">간단한 설문을 통해, 맞춤 영양제를 추천받아 보세요.</div>
   <form action="surveyout" id="form_survey">
      <div class="survey_inside_title">귀하의 성별은</div>
      <div class="survey_group" style="margin-left: 270px;">
         <div class="survey_radio">
            <input type="radio" name="survey_gender" value="2">
            <span>남자</span>
         </div>
         <div class="survey_radio">
            <input type="radio" name="survey_gender" value="1">
            <span>여자</span>
         </div>
      </div>
      <div class="survey_inside_title">귀하의 나이대는</div>
      <div class="survey_group">
         <div class="survey_radio" style="margin-left: 150px;">
            <input type="radio" name="survey_age" value="10">
            <span>10대</span>
         </div>
         <div class="survey_radio">
            <input type="radio" name="survey_age" value="20">
            <span>2-30대</span>
         </div>
         <div class="survey_radio">
            <input type="radio" name="survey_age" value="40">
            <span>4-50대</span>
         </div>
         <div class="survey_radio">
            <input type="radio" name="survey_age" value="60">
            <span>60대</span>
         </div>
      </div>
      <button type="submit" class="btn_survey_submit">설문하러 가기 →</button>   
   </form>
</div>
</body>
</html>