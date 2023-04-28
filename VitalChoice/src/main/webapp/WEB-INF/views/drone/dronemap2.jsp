<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>선의 거리 계산하기</title>
    <style>
        .wrapper {
            width: 1200px;
            margin: 0 auto;
        }

        #wrapper_middle {
            width: 1200px;
            height: 220px;
        }

        .dot {
            overflow: hidden;
            float: left;
            width: 12px;
            height: 12px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
        }

        .dotOverlay {
            position: relative;
            bottom: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            border-bottom: 2px solid #ddd;
            float: left;
            font-size: 12px;
            padding: 5px;
            background: #fff;
        }

        .dotOverlay:nth-of-type(n) {
            border: 0;
            box-shadow: 0px 1px 2px #888;
        }

        .number {
            font-weight: bold;
            color: #ee6152;
        }

        .dotOverlay:after {
            content: '';
            position: absolute;
            margin-left: -6px;
            left: 50%;
            bottom: -8px;
            width: 11px;
            height: 8px;
            background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
        }

        .distanceInfo {
            position: relative;
            top: 5px;
            left: 5px;
            list-style: none;
            margin: 0;
        }

        .distanceInfo .label {
            display: inline-block;
            width: 50px;
        }

        .distanceInfo:after {
            content: none;
        }

        .info_weather {
            margin: 30px 0 20px 0;
            height: 90px;
        }

        .info_drone_img {
            float: left;
            margin-left: 8%;

        }

        @keyframes slide {
            from {
                margin-left: 8%;
            }

            to {
                margin-left: 87%;
            }
        }

        .info_drone_img img {
            height: 70px;
            width: 70px;

        }

        .info_drone_detail {
            float: left;
        }

        .progress-bar {
            border-radius: 7px;
            margin-left: 10%;
            margin-bottom: 10px;
            width: 80%;
            height: 14px;
            background-color: #DDDDDD;
            float: left;
            font-weight: 600;
            font-size: .8rem;

        }

        .progress-bar .progress {
            border-radius: 7px;
            height: 14px;
            padding: 0;
            text-align: center;
            background-color: #62CDFF;
            color: #111;
            width: 0%;
        }

        @keyframes progress {
            from {
                width: 0%;
            }

            to {
                width: 100%;
            }
        }

        .bar_del_start {
            float: left;
            margin-left: 8%;
        }

        .bar_del_finish {
            float: right;
            margin-right: 8%;
        }

        .strong_time {
            font-size: 16px;
            font-weight: 500;
            color: #62CDFF;
        }

        #result {
            margin: 20px 0 10px 0;
        }

        #result2 {
            text-align: left;
            position: absolute;
            color: white;
            font-weight: 700;
            font-size: 20px;
            z-index: 3;
            top: 10px;
            left: 10px;
        }

        #logomap {
            position: absolute;
            z-index: 3;
            bottom: 10px;
            right: 10px;
            height: 50px;
        }

        .del_status {
            margin-bottom: 10px;
        }

        #map {
            position: relative;
        }

        #roadview {
            position: absolute;
            width: 355px;
            height: 200px;
            bottom: 0px;
            left: 0px;
            z-index: 3;
            border-top: 3px solid white;
            border-right: 3px solid white;
        }
    </style>
</head>

<body>
    <div class="wrapper">
        <div id="wrapper_middle">
            <div id="result"></div>
            <div class="info_weather">

                <div class="info_drone_img"><img src="resources/drone-delivery.png"></div>
                <div class="info_drone_detail">
                    <!--    <div id="result2"></div> -->
                    <div id="result"></div>
                </div>
            </div>
            <div class="progress-bar">
                <div class="progress"> </div>
            </div>
            <div class="del_status">
                <div class="bar_del_start">배송시작</div>

                <div class="bar_del_finish">배송완료</div>
            </div>
            <br>

        </div>
        <div id="map" style="width:100%;height:500px;">
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d28959b826098a0fe9cdf0a9d72e7be0&libraries=services"></script>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


            <script>
                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                    mapOption = {
                        center: new kakao.maps.LatLng(37.2656768667795, 127.000096053009), // 지도의 중심좌표
                        level: 6 // 지도의 확대 레벨
                    };
                // 지도를 생성합니다  
                var map = new kakao.maps.Map(mapContainer, mapOption);
                map.setMapTypeId(kakao.maps.MapTypeId.HYBRID);
                // 주소-좌표 변환 객체를 생성합니다
                var geocoder = new kakao.maps.services.Geocoder();
                //오늘날짜
                var today = new Date();
                var year = today.getFullYear();
                var month = ('0' + (today.getMonth() + 1)).slice(-2);
                var day = ('0' + today.getDate()).slice(-2);
                var todayFormat = year + month + day; // "20230330"
                //
                var currentHour = today.getHours().toString().padStart(2, '0');
                var currentTime = currentHour + '00';
                // 주소로 좌표를 검색합니다
                $(function() {
                    $("#add1").ready(function() {
                        var address1 = $("#address1").val();
                        document.getElementById("seachform").style.display = "none";
                        geocoder.addressSearch(address1, function(result, status) {
                            // 정상적으로 검색이 완료됐으면 
                            if (status === kakao.maps.services.Status.OK) {
                                var x1 = 37.2656768667795;
                                var y1 = 127.000096053009;
                                var point1 = new kakao.maps.LatLng(x1, y1);
                                // 출발 마커
                                var startSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
                                    startSize = new kakao.maps.Size(60, 55), // 출발 마커이미지의 크기입니다 
                                    startOption = {
                                        offset: new kakao.maps.Point(20, 50) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
                                    };
                                // 출발 마커 이미지를 생성합니다
                                var startImage = new kakao.maps.MarkerImage(startSrc, startSize, startOption);
                                // 출발 마커를 생성합니다
                                var startMarker = new kakao.maps.Marker({
                                    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
                                    position: point1,
                                    draggable: false, // 출발 마커가 드래그 가능하도록 설정합니다
                                    image: startImage // 출발 마커이미지를 설정합니다
                                });
                                // 수정되는 10초마다 좌표
                                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                var x = coords.getLat();
                                var y = coords.getLng();
                                // 최종 도착 마커
                                var arriveSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
                                    arriveSize = new kakao.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
                                    arriveOption = {
                                        offset: new kakao.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
                                    };
                                // 최종 도착 마커 이미지를 생성합니다
                                var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
                                var arriveMarker = new kakao.maps.Marker({
                                    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
                                    position: coords,
                                    draggable: true, // 도착 마커가 드래그 가능하도록 설정합니다
                                    image: arriveImage // 도착 마커이미지를 설정합니다
                                });
                                // 경로 라인 설정
                                var polyline = new kakao.maps.Polyline({
                                    path: [point1, coords], // 선을 구성하는 좌표 배열
                                    strokeWeight: 10, // 선의 두께
                                    strokeColor: '#FF0000', // 선의 색깔
                                    strokeOpacity: 0.7, // 선의 투명도
                                    strokeStyle: 'solid' // 선의 스타일
                                });
                                polyline.setMap(map);
                                // 직선거리, 드론소요시간
                                var distance = (polyline.getLength()) | 0;
                                var dronTime = distance / 1675 | 0;

                                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                                map.setCenter(coords);
                                // 10초마다 이동할 위도와 경도 값
                                var dx = (x - x1) / (dronTime * 6);
                                var dy = (y - y1) / (dronTime * 6);
                                // 중간지점
                                var x2 = (x1 + x) / 2 | 0;
                                var y2 = (y1 + y) / 2 | 0;
                                //
                                var xhr = new XMLHttpRequest();
                                var url = 'https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst'; /*URL*/
                                var queryParams = '?' + encodeURIComponent('serviceKey') + '=' + 'ZbfhLf%2BaEwtosSqEzsti%2B%2FnIOgqOHz1VqGQXTR%2BmtQ3U534zc7rhTN%2BxDgOi7G6Ggl6GfYVghMLzuQvSZab0Cg%3D%3D'; /*Service Key*/
                                queryParams += '&' + encodeURIComponent('pageNo') + '=' + encodeURIComponent('1'); /**/
                                queryParams += '&' + encodeURIComponent('numOfRows') + '=' + encodeURIComponent('1000'); /**/
                                queryParams += '&' + encodeURIComponent('dataType') + '=' + encodeURIComponent('XML'); /**/
                                queryParams += '&' + encodeURIComponent('base_date') + '=' + encodeURIComponent(todayFormat); /**/
                                queryParams += '&' + encodeURIComponent('base_time') + '=' + encodeURIComponent('0500'); /**/
                                queryParams += '&' + encodeURIComponent('nx') + '=' + encodeURIComponent(x2); /**/
                                queryParams += '&' + encodeURIComponent('ny') + '=' + encodeURIComponent(y2); /**/
                                xhr.open('GET', url + queryParams);
                                xhr.send();

                                xhr.onreadystatechange = function() {
                                    if (this.readyState == 4 && this.status == 200) {
                                        var response = this.responseXML;
                                        var items = response.getElementsByTagName('item');
                                        var POP = null;
                                        var VEC = null;
                                        var WSD = null;

                                        for (var i = 0; i < items.length; i++) {
                                            var item = items[i];
                                            var category = item.getElementsByTagName('category')[0].textContent;
                                            var fcstDate = item.getElementsByTagName('fcstDate')[0].textContent;
                                            var fcstTime = item.getElementsByTagName('fcstTime')[0].textContent;
                                            var fcstValue = item.getElementsByTagName('fcstValue')[0].textContent;
                                            if ( // VEC 풍향,WSD 풍속, POP 강수확률
                                                category === 'POP' &&
                                                fcstDate === todayFormat &&
                                                fcstTime === currentTime) {
                                                POP = fcstValue;
                                            } else if (
                                                category === 'VEC' &&
                                                fcstDate === todayFormat &&
                                                fcstTime === currentTime) {
                                                VEC = fcstValue;
                                                var direction = Math.round(VEC / 22.5);
                                                var bang = null;
                                                switch (direction) {
                                                    case 0:
                                                    case 16:
                                                        bang = "북";
                                                        break;
                                                    case 1:
                                                        bang = "북북동";
                                                        break;
                                                    case 2:
                                                        bang = "북동";
                                                        break;
                                                    case 3:
                                                        bang = "동북동";
                                                        break;
                                                    case 4:
                                                        bang = "동";
                                                        break;
                                                    case 5:
                                                        bang = "동남동";
                                                        break;
                                                    case 6:
                                                        bang = "남동";
                                                        break;
                                                    case 7:
                                                        bang = "남남동";
                                                        break;
                                                    case 8:
                                                        bang = "남";
                                                        break;
                                                    case 9:
                                                        bang = "남남서";
                                                        break;
                                                    case 10:
                                                        bang = "남서";
                                                        break;
                                                    case 11:
                                                        bang = "서남서";
                                                        break;
                                                    case 12:
                                                        bang = "서";
                                                        break;
                                                    case 13:
                                                        bang = "서북서";
                                                        break;
                                                    case 14:
                                                        bang = "북서";
                                                        break;
                                                    case 15:
                                                        bang = "북북서";
                                                        break;
                                                    default:
                                                        bang = "N/A"; // 16방위 계산이 실패한 경우
                                                        break;
                                                }
                                            } else if (
                                                category === 'WSD' &&
                                                fcstDate === todayFormat &&
                                                fcstTime === currentTime) {
                                                WSD = fcstValue;
                                                var windbigo = null;
                                                if (WSD < 4) {
                                                    windbigo = "보통";
                                                } else if (WSD < 9) {
                                                    windbigo = "약간강";
                                                } else if (WSD < 14) {
                                                    windbigo = "강";
                                                } else if (WSD >= 14) {
                                                    windbigo = "매우강";
                                                } else {
                                                    windbigo = "N/A";
                                                }
                                            }
                                        }
                                        document.getElementById("result2").innerHTML =
                                            '강수확률 : ' + POP + '% <br>풍향 : ' + bang + '<br>풍속 : ' + WSD + 'm/s(' + windbigo + ')';
                                    }
                                };
                                //
                                var arriveMarkers = [];
                                for (var i = 1; i <= (dronTime * 6); i++) {
                                    setTimeout(function() {
                                        x1 += dx;
                                        y1 += dy;
                                        var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
                                        var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
                                        var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
                                        var point3 = new kakao.maps.LatLng(x1, y1);
                                        roadviewClient.getNearestPanoId(point3, 50, function(panoId) {
                                            roadview.setPanoId(panoId, point3); //panoId와 중심좌표를 통해 로드뷰 실행
                                        });
                                        //
                                        var arriveSrc = 'resources/dron(w).png', // 도착 마커이미지 주소입니다    
                                            arriveSize = new kakao.maps.Size(40, 40), // 도착 마커이미지의 크기입니다 
                                            arriveOption = {
                                                offset: new kakao.maps.Point(10, 35) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
                                            };
                                        // 도착 마커 이미지를 생성합니다
                                        var arriveImage = new kakao.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);

                                        var arriveDragSrc = 'resources/dron(w).png', // 도착 마커의 드래그 이미지 주소입니다    
                                            arriveDragSize = new kakao.maps.Size(40, 40), // 도착 마커의 드래그 이미지 크기입니다 
                                            arriveDragOption = {
                                                offset: new kakao.maps.Point(10, 35) // 도착 마커의 드래그 이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
                                            };
                                        // 현재 도착 마커 위치로 지도중심 이동
                                        map.setCenter(point3);
                                        // 도착 마커의 드래그 이미지를 생성합니다
                                        var arriveDragImage = new kakao.maps.MarkerImage(arriveDragSrc, arriveDragSize, arriveDragOption);
                                        // 도착 마커를 생성합니다 
                                        var arriveMarker = new kakao.maps.Marker({
                                            position: point3, // 수정되는 좌표
                                            draggable: false, // 도착 마커가 드래그 가능하도록 설정합니다
                                            image: arriveImage // 도착 마커이미지를 설정합니다
                                        });
                                        arriveMarkers.push(arriveMarker);
                                        if (i > 1) {
                                            for (var t = 0; t < arriveMarkers.length; t++) {
                                                arriveMarkers[t].setMap(null);
                                            }
                                        }
                                        arriveMarker.setMap(map);

                                        document.getElementById('result').innerHTML =
                                            '두 지점 간의 배송 소요시간은 <span class="strong_time">약 ' + dronTime + '분</span> 입니다.(속력 100km/h기준), 직선거리 <span class="strong_time">약 ' + distance + 'm</span>';
                                        var cssVal1 = 'progress ' + parseInt(dronTime) * 12 + 's linear forwards';
                                        $(".progress").css('animation', cssVal1);
                                        var cssVal2 = 'slide ' + parseInt(dronTime) * 12 + 's linear forwards';
                                        $(".info_drone_img").css('animation', cssVal2);
                                    }, i * 2000);
                                }
                            }
                        });
                    });
                });
            </script>
            <div id="result2"></div>
            <div id="roadview"></div>
            <img id="logomap" src="resources/logo(white).png">
        </div>
        <div id="seachform">
            <input type="text" name="address1" id="address1" value="${delivery_address2}" style="width:300px;">
            <input type="button" value="배송지설정" id="add1">
        </div>
    </div>
</body>

</html>