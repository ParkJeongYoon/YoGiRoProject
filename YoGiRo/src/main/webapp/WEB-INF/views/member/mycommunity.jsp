<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style type="text/css">
/* 사이드 메뉴바 */
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
	height: 300px;
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
	background-color: #FAFAFA;
	border: 1.3px solid #E7E7E7;
	display: flex;
	/*		justify-content: center;*/
	align-items: center;
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


#category {
	height: 35px;
	position: absolute;
	right: 305px;
}

#search {
	height: 35px;
	width: 80px;
	position: absolute;
	right: 10px;
	background-color: #B2DFDB;
}

#search-text {
	height: 35px;
	width: 200px;
	position: absolute;
	right: 95px;
}
/* 페이징 */
.pagenum {
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
</style>
</head>
<body class="body">
	<div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
						<a href="${pageContext.request.contextPath}/mypage">
						<div>
							<h3>내 정보</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> 
						<a href="${pageContext.request.contextPath}/myqna">
						<div>
							<h3>문의 내역</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> 
						<a href="${pageContext.request.contextPath}/mycommunity"><div>
							<h3>내 글 보기</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> 
						<a href="${pageContext.request.contextPath}/mycourse"><div>
							<h3>내 코스</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a> 
						<a href="${pageContext.request.contextPath}/myrestaurant"><div>
							<h3>내 음식점</h3>
							<i class="fas fa-angle-right side-right"></i>
						</div></a>
				</div>
			</aside>
			<main>
				<h1 style="display: block;">내 글 내역</h1>
				<div class="table-con">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.comid}</td>
									<td><a
										href="${pageContext.request.contextPath}/incategories/community/detail?comid=${item.comid}">${item.comtitle}</a></td>
									<td>${item.comuserid}</td>
									<td>${item.comcreatedate}</td>
									<td>${item.compageview}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pagenum">
						<%
							int num = (Integer) request.getAttribute("num");
							int count = (Integer) request.getAttribute("count");
							int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
							int minBlock = (((num - 1) / 10) * 10) + 1;
							int maxBlock = (((num - 1) / 10) + 1) * 10;

							pageContext.setAttribute("total", total);
							pageContext.setAttribute("minBlock", minBlock);
							pageContext.setAttribute("maxBlock", maxBlock);

							String query = "";

							String title = (String) request.getAttribute("title");
							String content = (String) request.getAttribute("content");

							if (title != null) {
								query += "&title=" + title;
							}
							if (content != null) {
								query += "&content=" + content;
							}

							pageContext.setAttribute("query", query);
							%>
						<c:choose>
							<c:when test="${(minBlock-1) < 1}">
								<i class="fas fa-angle-left"></i>
								<i class="fas fa-angle-left pagingarrow-left2"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycommunity?num=${minBlock-1}${query}">
									<i class="fas fa-angle-left"></i> <i
									class="fas fa-angle-left pagingarrow-left2"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${num==1}">
								<i class="fas fa-angle-left pagingarrow-left"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycommunity?num=${num-1}${query}">
									<i class="fas fa-angle-left pagingarrow-left"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${minBlock}"
							end="${maxBlock>total?total:maxBlock}" step="1" var="i">
							<c:choose>
								<c:when test="${num == i}">
									<b>${i}</b>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/mycommunity?num=${i}${query}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${num==total}">
								<i class="fas fa-angle-right pagingarrow-right"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycommunity?num=${num+1}${query}">
									<i class="fas fa-angle-right pagingarrow-right"></i>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${maxBlock > total}">
								<span> <i class="fas fa-angle-right pagingarrow-right2"></i>
									<i class="fas fa-angle-right"></i>
								</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/mycommunity?num=${maxBlock+1}${query}">
									<i class="fas fa-angle-right pagingarrow-right2"></i><i
									class="fas fa-angle-right"></i>
								</a>
							</c:otherwise>
						</c:choose>
			</div>
		<c:choose>
			<c:when test="${(title!=null)&&(content!=null)}">
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="both" selected>제목+내용</option>
				</select>
				<input type="text" id="search-text" name="text" value="${title}" />
			</c:when>
			<c:when test="${title!=null}">
				<select name="category" id="category">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
					<option value="both">제목+내용</option>
				</select>
				<input type="text" id="search-text" name="text" value="${title}" />
			</c:when>
			<c:when test="${content!=null}">
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content" selected>내용</option>
					<option value="both">제목+내용</option>
				</select>
				<input type="text" id="search-text" name="text" value="${content}" />
			</c:when>
			<c:otherwise>
				<select name="category" id="category">
					<option value="title">제목</option>
					<option value="content">내용</option>
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
			let category = $("#category").val();
			let text = $("#search-text").val();
			
			if(category == "title") {
				location.href = "${pageContext.request.contextPath}/mycommunity?title="+text;
			}else if(category == "content") {
				location.href = "${pageContext.request.contextPath}/mycommunity?content="+text;
			}else if(category == "both") {
				location.href = "${pageContext.request.contextPath}/mycommunity?title="+text+"&content="+text;
			}
		});
		$('#search-text').on('keydown', function(e) {
			var keyCode = e.which; // 눌린 키 기록

			if (keyCode === 13) { // Enter Key
				let category = $("#category").val();
				let text = $("#search-text").val();
				
				if(category == "title") {
					location.href = "${pageContext.request.contextPath}/mycommunity?title="+text;
				}else if(category == "content") {
					location.href = "${pageContext.request.contextPath}/mycommunity?content="+text;
				}else if(category == "both") {
					location.href = "${pageContext.request.contextPath}/mycommunity?title="+text+"&content="+text;
				}
			}
		});
	});
</script>
</body>
</html>