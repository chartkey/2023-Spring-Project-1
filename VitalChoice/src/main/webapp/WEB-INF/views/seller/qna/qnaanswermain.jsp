<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
    #popup01{
   		display: none;
		width: 1000px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin: -200px 0 0 -500px;
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
	.qna_box{
		margin: 50px;
	}
        .scrolltable {
            display: block;
            width: 100%;
            overflow: auto;          
        }

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
            font-weight: 500;
            margin-bottom: 10px;
        }
        .not_exist_qna{
			text-align: center;
			margin-top: 150px;
        }
        td{
        	padding-left: 5px;
        	font-size: 14px;
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: 100;
            background-color: white;
        }
        th{
        	font-weight: 400;
        	padding-left: 5px;
        	font-size: 15px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        .png_qna img{
        	width: 30px;
        	height: 30px;
        }
        .qna_content{
			white-space: no-wrap;
			overflow: hidden;
			text-overflow: ellipsis;
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
    </style>
    <script type="text/javascript">
    	$(function () {		
		  //qna팝업
			$(".openPopup").on("click", function(event) {  //팝업오픈 버튼 누르면
				$("#popup01").show();   //팝업 오픈
				$("body").append('<div class="backon"></div>'); //뒷배경 생성
				var pnum = $(this).attr("pnum"); // pnum 속성 값 가져오기
				var rnum = $(this).attr("rnum");
				var rdate = $(this).attr("rdate");
				var pname = $(this).attr("pname");
				var cont = $(this).attr("cont");
				console.log(rnum);
				console.log(rdate);
				console.log(pname);
				console.log(cont);
				$("#ans_product_num").val(pnum);
				$("#ans_reply_origin_number").val(rnum);
				$("#ans_reporting_date").html(rdate);
				$("#ans_product_name").html('['+pname+']');
				$("#ans_content").html(cont);
			
				
			});
				    
			$("body").on("click", function(event) { 
				if(event.target.className == 'close' || event.target.className == 'backon'){
					$("#popup01").hide(); //close버튼 이거나 뒷배경 클릭시 팝업 삭제
					$(".backon").hide();
				}
			});
			//q&a답변 폼 전송
			$("#btn_qna_answer").click(function () {
				$("#qnaanswerform").submit();
			});
    	});
    </script>
</head>

<body>
    <div class="Layout_seller_body">
        <div class="subtitle">상품 Q&A 답변</div>
        <div class="subtitle_subtitle" style="color: #AAAAAA;">답변을 작성하신 질문은 '답변완료' 처리 됩니다. </div>
        <div style="height: 80px;"></div>
        <div class="subtitle_subtitle" style="font-size: 18px;">답변을 기다리는 문의 ${cnt_replylist}개</div>
        <div class="tbl_inputarea">
            <div class="tbl_input_inputarea">
            <c:choose>
            <c:when test="${cnt_replylist!=0 }">
                <table border="1" class="scrolltable">
                    <div class="subtitle_subtitle" style="color: #DF2E38;">'답변하기'버튼을 통해 답변할 수 있습니다. 수정이 불가하므로 신중히 답변해주세요.</div>
                    <tr>
                        <th width="5%"></th>
                        <th width="10%">상품명</th>
                        <th width="10%">작성날짜</th>
                        <th width="10%">작성자</th>
                        <th width="65%">질문내용</th>
                    </tr>
                    <c:forEach items="${replylist }" var="i">
                        <tr>
                            <td><div class="openPopup" style="display: inline-block; color: blue;" pnum="${i.product_num}" rnum="${i.reply_origin_number}" rdate="${i.reporting_date}" pname="${i.product_name}" cont="${i.content }">답변하기</div></td>
                            <td>${i.product_name }</td>
                            <td>${i.reporting_date }</td>
                            <td>${i.user_id }</td>
                            <td>${i.content }</td>
                        </tr>
                        
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
            	<div class="not_exist_qna">
            		<div>
            			<img src="resources/exclamation.png" width="80" height="80px">
            		</div>
            		<br><br>
            		<div class="subtitle_subtitle">
            			등록된 문의가 없습니다.
            		</div>
            	</div>
            </c:otherwise>
            </c:choose>
            </div>
        </div>
				<!-- 팝업 부분 -->
                        <div id="popup01">
							<div class="close">CLOSE</div>
							<form action="qnaanswersave" method="post" name="qnaanswerform" id="qnaanswerform">
								<div class="qna_box">
									<div class="subtitle">상품 Q&A 답변</div>
									<div style="height: 20px;"></div>
								 	<input type="hidden" name="product_num" value="" id="ans_product_num">
								 	<input type="hidden" name="reply_origin_number" value="" id="ans_reply_origin_number">
								 	<div class="png_qna">
								 		<img src="resources/letter-q.png">
								 		<span style="float: right;" id="ans_reporting_date"></span>
								 	</div>
									<div style="height: 20px;"></div>
								 	<div class="qna_question_content">
										<div class="subtitle_subtitle" style="font-size: 18px;" id="ans_product_name"></div>
										<div class="subtitle_subtitle" id="ans_content"></div>
								  	</div>
							    	<div class="reviewline"><hr size="3"></div>
							    	<div style="height: 20px;"></div>
							    	<div class="png_qna">
								 		<img src="resources/letter-a.png">
								 	</div>
								 	<div style="height: 20px;"></div>
							    	<div class="qna_answer_content">
									 	<div class="write_box">
									  		<textarea class="content" rows="" cols="" name="content" placeholder="답변을 등록해주세요."></textarea>
									  	</div>
									 </div>
								 	<div class="reviewline"><hr size="3"></div>
								 	<div class="btn_qna_submit">
								 		<button type="button" id="btn_qna_answer">답변 등록</button>
									</div>
								</div>
						 	</form>
						</div>
						<!-- 팝업 종료 -->		
						
			
    </div>
</body>

</html>