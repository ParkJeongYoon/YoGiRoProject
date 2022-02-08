<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<style>
main {
	display: flex;
	width: 1600px;
	flex-direction: row;
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
	width: 90%;
	height: 80%;
	position: relative;
}

main>h1 {
	margin-left: 20px;
}

.table-con {
	margin-top: 34px;
	height: 80%;
}

table, th, tr, td {
	border-collapse: collapse;
	height: 40px;
}

thead {
	background-color: #FAFAFA;
	border: 1px solid #E7E7E7;
}

tr {
	border-bottom: 1px solid #E7E7E7;
}

table {
	width: 99%;
	text-align: center;
}

#bbs-create {
	background-color: #fff;
	border: 1px solid black;
	width: 100px;
	height: 35px;
}

#category {
	height: 35px;
	position: absolute;
	right: 305px;
}

#food_top {
	display: inline-block;
}

#search_btn {
	height: 35px;
	width: 80px;
	position: absolute;
	right: 0px;
	background-color: #1DC078;
}

#search_btn:hover {
	background-color: green;
}



.food_container {
	width: 100%;
	height: auto;
	margin-top: 80px;
	display: flex;
	flex-wrap: wrap;
}

#main_food {
	width: 100%;
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	grid-template-rows: repeat(4, 1fr);
	gap: 20px;
	justify-content: center; /* 수평 가운데 정렬 */
}

.food_content {
	margin-bottom: 20px;
	overflow: hidden;
	text-align: center;
}

.div_image {
	border-radius: 30px;
	height: 250px;
	width: 18vw;
	background-size: cover;
	background-repeat: no-repeat;
	max-width: 100%;
	margin-bottom: 20px;
}

.div_image p {
	padding: 10px;
	color: #ffffff;
	z-index: 1000;
	position: relative;
}

.icon {
	display: inline-block;
	margin: 5px;
	padding-left: 10px;
}

.subname_container {
	margin-top: 10px;
}

.subname {
	display: inline-block;
	margin-bottom: 10px;
	font-size: 18px;
}

#add_my_food {
	right: 0;
	position: absolute;
	margin-top: 5px;
}

#user_food {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

.myfood_content {
	width: 19vw;
	margin-right: 2vw;
	margin-left: 2vw;
}

p {
	overflow: hidden;
}

#page {
	display: flex;
	justify-content: center;
}

#page>a {
	padding-left: 10px;
	padding-right: 10px;
}

span {
	padding-left: 5px;
	padding-right: 5px;
}
#search-container{
	display: flex;
	justify-content: end;
	height : 35px;
}
#search-container> select{
	position : relative;
}
#search-container> input{
	position : relative;
}
#search-container> button{
	position : relative;
	width : 60px;
}

</style>
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../../includes/header.jsp"></jsp:include>



		<main>
			<aside>
				<div class="sidemenubar">
					<a href="#"
						onclick="acyncMovePage('move-to-food-main-ajax?region=서울')"><div>
							<h3>수도권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#"
						onclick="acyncMovePage('move-to-food-main-ajax?region=강원')"><div>
							<h3>강원권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#"
						onclick="acyncMovePage('move-to-food-main-ajax?region=충청')"><div>
							<h3>충청권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#"
						onclick="acyncMovePage('move-to-food-main-ajax?region=전라')"><div>
							<h3>전라권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#"
						onclick="acyncMovePage('move-to-food-main-ajax?region=경상')"><div>
							<h3>경상권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a>
				</div>
			</aside>




			<div id="food_real_container">
				<div id="food_top">
					<h1>음식점</h1>
					<div id="search_box">
						<!-- <button id="search_btn" onclick="location.href='food_more'">더보기</button> -->
					</div>
				</div>



				<div class="food_container">
					<div id="main_food">

						<c:forEach var="item" items="${list}">
							<div class="food_content">

								<a href="food_detail?contentid=${item.contentid}&themecode=3"
									class="course-a">
									<c:if test="${item.firstimage != null}">
									<div class="div_image"
										style="background-image: url('${item.firstimage}')">
										
									</div>
									
									</c:if>
									<c:if test="${item.firstimage == null}">
									<div class="div_image"
										style="background-image: url('${pageContext.request.contextPath}/resources/img/noimg.jpg')">
									</div>
									</c:if>
									<p>${item.title}</p>
								</a>



							</div>
						</c:forEach>

					</div>



				</div>
			

		<hr />

		<hr />



	<div id="page">
		<!-- num -> 1~10 11~20 21~30 => ((num-1)/10)+1 -->
		<%
		// 현재 페이지
		int num = (Integer) request.getAttribute("num");
		// 전체 데이터 개수
		int count = (Integer) request.getAttribute("count");
		// 전체 페이지 개수
		int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
		// 한 블럭에서 가장 작은 번호를 가지는 페이지 번호
		int minBlock = (((num - 1) / 10) * 10) + 1;
		// 한 블럭에서 가장 큰 번호를 가지는 페이지 번호
		int maxBlock = (((num - 1) / 10) + 1) * 10;
		String region = (String)request.getAttribute("region");
		pageContext.setAttribute("total", total);
		pageContext.setAttribute("minBlock", minBlock);
		pageContext.setAttribute("maxBlock", maxBlock);

		// 검색 데이터 연동
		String query = "";

		String title = (String) request.getAttribute("title");
		String treatmenu = (String) request.getAttribute("treatmenu");

		if (title != null) {
			query += "&title=" + title;
		}

		if (treatmenu != null) {
			query += "&treatmenu=" + treatmenu;
		}

		pageContext.setAttribute("query", query);
		%>
		<c:choose>
			<c:when test="${(minBlock-1) < 1 }">
				<span>◀◀</span>
			</c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath}/food_more?num=${minBlock-1}${query}&region=${region}">◀◀</a>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<c:choose>
			<c:when test="${num==1 }">
				<span>◀</span>
			</c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath}/food_more?num=${num-1}${query}&region=${region}">◀</a>
			</c:otherwise>
		</c:choose>
		<c:forEach begin="${minBlock}"
			end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
			<c:choose>
				<c:when test="${num == i}">
					<span>${i}</span>
				</c:when>
				<c:otherwise>
					<a
						href="${pageContext.request.contextPath}/food_more?num=${i}${query}&region=${region}">${i}</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<c:choose>
			<c:when test="${num == total }">
				<span>▶</span>
			</c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath}/food_more?num=${num+1}${query}&region=${region}">▶</a>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<c:choose>
			<c:when test="${maxBlock > total }">
				<span>▶▶</span>
			</c:when>
			<c:otherwise>
				<a
					href="${pageContext.request.contextPath}/food_more?num=${maxBlock+1}${query}&region=${region}">▶▶</a>
			</c:otherwise>
		</c:choose>
	</div>
	<hr />

	<div id="search-container">
		<%
		if ((title != null) && (treatmenu != null)) {
		%>
		<select name="category" id="search_category">
			<option value="title">제목</option>
			<option value="treatmenu">내용</option>
			<option value="both" selected>제목+내용</option>
		</select> <input type="text" id="text" name="text" value="${title}" />
		<%
		} else if (title != null) {
		%>
		<select name="category" id="search_category">
			<option value="title" selected>제목</option>
			<option value="treatmenu">내용</option>
			<option value="both">제목+내용</option>
		</select> <input type="text" id="text" name="text" value="${title}" />

		<%
		} else if (treatmenu != null) {
		%>
		<select name="category" id="search_category">
			<option value="title">제목</option>
			<option value="treatmenu" selected>내용</option>
			<option value="both">제목+내용</option>
		</select> <input type="text" id="text" name="text" value="${treatmenu}" />
		<%
		} else {
		%>
		<select name="category" id="search_category">
			<option value="title">제목</option>
			<option value="treatmenu">내용</option>
			<option value="both">제목+내용</option>
		</select> <input type="text" id="text" name="text" />
		<%
		}
		%>
		<button id="search">검색</button>
	</div>
	
	</div>
	</div>

		</main>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<jsp:include page="../../includes/footer.jsp"></jsp:include>

	<script>
		function acyncMovePage(url) {
			// ajax option
			var ajaxOption = {
				url : url,
				async : true,
				type : "GET",
				dataType : "html",
				cache : false
			};

			$.ajax(ajaxOption).done(function(data) {
				// Contents 영역 삭제
				$('#food_real_container').children().remove();
				// Contents 영역 교체
				$('#food_real_container').html(data);
			});
		}
		
		
		$(function() {
			
			
			$("#search").click(function(){
				let category = $("#search_category").val();
				let text = $("#text").val();
				
				if(category == "title"){
					location.href = "${pageContext.request.contextPath}/food_more?title="+text+"&region=${region}";	
				}else if(category == "treatmenu"){
					location.href = "${pageContext.request.contextPath}/food_more?treatmenu="+text+"&region=${region}";
				}else if(category == "both"){
					location.href = "${pageContext.request.contextPath}/food_more?title="+text+"&treatmenu="+text+"&region=${region}";	
				}
				
			});
		});
	</script>
</body>
</html>