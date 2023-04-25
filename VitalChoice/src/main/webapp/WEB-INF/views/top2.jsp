<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <meta charset="UTF-8">
    <c:choose>
        <c:when test="${param.result == 'loginfail'}">
            <script type="text/javascript">
                Swal.fire({
                    position: 'center',
                    icon: 'error',
                    title: '아이디 혹은 비밀번호가 틀림',
                    showConfirmButton: false,
                    timer: 1500
                })
            </script>
        </c:when>
    </c:choose>
    <title>Insert title here</title>
</head>
<header>
    <div id="logo" align="center">
        <a href="/web/">
            <img src="resources/logo5.png" width="450px" style="margin: 20px">
        </a>
    </div>
</header>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/web/">HOME</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active">
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">채팅<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="chatstart">채팅</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="memberinput">회원가입</a></li>
                        <li><a href="mypagemodify">정보수정</a></li>
                        <li><a href="mypageorder">주문내역</a></li>
                        <li><a href="mypagesubscribe">구독내역</a></li>
                        <li><a href="mypagegrade">구매등급</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">qr코드<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="qrcode">qr</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">드론<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="dronemap2">드론맵실전</a></li>
                        <li><a href="dronemap">드론맵샘플1</a></li>
                        <li><a href="dronemap3">드론맵샘플2</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">판매자관리<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="productinput">상품 등록</a></li>
                        <li><a href="productout?product_num=2">상품 확인</a></li>
                        <li><a href="productreview?product_num=2">리뷰등록</a></li>
                        <li><a href="incart">장바구니</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">쿠폰<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="couponcheck">쿠폰뽑기</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${login==true && user_dto != null}">
                        <li><a href="logout">${user_dto.user_id}님 환영합니다</a></li>
                        <li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="memberin"><span class="glyphicon glyphicon-user"></span>회원가입</a></li>
                        <li><a href="login"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>

</html>