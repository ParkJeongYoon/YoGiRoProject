<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no">
<title>Document</title>
<script src="${pageContext.request.contextPath}/docs/js/jquery-1.9.1.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/docs/js/examples-base.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/docs/js/highlight.min.js"></script> --%>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q47hthbmmp&amp;submodules=geocoder"></script>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/docs/css/examples-base.css" /> --%>
<script>
	var HOME_PATH = '${pageContext.request.contextPath}/docs';
</script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inmap/inmap.css">
<style type="text/css">
.main-container {
	display: flex;
	width: 100%;
	height: 90vh;
	margin-top: 90px;
}

/* 왼쪽 사이드메뉴 */
aside {
	position: relative;
	height: 80vh;
	width: 30%;
	margin-right: 30px;
}

/* 메인 컨텐츠 */
main {
	width: 70%;
	height: 87vh;
	background-color: #e7e7e7;
	position: relative;
}

.test-weather {
	height: 135px;
	padding-left: 15px;
}

.test-weather > div {
	margin-right: 20px;
	margin-bottom: 20px;
	background-color: #fff;
	border-radius: 15px;
	padding: 10px;
	height: 120px;
}

#wrap {
	justify-content: center;
}

#map {
	width: 62vw;
	height: 68vh;
	margin-bottom: 2%;
	position: relative;
}

/* 오른쪽 버튼바 */
input[type='checkbox']:checked+label {
	background: #007bff;
	color: #fff;
	box-sizing: border-box;
}

.btn-container {
	position: absolute;
	top: 10px;
	right: 10px;
	z-index: 1000;
	width: 70px;
	background-color: #fff;
	position: absolute;
/* 	top: 40%;
	right: 5%; */
	display: flex;
	flex-direction: column;
	border-radius: 15px;
	border: 1px solid #6E6E6E;
}

.btn-container > label {
	display: inline-block;
	width: 70px;
	text-align: center;
}

.content {
	height: 87vh;
}

.btnbar {
	width: 50px;
	padding: 20px 10px;
	border-bottom: 1px solid #A6A6A6;
	text-align: center;
}

.btnbar1 {
	width: 50px;
	padding: 20px 10px;
	border-bottom: 1px solid #A6A6A6;
	text-align: center;
	border-radius: 15px 15px 0 0;
}

.btnbar2 {
	width: 50px;
	text-align: center;
	padding: 20px 0;
	border-radius: 0 0 15px 15px;
}

.side {
	width: 100%;
	height: 33%;
	background-color: #e7e7e7;
	border-radius: 5px;
	margin-bottom: 30px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 1% 3%;
	justify-content: space-around;
	padding: 15px;
	align-self: start;
	align-content: space-around;
}

.course_p, .food_p {
	visibility: hidden;
	color: #fff;
	font-size: 0.9rem;
	/* height: 70px; */
	width: 80px;
	overflow: hidden;
  	text-overflow: ellipsis;
  	white-space: normal;
  	line-height: 0.9rem;
  	max-height: 70px;
  	word-wrap: break-word; 
  	display: -webkit-box; 
  	-webkit-line-clamp: 3; 
  	-webkit-box-orient: vertical;
}

.food, .course {
	width: 100%;
	height: 70px;
	background-color: #fff;
}
.backcolor {
	width: 100%;
	height: 70px;
	display: flex;
	visibility: hidden;
	text-align: center;
	justify-content: center;
	align-items: center;
}
.course_image:hover .backcolor, .food_image:hover .backcolor {
	visibility: visible;
	background-color: rgba(0, 0, 0, 0.5);
}

.course_image:hover .course_p, .food_image:hover .food_p {
	visibility: visible;
}

.course_image, .food_image{
	display: flex;
	width: 100%;
	height: 70px;
}
</style>
</head>
<body class="body">
	<div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="side-food side">
					<c:forEach var="i" begin="3" end="8">
						<div class="food-container">
							<a href="food_detail?contentid=${foodList[i].contentid}&themecode=3" class="food">
								<div class="food_image" style="background: center / cover no-repeat url('${foodList[i].firstimage}')">
									<div class="backcolor">
										<p class="food_p">${foodList[i].title}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="side-fasta side">
					<c:forEach var="i" begin="3" end="8">
						<div class="food-container">
							<a href="food_detail?contentid=${foodList[i].contentid}&themecode=3" class="food">
								<div class="food_image" style="background: center / cover no-repeat url('${foodList[i].firstimage}')">
									<div class="backcolor">
										<p class="food_p">${foodList[i].title}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="side-course side">
					<c:forEach var="i" begin="3" end="8">
						<div class="course-container">
							<a href="course_detail?contentid=${commonList[i].contentid}&themecode='2'" class="course">
								<div class="course_image" style="background: center / cover no-repeat url('${commonList[i].firstimage}')">
									<div class="backcolor">
										<p class="course_p">${commonList[i].title}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
				</div>
			</aside>
			<main>
				<div class="content" style="display: flex; flex-direction: column;">
					<div class="test-weather" style="display: flex; flex-direction: row;">
							<!-- weather -->
					</div>
					<div class="map-container">
					<!-- @category Map -->
						<div id="wrap" style="display: flex;">
							<div class="map-con">
								<div id="map">
									<div class="btn-container">
										<input type="checkbox" id="oasis-btn" style="display: none;"> 
										<label for="oasis-btn" class="btnbar1">휴게소</label> 
										<input type="checkbox" id="petrol-btn" style="display: none;"> 
										<label for="petrol-btn" class="btnbar">주유소</label> 
										<input type="checkbox" id="accident-btn" style="display: none;"> 
										<label for="accident-btn" class="btnbar2">돌발상황</label>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	<!-- ========================================================================= -->
	<!-- ncp예제 -->
	<script id="code">
		var HOME_PATH = window.HOME_PATH || '.',
		    urlPrefix = HOME_PATH +'/data/region',
		    urlSuffix = '.json',
		    regionGeoJson = [],
		    loadCount = 0;
		
		let areaArr1 = new Array(); // 지역을 담는 배열 ( 지역명/위도경도 )
		let areaArr2 = new Array();
		let areaArr3 = new Array();

		let restmarkers = new Array(); // 마커 정보를 담는 배열
		let pmarkers = new Array();
		let accmarkers = new Array();
		
		let infoWindows = new Array(); // 정보창을 담는 배열
		let accInfos = new Array();

		let arrToPoint = new Array(); // 주소to좌표 담은 배열
		
		// 라벨 버튼 제어
		$("#weather-btn").change(function() {
			if ($(this).is(":checked")) { // 체크된 상태 
				console.log("선택");
			} else { // 체크 해제된 상태
				console.log("해체");
			}
		});

		$("#oasis-btn").change(function() {
			if ($(this).is(":checked")) { // 체크된 상태 
				showMarker1();
			} else { // 체크 해제된 상태
				hideMarker1();
			}
		});

		$("#petrol-btn").change(function() {
			if ($(this).is(":checked")) { // 체크된 상태 
				showMarker2();
			} else { // 체크 해제된 상태
				hideMarker2();
			}
		});

		$("#accident-btn").change(function() {
			if ($(this).is(":checked")) { // 체크된 상태 
				showMarker3();
			} else { // 체크 해제된 상태
				hideMarker3();
			}
		});
		
		// 지도
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(${lat}.${latDecimal} , ${lng}.${lngDecimal}), //지도의 초기 중심 좌표
		    zoom: ${zoom}, //지도의 초기 줌 레벨
		    minZoom: 7 //지도의 최소 줌 레벨
		    // zoomControl: true, //줌 컨트롤의 표시 여부
		    // zoomControlOptions: { //줌 컨트롤의 옵션
		    //    position: naver.maps.Position.TOP_RIGHT
		    // }
		});
		
		// 빨간 테두리 오버레이
		naver.maps.Event.once(map, 'init', function () {
		    for (var i = 1; i < 18; i++) {
		        var keyword = i +'';
		
		        if (keyword.length === 1) {
		            keyword = '0'+ keyword;
		        }
		
		        $.ajax({
		            url: urlPrefix + keyword + urlSuffix,
		            success: function(idx) {
		                return function(geojson) {
		                    regionGeoJson[idx] = geojson;
		
		                    loadCount++;
		
		                    if (loadCount === 17) {
		                        startDataLayer();
		                    }
		                }
		            }(i - 1)
		        });
		    }
		});
		
		var tooltip = $('<div style="position:absolute;z-index:1000;padding:5px 10px;background-color:#fff;border:solid 2px #000;font-size:14px;pointer-events:none;display:none;"></div>');
		
		tooltip.appendTo(map.getPanes().floatPane);
		
		function startDataLayer() {
		    map.data.setStyle(function(feature) {
		        var styleOptions = {
		            fillColor: '#ff0000',
		            fillOpacity: 0.0001,
		            strokeColor: '#ff0000',
		            strokeWeight: 2,
		            strokeOpacity: 0.4
		        };
		
		        if (feature.getProperty('focus')) {
		            styleOptions.fillOpacity = 0.6;
		            styleOptions.fillColor = '#0f0';
		            styleOptions.strokeColor = '#0f0';
		            styleOptions.strokeWeight = 4;
		            styleOptions.strokeOpacity = 1;
		        }
		
		        return styleOptions;
		    });
		
		    regionGeoJson.forEach(function(geojson) {
		        map.data.addGeoJson(geojson);
		    });
		
		    map.data.addListener('click', function(e) {
		        var feature = e.feature;
		
		        if (feature.getProperty('focus') !== true) {
		            feature.setProperty('focus', true);
		        } else {
		            feature.setProperty('focus', false);
		        }
		    });
		
		    map.data.addListener('mouseover', function(e) {
		        var feature = e.feature,
		            regionName = feature.getProperty('area1');
		
		        tooltip.css({
		            display: '',
		            left: e.offset.x,
		            top: e.offset.y
		        }).text(regionName);
		
		        map.data.overrideStyle(feature, {
		            fillOpacity: 0.6,
		            strokeWeight: 4,
		            strokeOpacity: 1
		        });
		    });
		
		    map.data.addListener('mouseout', function(e) {
		        tooltip.hide().empty();
		        map.data.revertStyle();
		    });
		}
		
		// 휴게소, 주유소 api 데이터 총 3페이지 불러오기
		$(function com() {
			initMap1(1);
			initMap1(2);
			initMap1(3);

			initMap2(1);
			initMap2(2);
			initMap2(3);

			initMap3();
		});
	</script>
	<!-- ========================================================================= -->

	<!-- weatherAPI -->

	<script type="text/javascript">
    	function cityNameTranslate(engCityName) {
			let korCityName = "";
			if (engCityName == "Seoul") {korCityName = "서울특별시";}
			else if (engCityName == "Busan") {korCityName = "부산광역시";}
			else if (engCityName == "Daegu") {korCityName = "대구광역시";}
			else if (engCityName == "Incheon") {korCityName = "인천광역시";}
			else if (engCityName == "Gwangju") {korCityName = "광주광역시";}
			else if (engCityName == "Daejeon") {korCityName = "대전광역시";}
			else if (engCityName == "Ulsan") {korCityName = "울산광역시";}
			else if (engCityName == "Namyangju") {korCityName = "남양주시";}
			else if (engCityName == "Gimpo-si") {korCityName = "김포시";}
			else if (engCityName == "Osan") {korCityName = "오산시";}
			else if (engCityName == "Yeoncheon-gun") {korCityName = "연천군";}
			else if (engCityName == "Gangneung") {korCityName = "강릉시";}
			else if (engCityName == "Chuncheon") {korCityName = "춘천시";}
			else if (engCityName == "Inje") {korCityName = "인제군";}
			else if (engCityName == "Yanggu") {korCityName = "양구군";}
			else if (engCityName == "Chungju") {korCityName = "충주시";}
			else if (engCityName == "Koesan") {	korCityName = "괴산군";}
			else if (engCityName == "Cheongju-si") {korCityName = "청주시";}
			else if (engCityName == "Yeongdong") {korCityName = "영동군";}
			else if (engCityName == "Gongju") {korCityName = "공주시";}
			else if (engCityName == "Taian") {korCityName = "태안군";}
			else if (engCityName == "Boryeong") {korCityName = "보령시";}
			else if (engCityName == "Cheonan") {korCityName = "천안시";}
			else if (engCityName == "Muju") {korCityName = "무주군";}
			else if (engCityName == "Jeonju") {korCityName = "전주시";}
			else if (engCityName == "Sunchang-chodeunghakgyo") {korCityName = "순창군";}
			else if (engCityName == "Imsil") {korCityName = "임실군";}
			else if (engCityName == "Suncheon") {korCityName = "순천시";}
			else if (engCityName == "Mokpo") {korCityName = "목포시";}
			else if (engCityName == "Haenam") {korCityName = "해남군";}
			else if (engCityName == "Naju") {korCityName = "나주시";}
			else if (engCityName == "Pohang") {korCityName = "포항시";}
			else if (engCityName == "Gimcheon") {korCityName = "김천시";}
			else if (engCityName == "Gyeongsan-si") {korCityName = "경산시";}
			else if (engCityName == "Andong") {korCityName = "안동시";}
			else if (engCityName == "Changwon") {korCityName = "창원시";}
			else if (engCityName == "Hamyang") {korCityName = "함양군";}
			else if (engCityName == "Namhae") {korCityName = "남해군";}
			else if (engCityName == "Yangsan") {korCityName = "양산시";}
			else if (engCityName == "Jeju-do") {korCityName = "제주도특별자치도";}
			return korCityName;
    	}
    	
    	function weatherIconDovora(originIconCode) {
			let dovoraIconName = "";
			if (originIconCode == "01d") {dovoraIconName = "day_clear";}
			else if (originIconCode == "01n") {dovoraIconName = "night_half_moon_clear";}
			else if (originIconCode == "02d") {dovoraIconName = "day_partial_cloud";}
			else if (originIconCode == "02n") {dovoraIconName = "night_half_moon_partial_cloud";}
			else if (originIconCode == "03d") {dovoraIconName = "cloudy";}
			else if (originIconCode == "03n") {dovoraIconName = "cloudy";}
			else if (originIconCode == "04d") {dovoraIconName = "angry_clouds";}
			else if (originIconCode == "04n") {dovoraIconName = "angry_clouds";}
			else if (originIconCode == "09d") {dovoraIconName = "rain";}
			else if (originIconCode == "09d") {dovoraIconName = "rain";}
			else if (originIconCode == "10d") {dovoraIconName = "day_rain";}
			else if (originIconCode == "10n") {dovoraIconName = "night_half_moon_rain";}
			else if (originIconCode == "11d") {dovoraIconName = "thunder";}
			else if (originIconCode == "11n") {dovoraIconName = "thunder";}
			else if (originIconCode == "13d") {dovoraIconName = "snow";}
			else if (originIconCode == "13n") {dovoraIconName = "snow";}
			else if (originIconCode == "50d") {dovoraIconName = "mist";}
			else if (originIconCode == "50n") {dovoraIconName = "mist";}
			return dovoraIconName;
    	}
    	
    	// 날씨 html
		const testWeather = document.querySelector(".test-weather");
		let apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid= {{API인증키}} &q=${city1}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("b");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "column";
				name.innerHTML = cityNameTranslate(response.name);
				weather.innerHTML = response.weather[0].description;
	            icon.classList.add("weather-img");
	            icon.setAttribute("src" , "${pageContext.request.contextPath}/img/weather_icons_dovora_interactive/SVG/" + weatherIconDovora(response.weather[0].icon) + ".svg");
	            temp.innerHTML = "기온: " + response.main.temp;
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like;
	            cityDiv.append(name);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            let cityName = "${city2}";
	            if (cityName.length == 0) {
		            cityDiv.append(feelsLike);
		            testWeather.append(cityDiv);
				}else {
		            testWeather.append(cityDiv);
				}
	        }
	    });
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid= {{API인증키}} &q=${city2}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("b");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "column";
				name.innerHTML = cityNameTranslate(response.name);
	            weather.innerHTML = response.weather[0].description;
	            icon.classList.add("weather-img");
	            icon.setAttribute("src" , "${pageContext.request.contextPath}/img/weather_icons_dovora_interactive/SVG/" + weatherIconDovora(response.weather[0].icon) + ".svg");
	            temp.innerHTML = "기온: " + response.main.temp;
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like;
	            cityDiv.append(name);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            let cityName = "${city2}";
	            if (cityName.length == 0) {
		            cityDiv.append(feelsLike);
		            testWeather.append(cityDiv);
				}else {
		            testWeather.append(cityDiv);
				}
	        }
	    });
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid= {{API인증키}} &q=${city3}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("b");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "column";
				name.innerHTML = cityNameTranslate(response.name);
	            weather.innerHTML = response.weather[0].description;
	            icon.classList.add("weather-img");
	            icon.setAttribute("src" , "${pageContext.request.contextPath}/img/weather_icons_dovora_interactive/SVG/" + weatherIconDovora(response.weather[0].icon) + ".svg");
	            temp.innerHTML = "기온: " + response.main.temp;
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like;
	            cityDiv.append(name);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            let cityName = "${city2}";
	            if (cityName.length == 0) {
		            cityDiv.append(feelsLike);
		            testWeather.append(cityDiv);
				}else {
		            testWeather.append(cityDiv);
				}
	        }
	    });
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid= {{API인증키}} &q=${city4}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("b");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "column";
				name.innerHTML = cityNameTranslate(response.name);
	            weather.innerHTML = response.weather[0].description;
	            icon.classList.add("weather-img");
	            icon.setAttribute("src" , "${pageContext.request.contextPath}/img/weather_icons_dovora_interactive/SVG/" + weatherIconDovora(response.weather[0].icon) + ".svg");
	            temp.innerHTML = "기온: " + response.main.temp;
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like;
	            cityDiv.append(name);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            let cityName = "${city2}";
	            if (cityName.length == 0) {
		            cityDiv.append(feelsLike);
		            testWeather.append(cityDiv);
				}else {
		            testWeather.append(cityDiv);
				}
	        }
	    });
	    </script>

	<!-- ========================================================================= -->
	<!-- 휴게소, 주유소, 돌발상황 API -->
	<script type="text/javascript">
		// 휴게소 api
			function initMap1(index) {
				var apiURI = "http://data.ex.co.kr/openapi/locationinfo/locationinfoRest?key={{휴게소API인증키}}&type=json&numOfRows=99&pageNo="
						+ index;
				$.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(resp) {
						let areaArr = new Array();
						for (var i = 0; i < resp.list.length; i++) {
							areaArr1.push({
								unitName : resp.list[i].unitName,
								yValue : resp.list[i].yValue,
								xValue : resp.list[i].xValue
							});
							// restArrPush(areaArr[i]);
						} // for문
					}// success
				}) // ajax
			} // init 메소드

			// 주유소 api
			function initMap2(index) {
				var apiURI = "http://data.ex.co.kr/openapi/business/curStateStation?key= {{주유소API인증키}} &type=json&numOfRows=99&pageNo="
						+ index;
				$.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(resp) {
						let arr2 = new Array();
						for (var i = 0; i < resp.list.length; i++) {
							if (!($.isEmptyObject(resp.list[i].svarAddr))) {
								arr2.push(resp.list[i].svarAddr);
							}
						} // for문
						for (var i = 0; i < arr2.length; i++) {
							//areaArr2.push(arr2[i]);
							//test2(arr2[i]);
							searchAddressToCoordinate(arr2[i]);
						}
					}// success
				}) // ajax

			} // init 메소드

			// 돌발사고 api
			function initMap3() {
				var apiURI = "https://openapi.its.go.kr:9443/eventInfo?apiKey={{API인증키}}&type=all&eventType=all&getType=json";
				$.ajax({
					url : apiURI,
					dataType : "json",
					type : "GET",
					async : "false",
					success : function(resp) {
						for (var i = 0; i < resp.body.items.length; i++) {
							areaArr3.push({
								message : resp.body.items[i].message,
								eventType : resp.body.items[i].eventType,
								yValue : resp.body.items[i].coordY,
								xValue : resp.body.items[i].coordX
							});
						} // for문
					}// success
				}) // ajax
			} // init 메소드
			
			// 휴게소 마커
			function markermake1() {
				for (var i = 0; i < areaArr1.length; i++) {
					// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주기

					var restmarker = new naver.maps.Marker({
						map : map,
						title : areaArr1[i].unitName,
						position : new naver.maps.LatLng(areaArr1[i].yValue,
								areaArr1[i].xValue),
						icon : {
								url : '${pageContext.request.contextPath}/img/mapmarker/rest-area-icon322.png',
								// http://localhost:8080/prac/img/petrol-icon32.png				        
								size: new naver.maps.Size(32, 32),
								anchor : new naver.maps.Point(16, 32)
								}
					// 지역구의 위도 경도 넣기 
					});

					/* 정보창 */
					var infoWindow = new naver.maps.InfoWindow(
							{
								content : '<div style="width:180px;text-align:center;padding:10px;"><b>'
										+ areaArr1[i].unitName + '</b></div>',
								disableAnchor : true
								// position : 
							}); // 클릭했을 때 띄워줄 정보 HTML 작성

					restmarkers.push(restmarker); // 생성한 마커를 배열에 담는다.
					infoWindows.push(infoWindow); // 생성한 정보창을 배열에 담는다.
				} // for 문

				function getClickHandler(seq) {
					return function(e) {
						var restmarker = restmarkers[seq], infoWindow = infoWindows[seq];

						if (infoWindow.getMap()) {
							infoWindow.close();
						} else {
							infoWindow.open(map, restmarker);
						}
					}
				}

				for (var i = 0, ii = restmarkers.length; i < ii; i++) {
					naver.maps.Event.addListener(restmarkers[i], 'click',
							getClickHandler(i));

				}
			}
			
			// 주유소 마커
			function markermake2() {
				for (var i = 0; i < arrToPoint.length; i++) {
					// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주기

					var marker = new naver.maps.Marker({
						map : map,
						position : new naver.maps.LatLng(arrToPoint[i].y,
								arrToPoint[i].x),
						icon : {
							url : '${pageContext.request.contextPath}/img/mapmarker/petrol-icon32.png',
							//http://localhost:8080/prac/img/petrol-icon32.png				        
							size: new naver.maps.Size(32, 32),
							anchor : new naver.maps.Point(19, 32)
						}
					});
					pmarkers.push(marker); // 생성한 마커를 배열에 담는다.
				} // for 문

			}
			
			// 돌발상황 마커
			function markermake3() {
				for (var i = 0; i < areaArr3.length; i++) {
					// 지역을 담은 배열의 길이만큼 for문으로 마커와 정보창을 채워주기
					var accmarker = new naver.maps.Marker({
						map : map,
						title : areaArr3[i].eventType,
						position : new naver.maps.LatLng(areaArr3[i].yValue,
								areaArr3[i].xValue),
						icon : {
								url : '${pageContext.request.contextPath}/img/mapmarker/warning-icon32.png',
								//http://localhost:8080/prac/img/petrol-icon32.png				        
								size: new naver.maps.Size(32, 32),
								anchor : new naver.maps.Point(16, 32)
								}
					// 지역구의 위도 경도 넣기 
					});

					/* 정보창 */
					var infoWindow3 = new naver.maps.InfoWindow(
							{
								content : '<div style="width:80px;text-align:center;padding:10px;"><b>'
										+ areaArr3[i].eventType + '</b></div>',
								disableAnchor : true
							}); // 클릭했을 때 띄워줄 정보 HTML 작성
					accmarkers.push(accmarker); // 생성한 마커를 배열에 담는다.
					accInfos.push(infoWindow3); // 생성한 정보창을 배열에 담는다.
				} // for 문
				
				function getClickHandler(seq) {
					return function(e) {
						var accmarker = accmarkers[seq], infoWindow3 = accInfos[seq];

						if (infoWindow3.getMap()) {
							infoWindow3.close();
						} else {
							infoWindow3.open(map, accmarker);
						}
					}
				}
				for (var i = 0, ii = accmarkers.length; i < ii; i++) {
					naver.maps.Event.addListener(accmarkers[i], 'click',
							getClickHandler(i));
				}
			}
			
			/* 주소를 좌표로 바꿔주는 메소드 */
			function searchAddressToCoordinate(address) { // 주소와 마커의 위치를 위도, 경도를 받아와 지정
				naver.maps.Service.geocode({
					query : address
				// 쿼리(주소)를 받는다.
				}, function(status, response) {
					if (status === naver.maps.Service.Status.ERROR) { // 예외처리
						if (!address) {
							return alert('Geocode Error, Please check address');
						}
						return alert('Geocode Error, address:' + address);
					}
					var htmlAddresses = [], item = response.v2.addresses[0], point;

					try {
						if (response.v2.addresses[0].x) {
							point = new naver.maps.Point(item.x, item.y);

							htmlAddresses.push('[지번 주소] ' + item.jibunAddress);

							arrToPoint.push(point);
						}

					} catch (e) {
						console.log('Error: x값 없음');
					}

				});
			}
			
			/* 마커 제어 */
			function showMarker1() {
				markermake1();
				if (restmarkers[0].setMap()) {
					for (var i = 0; i < restmarkers.length; i++) {
						restmarkers[i].setMap(map);
					}
				}
			}
			function hideMarker1() {
				if (!restmarkers[0].setMap()) {
					for (var i = 0; i < restmarkers.length; i++) {
						restmarkers[i].setMap(null);
						infoWindows[i].setMap(null);
					}
				}
			}

			function showMarker2() {
				markermake2();
				if (pmarkers[0].setMap()) {
					for (var i = 0; i < pmarkers.length; i++) {
						pmarkers[i].setMap(map);
					}
				}
			}
			function hideMarker2() {
				if (!pmarkers[0].setMap()) {
					for (var i = 0; i < pmarkers.length; i++) {
						pmarkers[i].setMap(null);
					}
				}
			}
			
			function showMarker3() {
				markermake3();
				if (accmarkers[0].setMap()) {
					for (var i = 0; i < accmarkers.length; i++) {
						accmarkers[i].setMap(map);
					}
				}
			}
			function hideMarker3() {
				if (!accmarkers[0].setMap()) {
					for (var i = 0; i < accmarkers.length; i++) {
						accmarkers[i].setMap(null);
						accInfos[i].setMap(null);
					}
				}
			}
	</script>
</body>
</html>