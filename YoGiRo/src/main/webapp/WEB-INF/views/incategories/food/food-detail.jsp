<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=q47hthbmmp&submodules=geocoder"></script>
<style>
<style>
main {
	width: 1600px;
}

body {
	display: flex;
	width: 100vw;
	flex-direction: column;
}
/* .container {
    position: relative;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    flex-direction: column;
    justify-content: center;
    max-width: 1600px;
    padding-right: 1.7rem;
    padding-left: 1.7rem;
} */
/* 사이드 메뉴바 */
aside {
	position: relative;
	height: 300px;
	width: 180px;
	margin-right: 30px;
	margin-top: 100px;
	display: inline-block;
}

#food_real_container {
	display: flex;
	flex-direction: column;
	width: 100%;
}

.sidemenubar {
	/*position: absolute;
      left: 0;
      top: 150px;*/
	
}

.sidemenubar>a>div {
	width: 180px;
	height: 47px;
	background-color: #FAFAFA;
	border: 1.3px solid #E7E7E7;
	display: flex;
	/*      justify-content: center;*/
	align-items: center;
}

.fa-angle-right {
	position: absolute;
	right: 10px;
}

h3 {
	font-weight: 500;
	margin-left: 50px;
}

p {
	font-weight: 500;
	font-size: 1.3rem;
}
/* 메인 */
main {
	margin-top: 50px;
	margin-left: 30px;
	width: 95%;
	height: 80%;
	position: relative;
	background-color: #fff;
	padding: 40px;
	border-radius: 30px;
}

main>h1 {
	margin-left: 20px;
}

/* 세부페이지 설정  */
#title {
	border-bottom: 1px solid gray;
	display: inline-block;
	border-width: 30%;
	margin-left: 10px;
	font-weight: bold;
}

#common-img {
	width: 600px;
	height: 400px;
	border-radius: 30px;
}

hr {
	border: 1px solid #ccc;
}

#food_detail_container{
	display :flex;
}

#food_detail_img{

	width : 50%;
}
#detail_img{
	border-radius : 30px;

}
#food_detail_overview{
	padding : 20px;
	width : 50%;
}
#overview{
	font-weight : bold;
}
/* 맵 div */
#map {
	width: 90%;
	height: 400px;
	border-radius :15px;
}
#imgandmap_container{
	display: grid;
	/* display: inline-grid; */
	grid-template-columns: 1fr 1fr;
	row-gap: 10px;
	
}
</style>
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../../includes/header.jsp"></jsp:include>



		<main>
			<h1>음식점</h1>
			<br /><br /><br /><br />
			<p id="title">${foodtodetailpage.title}</p>
			<br /><br /><br /> 
			<div id="imgandmap_container">
				<c:if test="${foodtodetailpage.firstimage != null}">
					<img id="common-img"
					src="${foodtodetailpage.firstimage}" alt="" /> 
				
				</c:if>
			
				<!-- 네이버 지도 -->
				<div id="map"></div>
			</div>
			<br />
			<br /><br />
			<hr />
			<br><br><br><br>
			<p>음식점명 : ${foodtodetailpage.title}</p>
			<c:if test="${foodtodetailpage.infocenterfood != null}">
				<p>전화번호 : ${foodtodetailpage.infocenterfood}</p>
			
			</c:if>
			
			<br><br />
			<br />
			<br /><br />
			<hr />
			<br><br>
			<h2>개요</h2>
			<br><br />

			<p>${foodtodetailpage.overview}</p>
			<br /><br /><br /><br /><br /><br />
			<hr />
			<br /><br /><br /><br /><br /><br />
			<c:if test="${foodtodetailpage.parkingfood != null}">
				<p>주차 시설 : ${foodtodetailpage.parkingfood}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.opentimefood != null}">
				<p>영업 시간 : ${foodtodetailpage.opentimefood}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.restdatefood != null}">
				<p>쉬는 날 : ${foodtodetailpage.restdatefood}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.firstmenu != null}">
				<p>대표 메뉴 : ${foodtodetailpage.firstmenu}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.treatmenu != null}">
				<p>취급 메뉴 : ${foodtodetailpage.treatmenu}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.chkcreditcardfood != null}">
				<p>신용 카드 정보 : ${foodtodetailpage.chkcreditcardfood}</p>
			
			</c:if>
			<c:if test="${foodtodetailpage.lcnsno != null}">
				<p>인허가번호 : ${foodtodetailpage.lcnsno}</p>
			
			</c:if>
			<br /><br /><br /><br /><br /><br />
			<hr />
			<br /><br /><br />

			<c:set var="i" value="1" />

			
		<jsp:include page="../../comments/food_comments.jsp" ></jsp:include>
		<br><br><br><br><br>
		</main>  

		 
		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		/* 네이버 지도 api */
		let y = ${foodtodetailpage.mapy};
		let x = ${foodtodetailpage.mapx};
		/* let level = ${festatodetailpage.mlevel}; */
		
		var position = new naver.maps.LatLng(y, x);
	
		var map = new naver.maps.Map('map', {
		    center: position,
		    zoom: 10
		});
	
		var markerOptions = {
		    position: position,
		    map: map,
		    icon: {
		    	url : '${pageContext.request.contextPath}/img/mapmarker/red-marker40.png',
		        size: new naver.maps.Size(40, 40),
		        anchor: new naver.maps.Point(20, 40)
		    }
		};
	
		var marker = new naver.maps.Marker(markerOptions);
	</script>
</body>
</html>