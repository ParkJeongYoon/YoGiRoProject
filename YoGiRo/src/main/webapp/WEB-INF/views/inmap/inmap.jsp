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
		const testWeather = document.querySelector(".test-weather");
		var apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=&q=${city1}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	const cityDiv = document.createElement("div");
	            const weatherDiv = document.createElement("div");
	            const city = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
	            const tempMin = document.createElement("p");
	            const tempMax = document.createElement("p");
	            const tempPressure = document.createElement("p");
	            const tempHumidity = document.createElement("p");
	            const windSpeed = document.createElement("p");
	            const windDeg = document.createElement("p");
	            const cloudsAll = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
	            city.innerHTML = "지역: " + response.name + " / ";
	            weather.innerHTML = "날씨: " + response.weather[0].description + " / ";
	            icon.setAttribute("src" , "http://openweathermap.org/img/wn/" + response.weather[0].icon + ".png");
	            temp.innerHTML = "기온: " + response.main.temp + " / ";
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like + " / ";
	            tempMin.innerHTML = "최저기온: " + response.main.temp_min + " / ";
	            tempMax.innerHTML = "최고기온: " + response.main.temp_max + " / ";
	            tempPressure.innerHTML = "대기압: " + response.main.pressure + " / ";
	            tempHumidity.innerHTML = "습도: " + response.main.humidity + " / ";
	            windSpeed.innerHTML = "풍속: " + response.wind.speed + " / ";
	            windDeg.innerHTML = "풍향: " + response.wind.deg + " / ";
	            cloudsAll.innerHTML = "구름: " + response.clouds.all;
	            cityDiv.append(city);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            cityDiv.append(feelsLike);
	            cityDiv.append(tempMin);
	            cityDiv.append(tempMax);
	            cityDiv.append(tempPressure);
	            cityDiv.append(tempHumidity);
	            cityDiv.append(windSpeed);
	            cityDiv.append(windDeg);
	            cityDiv.append(cloudsAll);
	            testWeather.append(cityDiv);
	        }
	    });
		var apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=&q=${city2}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	const cityDiv = document.createElement("div");
	            const weatherDiv = document.createElement("div");
	            const city = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
	            const tempMin = document.createElement("p");
	            const tempMax = document.createElement("p");
	            const tempPressure = document.createElement("p");
	            const tempHumidity = document.createElement("p");
	            const windSpeed = document.createElement("p");
	            const windDeg = document.createElement("p");
	            const cloudsAll = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
	            city.innerHTML = "지역: " + response.name + " / ";
	            weather.innerHTML = "날씨: " + response.weather[0].description + " / ";
	            icon.setAttribute("src" , "http://openweathermap.org/img/wn/" + response.weather[0].icon + ".png");
	            temp.innerHTML = "기온: " + response.main.temp + " / ";
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like + " / ";
	            tempMin.innerHTML = "최저기온: " + response.main.temp_min + " / ";
	            tempMax.innerHTML = "최고기온: " + response.main.temp_max + " / ";
	            tempPressure.innerHTML = "대기압: " + response.main.pressure + " / ";
	            tempHumidity.innerHTML = "습도: " + response.main.humidity + " / ";
	            windSpeed.innerHTML = "풍속: " + response.wind.speed + " / ";
	            windDeg.innerHTML = "풍향: " + response.wind.deg + " / ";
	            cloudsAll.innerHTML = "구름: " + response.clouds.all;
	            cityDiv.append(city);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            cityDiv.append(feelsLike);
	            cityDiv.append(tempMin);
	            cityDiv.append(tempMax);
	            cityDiv.append(tempPressure);
	            cityDiv.append(tempHumidity);
	            cityDiv.append(windSpeed);
	            cityDiv.append(windDeg);
	            cityDiv.append(cloudsAll);
	            testWeather.append(cityDiv);
	        }
	    });
		var apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=&q=${city3}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	const cityDiv = document.createElement("div");
	            const weatherDiv = document.createElement("div");
	            const city = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
	            const tempMin = document.createElement("p");
	            const tempMax = document.createElement("p");
	            const tempPressure = document.createElement("p");
	            const tempHumidity = document.createElement("p");
	            const windSpeed = document.createElement("p");
	            const windDeg = document.createElement("p");
	            const cloudsAll = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
	            city.innerHTML = "지역: " + response.name + " / ";
	            weather.innerHTML = "날씨: " + response.weather[0].description + " / ";
	            icon.setAttribute("src" , "http://openweathermap.org/img/wn/" + response.weather[0].icon + ".png");
	            temp.innerHTML = "기온: " + response.main.temp + " / ";
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like + " / ";
	            tempMin.innerHTML = "최저기온: " + response.main.temp_min + " / ";
	            tempMax.innerHTML = "최고기온: " + response.main.temp_max + " / ";
	            tempPressure.innerHTML = "대기압: " + response.main.pressure + " / ";
	            tempHumidity.innerHTML = "습도: " + response.main.humidity + " / ";
	            windSpeed.innerHTML = "풍속: " + response.wind.speed + " / ";
	            windDeg.innerHTML = "풍향: " + response.wind.deg + " / ";
	            cloudsAll.innerHTML = "구름: " + response.clouds.all;
	            cityDiv.append(city);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            cityDiv.append(feelsLike);
	            cityDiv.append(tempMin);
	            cityDiv.append(tempMax);
	            cityDiv.append(tempPressure);
	            cityDiv.append(tempHumidity);
	            cityDiv.append(windSpeed);
	            cityDiv.append(windDeg);
	            cityDiv.append(cloudsAll);
	            testWeather.append(cityDiv);
	        }
	    });
		var apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=&q=${city4}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	const cityDiv = document.createElement("div");
	            const weatherDiv = document.createElement("div");
	            const city = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
	            const tempMin = document.createElement("p");
	            const tempMax = document.createElement("p");
	            const tempPressure = document.createElement("p");
	            const tempHumidity = document.createElement("p");
	            const windSpeed = document.createElement("p");
	            const windDeg = document.createElement("p");
	            const cloudsAll = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
	            city.innerHTML = "지역: " + response.name + " / ";
	            weather.innerHTML = "날씨: " + response.weather[0].description + " / ";
	            icon.setAttribute("src" , "http://openweathermap.org/img/wn/" + response.weather[0].icon + ".png");
	            temp.innerHTML = "기온: " + response.main.temp + " / ";
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like + " / ";
	            tempMin.innerHTML = "최저기온: " + response.main.temp_min + " / ";
	            tempMax.innerHTML = "최고기온: " + response.main.temp_max + " / ";
	            tempPressure.innerHTML = "대기압: " + response.main.pressure + " / ";
	            tempHumidity.innerHTML = "습도: " + response.main.humidity + " / ";
	            windSpeed.innerHTML = "풍속: " + response.wind.speed + " / ";
	            windDeg.innerHTML = "풍향: " + response.wind.deg + " / ";
	            cloudsAll.innerHTML = "구름: " + response.clouds.all;
	            cityDiv.append(city);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            cityDiv.append(feelsLike);
	            cityDiv.append(tempMin);
	            cityDiv.append(tempMax);
	            cityDiv.append(tempPressure);
	            cityDiv.append(tempHumidity);
	            cityDiv.append(windSpeed);
	            cityDiv.append(windDeg);
	            cityDiv.append(cloudsAll);
	            testWeather.append(cityDiv);
	        }
	    });var apiURI = "https://api.openweathermap.org/data/2.5/weather?lang=kr&units=metric&appid=&q=${city5}";
		
	    $.ajax({
	        url: apiURI,
	        type: "GET",
	        dataType: "JSON",
	        success: function(response) {
	        	const cityDiv = document.createElement("div");
	            const weatherDiv = document.createElement("div");
	            const city = document.createElement("p");
	            const weather = document.createElement("p");
	            const icon = document.createElement("img");
	            const temp = document.createElement("p");
	            const feelsLike = document.createElement("p");
	            const tempMin = document.createElement("p");
	            const tempMax = document.createElement("p");
	            const tempPressure = document.createElement("p");
	            const tempHumidity = document.createElement("p");
	            const windSpeed = document.createElement("p");
	            const windDeg = document.createElement("p");
	            const cloudsAll = document.createElement("p");
				cityDiv.style.display = "flex";
				cityDiv.style.flexDirection = "row";
	            city.innerHTML = "지역: " + response.name + " / ";
	            weather.innerHTML = "날씨: " + response.weather[0].description + " / ";
	            icon.setAttribute("src" , "http://openweathermap.org/img/wn/" + response.weather[0].icon + ".png");
	            temp.innerHTML = "기온: " + response.main.temp + " / ";
	            feelsLike.innerHTML = "체감온도: " + response.main.feels_like + " / ";
	            tempMin.innerHTML = "최저기온: " + response.main.temp_min + " / ";
	            tempMax.innerHTML = "최고기온: " + response.main.temp_max + " / ";
	            tempPressure.innerHTML = "대기압: " + response.main.pressure + " / ";
	            tempHumidity.innerHTML = "습도: " + response.main.humidity + " / ";
	            windSpeed.innerHTML = "풍속: " + response.wind.speed + " / ";
	            windDeg.innerHTML = "풍향: " + response.wind.deg + " / ";
	            cloudsAll.innerHTML = "구름: " + response.clouds.all;
	            cityDiv.append(city);
	            cityDiv.append(weather);
	            cityDiv.append(icon);
	            cityDiv.append(temp);
	            cityDiv.append(feelsLike);
	            cityDiv.append(tempMin);
	            cityDiv.append(tempMax);
	            cityDiv.append(tempPressure);
	            cityDiv.append(tempHumidity);
	            cityDiv.append(windSpeed);
	            cityDiv.append(windDeg);
	            cityDiv.append(cloudsAll);
	            testWeather.append(cityDiv);
	        }
	    });
	</script>
	<!-- ========================================================================= -->

</body>
</html>