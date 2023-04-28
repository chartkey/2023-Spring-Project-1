<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>KakaoTalk Share Example</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script>
    Kakao.init('d28959b826098a0fe9cdf0a9d72e7be0'); // 발급받은 JavaScript 키를 입력해주세요.

    function shareKakao() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: '카카오톡 공유 예제',
          description: '이미지를 공유합니다.',
          imageUrl: document.querySelector('.sample img').src, // 공유할 이미지 파일의 경로를 입력합니다.
          link: {
            mobileWebUrl: 'https://developers.kakao.com',
            webUrl: 'https://developers.kakao.com'
          }
        },
        buttons: [
          {
            title: '카카오 개발자 사이트',
            link: {
              mobileWebUrl: 'https://developers.kakao.com',
              webUrl: 'https://developers.kakao.com'
            }
          }
        ]
      });
    }
  </script>
</head>
<body>
  <div class="sample">
    <img src="resources/dron.png">
  </div>
  <button onclick="shareKakao()">카카오톡으로 공유하기</button>
</body>
</html> --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>

<body>
    QR CODE
    <form action="qrcodeout" , method="get">
        <input type="text" name="url" />
        <input type="submit" value="생성">
    </form>
</body>

</html>