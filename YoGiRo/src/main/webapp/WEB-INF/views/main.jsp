<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body class="body">
    <div class="container">
        
		<jsp:include page="includes/header.jsp"></jsp:include>



        <main>
            <section class="section1">
                <article class="article-l">
                    <div class="rok-thumbnail-box">
                    	<div class="rok-thumbnail-top">
                    		<div class="rok-thumbnail-title">
                    			<p>서울특별시</p>
                    		</div>
                    	</div>
                    	<div class="rok-thumbnail-main">
			                <img class="rok-thumbnail rok-thumbnail1" src="${pageContext.request.contextPath}/img/main/seoul/gyeongbokgung.jpg">
			                <img class="rok-thumbnail rok-thumbnail2" src="${pageContext.request.contextPath}/img/main/seoul/DDP.jpg">
			                <img class="rok-thumbnail rok-thumbnail3" src="${pageContext.request.contextPath}/img/main/seoul/skypark.bmp">
			                <img class="rok-thumbnail rok-thumbnail4" src="${pageContext.request.contextPath}/img/main/seoul/sauronseye.bmp">
                    	</div>
                    	<div class="rok-thumbnail-bottom">
                    		<div class="rok-thumbnail-content">
                    			<p>대한민국의 수도인 서울은 현대적인 고층 빌딩, 첨단 기술의 지하철, 대중문화와 사찰, 고궁, 노점상이 공존하는 대도시입니다. 주목할 만한 명소로는 곡선으로 이루어진 외관과 옥상 공원을 특징으로 하는 초현대적 디자인의 컨벤션 홀인 동대문디자인플라자, 한때 7,000여 칸의 방이 자리하던 경복궁, 회화나무와 소나무 고목이 있는 조계사가 있습니다.</p>
                    		</div>
                    	</div>
                    </div>
                </article>
                <article class="article-r">
					<%@ include file="ROK.html" %>
                </article>
            </section>
        </main>



        <jsp:include page="includes/footer.jsp"></jsp:include>
        
    </div>
    
    <script type="text/javascript">
	    const rokThumbnailTitle = document.querySelector(".rok-thumbnail-title");
	    const rokThumbnail1 = document.querySelector(".rok-thumbnail1");
	    const rokThumbnail2 = document.querySelector(".rok-thumbnail2");
	    const rokThumbnail3 = document.querySelector(".rok-thumbnail3");
	    const rokThumbnail4 = document.querySelector(".rok-thumbnail4");
	    const rokThumbnailContent = document.querySelector(".rok-thumbnail-content");
	
	    function reset() {
	    	rokThumbnailTitle.firstElementChild.remove();
	    	rokThumbnailContent.firstElementChild.remove();
	    }
	
	    document.querySelector("#CD11").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>서울특별시</p>";
	    	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/seoul/gyeongbokgung.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/seoul/DDP.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/seoul/skypark.bmp');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/seoul/sauronseye.bmp');
	    	
	    	rokThumbnailContent.innerHTML = "<p>대한민국의 수도인 서울은 현대적인 고층 빌딩, 첨단 기술의 지하철, 대중문화와 사찰, 고궁, 노점상이 공존하는 대도시입니다. 주목할 만한 명소로는 곡선으로 이루어진 외관과 옥상 공원을 특징으로 하는 초현대적 디자인의 컨벤션 홀인 동대문디자인플라자, 한때 7,000여 칸의 방이 자리하던 경복궁, 회화나무와 소나무 고목이 있는 조계사가 있습니다.</p>";
	    });
	
	    document.querySelector("#CD26").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>부산광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/busan/dongrae.bmp');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/busan/gwanganli.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/busan/southprot.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/busan/marinecity.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>부산광역시는 대한민국 동남부 해안에 위치한 광역시이다. 대한민국의 제2의 도시이자 최대의 해양 물류 도시이며, 부산항을 중심으로 해상 무역과 물류 산업이 발달하였다. 일본과는 대한해협과 쓰시마섬을 사이에 두고 마주하고 있다.</p>";
	    });
	
	    document.querySelector("#CD27").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>대구광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daegu/eworld83tower.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daegu/baekwon.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daegu/seomunmarket.bmp');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daegu/samunjin.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>대구광역시는 한반도 동남부 내륙에 있는 광역시이며, 대한민국 제3의 도시이다. 동쪽으로 경상북도 경산시, 영천시, 서쪽으로 고령군, 성주군, 북쪽으로 청송군, 군위군 남쪽으로 경상남도 창녕군과 인접한다.</p>";
	    });
	
	    document.querySelector("#CD28").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>인천광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/incheon/songdo.JPG');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/incheon/incheoninternationalairport.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/incheon/yeonpyeong.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/incheon/dolmen.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>인천광역시는 대한민국 서북부에 있는 광역시이다. 육지를 기준으로 북쪽으로 경기도 김포시, 동쪽으로 서울특별시 강서구, 경기도 부천시와 접해있으며, 남동쪽으로 경기도 시흥시, 서쪽으로 황해와 접한다.</p>";
	    });
	
	    document.querySelector("#CD29").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>광주광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gwangju/kiachampions.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gwangju/518.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gwangju/pungamlake.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gwangju/shimugiwaterfall.bmp');
	    	
	    	rokThumbnailContent.innerHTML = "<p>광주광역시는 대한민국의 남서부에 있는 광역시이다. 남동쪽으로 전라남도 화순군, 북동쪽으로 담양군, 서쪽으로 함평군, 서남쪽으로 나주시, 북쪽으로 장성군과 접한다. 시청 소재지는 서구 치평동이고, 행정 구역은 5구 95동이다.</p>";
	    });
	
	    document.querySelector("#CD30").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>대전광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daejeon/sciencepark.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daejeon/daecheonglake.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daejeon/oworld.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/daejeon/smallbrake.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>대전광역시는 대한민국의 중앙부에 있는 광역시이다. 경부고속철도, 경부선, 호남선 철도가 분기하고, 경부고속도로와 호남고속도로지선, 통영대전고속도로, 당진영덕고속도로 등 주요 고속도로가 연결되는 교통의 중심이다.</p>";
	    });
	
	    document.querySelector("#CD31").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>울산광역시</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/ulsan/yeongnamalps.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/ulsan/daewangampark.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/ulsan/milkyway.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/ulsan/anionpark.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>울산광역시는 대한민국 남동부 해안에 있는 광역시이다. 서쪽으로 경상남도 밀양시·양산시, 경상북도 청도군, 북쪽으로 경상북도 경주시, 남쪽으로 부산광역시 기장군과 접한다. 태화강이 도시를 가로질러 동해로 흐르며, 동해안에 울산항과 방어진항, 온산항이 위치한다.</p>";
	    });
	
	    document.querySelector("#CD36").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>충청남도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/boryeong.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/chullipo.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/doksan.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/unyeobeach.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>충청남도는 대한민국 중서부에 있는 도이다. 동쪽으로는 대전광역시, 세종특별자치시, 충청북도와 접하고, 서쪽은 황해가 있고, 남쪽으로는 전라북도, 북쪽으로는 경기도와 접한다. 행정구역은 8시 7군이다. 도청 소재지는 예산군과 홍성군 일원의 내포신도시이다.</p>";
	    });
	
	    document.querySelector("#CD41").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>경기도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeonggi/gapyeong.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeonggi/horsebackriding.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeonggi/oido.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeonggi/westseabridge.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>경기도는 대한민국의 북서부에 있는 도이다. 수도권의 서울특별시와 인천광역시를 둘러싸고 있고, 동쪽으로는 강원도, 서쪽으로 황해, 남쪽으로는 충청남도 및 충청북도, 북쪽으로는 조선민주주의인민공화국과 경계를 이룬다. 또한 도청 소재지는 수원시이고, 의정부시에 북부청사가 설치되어 있다.</p>";
	    });
	
	    document.querySelector("#CD42").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>강원도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gangwon/odaesan.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gangwon/daegwallyeong.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gangwon/hwanseoncave.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gangwon/sokcho.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>강원도는 대한민국의 북동부에 있는 도이다. 동쪽은 동해, 서쪽은 경기도, 남쪽은 충청북도·경상북도와 접하며, 북쪽은 북한의 강원도와 경계를 이루고 있다.</p>";
	    });
	
	    document.querySelector("#CD43").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>충청북도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungbuk/geumwolbong.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungbuk/sujeongsan.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungbuk/tangeumho.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungbuk/wollyubong.bmp');
	    	
	    	rokThumbnailContent.innerHTML = "<p>충청북도는 대한민국의 중부에 위치하는 도이다. 서쪽으로 대전광역시, 세종특별자치시, 충청남도, 동쪽으로 경상북도, 남쪽으로 전라북도, 북쪽으로 경기도, 강원도하고 접한다. 대한민국에서 유일하게 바다에 접하지 않은 도이자 해양경찰이 존재하지 않는다.</p>";
	    });
	
	    document.querySelector("#CD44").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>충청남도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/boryeong.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/chullipo.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/doksan.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/chungnam/unyeobeach.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>충청남도는 대한민국 중서부에 있는 도이다. 동쪽으로는 대전광역시, 세종특별자치시, 충청북도와 접하고, 서쪽은 황해가 있고, 남쪽으로는 전라북도, 북쪽으로는 경기도와 접한다. 행정구역은 8시 7군이다. 도청 소재지는 예산군과 홍성군 일원의 내포신도시이다.</p>";
	    });
	
	    document.querySelector("#CD45").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>전라북도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonbuk/buanobservatory.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonbuk/cheonilfalls.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonbuk/maisan.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonbuk/namwonobservatory.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>전라북도는 대한민국의 서남부에 있는 도이다. 서쪽은 황해에 면하고, 동쪽으로 경상남도·경상북도, 남쪽으로 전라남도, 북쪽으로는 충청남도·충청북도와 경계를 이룬다. 행정구역은 6시와 8군이다. 도청 소재지는 전주시이다.</p>";
	    });
	
	    document.querySelector("#CD46").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>전라남도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonnam/boseong.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonnam/gokseongobservatory.bmp');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonnam/haenam.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeonnam/teamuseum.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>전라북도는 대한민국의 서남부에 있는 도이다. 서쪽은 황해에 면하고, 동쪽으로 경상남도·경상북도, 남쪽으로 전라남도, 북쪽으로는 충청남도·충청북도와 경계를 이룬다. 행정구역은 6시와 8군이다. 도청 소재지는 전주시이다.</p>";
	    });
	
	    document.querySelector("#CD47").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>경상북도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongbuk/dokdo.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongbuk/gyeongju.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongbuk/samseonam.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongbuk/waterculturecenter.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>경상북도는 대한민국 동남부에 있는 도이다. 동쪽은 동해, 서쪽으로는 전라북도·충청북도, 남쪽으로는 대구광역시를 둘러싸며 울산광역시·경상남도와 접하고, 북쪽은 강원도와 경계를 이룬다. 행정구역은 10시 13군이며, 대한민국의 행정 구역 중 관할 면적이 가장 넓다.</p>";
	    });
	
	    document.querySelector("#CD48").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>경상남도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongnam/geoje.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongnam/haman.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongnam/hapcheon.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/gyeongnam/jinju.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>경상북도는 대한민국 동남부에 있는 도이다. 동쪽은 동해, 서쪽으로는 전라북도·충청북도, 남쪽으로는 대구광역시를 둘러싸며 울산광역시·경상남도와 접하고, 북쪽은 강원도와 경계를 이룬다. 행정구역은 10시 13군이며, 대한민국의 행정 구역 중 관할 면적이 가장 넓다.</p>";
	    });
	
	    document.querySelector("#CD50").addEventListener("mouseover" , function() {
	    	reset();
	    	
	    	rokThumbnailTitle.innerHTML = "<p>제주특별자치도</p>";
	
	    	rokThumbnail1.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeju/hanlla.jpg');
	    	rokThumbnail2.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeju/43.jpg');
	    	rokThumbnail3.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeju/ilchulbong.jpg');
	    	rokThumbnail4.setAttribute('src' , '${pageContext.request.contextPath}/img/main/jeju/cherryblossomroad.jpg');
	    	
	    	rokThumbnailContent.innerHTML = "<p>제주특별자치도는 대한민국의 제주도와 부속 섬들을 관찰하는 특별자치도이다. 현재 대한민국의 특별자치도는 제주특별자치도가 유일하다. 대한민국에서 가장 큰 섬인 제주도 본섬을 비롯하여 마라도, 우도, 추자군도 등을 포함한 유인도 8개, 무인도 55개로 구성되어 있다.</p>";
	    });
    </script>
</body>
</html>