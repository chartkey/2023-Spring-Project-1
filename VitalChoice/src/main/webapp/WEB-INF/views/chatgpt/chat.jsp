<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <style>
        footer {
            font-family: "맑은 고딕", "Malgun Gothic", sans-serif;
            font-size: 14px;
            background-color: #fff;
        }

        h3 {
            font-size: 24px;
            color: #fff;
            margin-top: 40px;
        }

        .chatbox {
            position: fixed;
            bottom: 0;
            right: 0;
            max-width: 400px;
            width: 100%;
            background-color: #fff;
            border-top: 1px solid #ddd;
        }

        .chatbox .chatbox-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            background-color: #2db400;
            color: #fff;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
        }

        .chatbox .chatbox-header h4 {
            margin: 0;
        }

        .chatbox .chatbox-header .icon {
            font-size: 24px;
            margin-right: 10px;
        }

        .chatbox .chatbox-body {
            display: none;
            padding: 10px;
            overflow-y: scroll;
            max-height: 300px;
        }

        .chatbox .chatbox-body .message {
            margin-bottom: 10px;
        }

        .chatbox .chatbox-body .message .bubble {
            display: inline-block;
            max-width: 200px;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 14px;
            line-height: 1.4;
        }

        .chatbox .chatbox-body .message .bubble.me {
            background-color: #2db400;
            color: #fff;
            float: right;
        }

        .chatbox .chatbox-body .message .bubble.you {
            background-color: #f5f5f5;
            color: #333;
            float: left;
        }

        .chatbox .chatbox-body .message .question {
            clear: both;
            margin-bottom: 5px;
            color: #2db400;
        }

        .chatbox .chatbox-body .message .answer {
            clear: both;
            margin-bottom: 5px;
        }

        .chatbox .chatbox-footer {
            display: flex;
            align-items: center;
            padding: 10px;
            border-top: 1px solid #ddd;
        }

        .chatbox .chatbox-footer input[type="text"] {
            flex-grow: 1;
            padding: 10px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            margin-right: 10px;
        }

        .chatbox.chatbox .chatbox-footer input[type="text"]::placeholder {
            color: #999;
        }

        .chatbox .chatbox-footer button {
            padding: 10px 20px;
            background-color: #2db400;
            color: #fff;
            border: none;
            border-radius: 20px;
            cursor: pointer;
        }

        .chatbox .chatbox-footer button:hover {
            background-color: #248c00;
        }
    </style>
    <script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <script type="text/javascript">
    $(document).ready(function() {
        // 채팅박스 열기/닫기
        $('.chatbox .chatbox-header').click(function() {
            $('.chatbox .chatbox-body').slideToggle();
        });

        // 메시지 전송
        $('.chatbox-footer button').click(function() {
            var message = $('.chatbox-footer input[type="text"]').val();
            if ($.trim(message) != '') {
                $('.chatbox .chatbox-body').show(); // 추가
                $.ajax({
                    type : 'post',
                    url : 'chatout',
                    data : {'message': message},
                    success : function(data) {
                        $('.chatbox-body').append('<div class="message"><div class="question">' + message + '</div></div>');
                        $('.chatbox-body').append('<div class="message"><div class="answer">' + data + '</div></div>');
                        $('.chatbox-body').scrollTop($('.chatbox-body')[0].scrollHeight);
                        $('.chatbox-footer input[type="text"]').val('');
                    }
                });
            }
        });

        // 엔터키로 메시지 전송
        $('.chatbox-footer input[type="text"]').keypress(function(event) {
            if (event.keyCode == 13) {
                $('.chatbox-footer button').click();
            }
        });
    });
</script>
    <title>Insert title here</title>
</head>

<footer>
    <div class="chatbox">
        <div class="chatbox-header">
            <i class="icon fa fa-chevron-down"></i>
            <h4>바이탈초이스 AI상담</h4>
        </div>
        <div class="chatbox-body">
        </div>
        <div class="chatbox-footer">
            <input type="text" placeholder="증상을 입력해주세요">
            <button>전송</button>
        </div>
    </div>
</footer>

</html>