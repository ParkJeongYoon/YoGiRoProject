<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>Document</title>
    <script src="${pageContext.request.contextPath}/docs/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/docs/js/examples-base.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/docs/js/highlight.min.js"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=06jpeuhp1j&amp;submodules=panorama"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/docs/css/examples-base.css" />
    <script>
        var HOME_PATH = '${pageContext.request.contextPath}/docs';
    </script>
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/inmap/inmap.css">

</head>
<body class="body">
    <div class="container">
        
		<jsp:include page="../includes/header.jsp"></jsp:include>



        <main>
        	<div style="display: flex; flex-direction: column;">
        		<div>
        			<h1>inmap</h1>
        		</div>
        		<div class="test-weather" style="display: flex; flex-direction: column;">
        			<!-- weather -->
        		</div>
        	</div>
			
			
		    <!-- ========================================================================= -->
		    <!-- ncp예제 -->
		    <!-- @category Map -->
			<style type="text/css">
			    #wrap .buttons { position:absolute;top:0;left:0;z-index:1000;padding:5px; }
			    #wrap .buttons .control-btn { margin:0 5px 5px 0; }
			</style>
			<div id="wrap" class="section" style="display: flex; justify-content: flex-end;">
			    <div id="map" style="width:50%;height:600px;"></div>
			    <!-- <code id="snippet" class="snippet"></code> -->
			</div>
		    <!-- ========================================================================= -->
        	
        	
        </main>



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
		
		var map = new naver.maps.Map('map', {
		    center: new naver.maps.LatLng(${lat}.${latDecimal} , ${lng}.${lngDecimal}), //지도의 초기 중심 좌표
		    zoom: ${zoom}, //지도의 초기 줌 레벨
		    minZoom: 7, //지도의 최소 줌 레벨
		    zoomControl: true, //줌 컨트롤의 표시 여부
		    zoomControlOptions: { //줌 컨트롤의 옵션
		        position: naver.maps.Position.TOP_RIGHT
		    }
		});
		
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
	</script>
	<!-- ========================================================================= -->
	
	
	
	
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
    	
    	
		const testWeather = document.querySelector(".test-weather");
		let apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=  {{{APIKey}}}  &q=${city1}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
				name.innerHTML = "지역: " + cityNameTranslate(response.name);
				weather.innerHTML = "날씨: " + response.weather[0].description;
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
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=  {{{APIKey}}}  &q=${city2}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
				name.innerHTML = "지역: " + cityNameTranslate(response.name);
	            weather.innerHTML = "날씨: " + response.weather[0].description;
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
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=  {{{APIKey}}}  &q=${city3}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
				name.innerHTML = "지역: " + cityNameTranslate(response.name);
	            weather.innerHTML = "날씨: " + response.weather[0].description;
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
	    
	    
		apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=  {{{APIKey}}}  &q=${city4}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	            const weatherDiv = document.createElement("div");
	        	const cityDiv = document.createElement("div");
	            const name = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
				name.innerHTML = "지역: " + cityNameTranslate(response.name);
	            weather.innerHTML = "날씨: " + response.weather[0].description;
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

</body>
</html>