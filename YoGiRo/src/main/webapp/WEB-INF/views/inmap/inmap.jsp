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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    
</head>
<body id="body">
    <div class="container">
        
		<jsp:include page="header.jsp"></jsp:include>



        <main>
			<h1>inmap</h1>
			
			
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



        <jsp:include page="footer.jsp"></jsp:include>
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
</body>
</html>