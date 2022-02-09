<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/79203d0d3b.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<style>
.container {
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	display: flex;
	flex-direction: column;
	justify-content: center;
	max-width: 1600px;
	padding-right: 1.7rem;
	padding-left: 1.7rem;
}

.main-container {
	width: 100%;
	height: 800px;
	display: flex;
}

aside {
	position: relative;
	height: 200px;
	width: 180px;
	margin-right: 30px;
	margin-top: 100px;
}

.sidemenubar {
	/*position: absolute;
      left: 0;
      top: 150px;*/
	
}

.sidemenubar>a>div {
	width: 180px;
	height: 47px;
	background-color: #fafafa;
	border: 1.3px solid #e7e7e7;
	display: flex;
	align-items: center;
}

.sidemenubar>a>div>h3 {
	margin-right: 20px;
}

.side-right {
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
	width: 70%;
	height: 80%;
	position: relative;
}

main>h1 {
	margin-left: 20px;
}

.table-con {
	margin-top: 34px;
	height: 100%;
}

table, th, tr, td {
	border-collapse: collapse;
	height: 40px;
}

thead {
	background-color: #B2DFDB;
	border: 1px solid #E7E7E7;
}

tr {
	border-bottom: 1px solid #E7E7E7;
}

table {
	width: 99%;
	height: auto;
	text-align: center;
}

thead>tr>th:nth-child(1) {
	width: 80px;
}

thead>tr>th:nth-child(2) {
	width: 430px;
}

thead>tr>th:nth-child(3) {
	width: 100px;
}

thead>tr>th:nth-child(4) {
	width: 90px;
}

thead>tr>th:nth-child(5) {
	width: 80px;
}

#search {
	height: 35px;
	width: 80px;
	position: absolute;
	right: 10px;
}

#search-text {
	height: 35px;
	width: 200px;
	position: absolute;
	right: 95px;
}
/* 페이징 */
#page {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 30px;
}

.pagingarrow-left {
	margin-right: 20px;
}

.pagingarrow-right {
	margin-left: 20px;
}

.pagingarrow-left2 {
	margin-right: 10px;
}

.pagingarrow-right2 {
	margin-left: 10px;
}

#table-con {
	width: 100%;
	margin: 34px 20px;
	height: auto;
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

#search {
	height: 35px;
	width: 80px;
	position: absolute;
	right: 10px;
	background-color: #B2DFDB;
}

#search_category {
	height: 35px;
	position: absolute;
	right: 305px;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="${pageContext.request.contextPath}/mypage">
						<div>
							<h3>내 정보</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div>
					</a> <a href="${pageContext.request.contextPath}/myqna"><div>
							<h3>문의 내역</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/mycommunity"><div>
							<h3>내 글 보기</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/mycourse"><div>
							<h3>내 코스</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/myrestaurant"><div>
							<h3>내 음식점</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a>
				</div>
			</aside>
			<main>
				<h1 style="display: block;">내 코스</h1>
				<div class="table-con">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>총소요거리</th>
								<th>총소요시간</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.mycoursecommonid}</td>
									<td><a
										href="mycourse_detail?mycoursecommonid=${item.mycoursecommonid}">${item.mycoursecommontitle}</a></td>
									<td>${item.totaldistance}</td>
									<td>${item.totaltime}</td>
									<td>${item.userid}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
						String region = (String) request.getAttribute("region");
						pageContext.setAttribute("total", total);
						pageContext.setAttribute("minBlock", minBlock);
						pageContext.setAttribute("maxBlock", maxBlock);

						// 검색 데이터 연동
						String query = "";

						String mycoursecommontitle = (String) request.getAttribute("mycoursecommontitle");
						String mycourseinfo = (String) request.getAttribute("mycourseinfo");

						if (mycoursecommontitle != null) {
							query += "&mycoursecommontitle=" + mycoursecommontitle;
						}

						if (mycourseinfo != null) {
							query += "&mycourseinfo=" + mycourseinfo;
						}

						pageContext.setAttribute("query", query);
						%>
						<c:choose>
							<c:when test="${(minBlock-1) < 1 }">
								<i class="fas fa-angle-left"></i>
								<i class="fas fa-angle-left pagingarrow-left2"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycourse?num=${minBlock-1}${query}&region=${region}">
									<i class="fas fa-angle-left"></i> <i
									class="fas fa-angle-left pagingarrow-left2"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${num==1 }">
								<i class="fas fa-angle-left pagingarrow-left"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycourse?num=${num-1}${query}&region=${region}">
									<i class="fas fa-angle-left pagingarrow-left"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${minBlock}"
							end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
							<c:choose>
								<c:when test="${num == i}">
									<b>${i}</b>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/mycourse?num=${i}${query}&region=${region}">${i}</a>
								</c:otherwise>
							</c:choose>

						</c:forEach>
						<c:choose>
							<c:when test="${num == total }">
								<i class="fas fa-angle-right pagingarrow-right"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycourse?num=${num+1}${query}&region=${region}">
									<i class="fas fa-angle-right pagingarrow-right"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${maxBlock > total }">
								<span> <i class="fas fa-angle-right pagingarrow-right2"></i>
									<i class="fas fa-angle-right"></i>
								</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycourse?num=${maxBlock+1}${query}&region=${region}">
									<i class="fas fa-angle-right pagingarrow-right2"></i> <i
									class="fas fa-angle-right"></i>
								</a>
							</c:otherwise>
						</c:choose>
					</div>

					<c:choose>
						<c:when
							test="${(mycoursecommontitle != null) && (mycourseinfo != null)}">
							<select name="category" id="search_category">
								<option value="mycoursecommontitle">제목</option>
								<option value="mycourseinfo">내용</option>
								<option value="both" selected>제목+내용</option>
							</select>
							<input type="text" id="search-text" name="text"
								value="${mycoursecommontitle}" />
						</c:when>
						<c:when test="${(mycoursecommontitle != null) }">
							<select name="category" id="search_category">
								<option value="mycoursecommontitle" selected>제목</option>
								<option value="mycourseinfo">내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="search-text" name="text"
								value="${mycoursecommontitle}" />
						</c:when>

						<c:when test="${(mycourseinfo != null)}">
							<select name="category" id="search_category">
								<option value="mycoursecommontitle">제목</option>
								<option value="mycourseinfo" selected>내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="search-text" name="text"
								value="${mycourseinfo}" />
						</c:when>
						<c:otherwise>
							<select name="category" id="search_category">
								<option value="mycoursecommontitle">제목</option>
								<option value="mycourseinfo">내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="search-text" name="text" />
						</c:otherwise>
					</c:choose>
					<button id="search">검색</button>
				</div>
			</main>

		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#search").click(function() {
				let category = $("#search_category").val();
				let text = $("#search-text").val();
				if (category == "mycoursecommontitle") {
					location.href = "${pageContext.request.contextPath}/mycourse?mycoursecommontitle="+ text;
				} else if (category == "mycourseinfo") {
					location.href = "${pageContext.request.contextPath}/mycourse?mycourseinfo="+ text;
				} else if (category == "both") {
					location.href = "${pageContext.request.contextPath}/mycourse?mycoursecommontitle="+ text+ "&mycourseinfo="+ text;
				}
								
			});
			$('#search-text').on('keydown', function(e) {
				var keyCode = e.which; // 눌린 키 기록

				if (keyCode === 13) { // Enter Key
					let category = $("#search_category").val();
					let text = $("#search-text").val();
					
					if(category == "title") {
						location.href = "${pageContext.request.contextPath}/mycourse??title="+text;
					}else if(category == "content") {
						location.href = "${pageContext.request.contextPath}/mycourse??content="+text;
					}else if(category == "both") {
						location.href = "${pageContext.request.contextPath}/mycourse??title="+text+"&content="+text;
					}
				}
		});
		});
	</script>
</body>
</html>