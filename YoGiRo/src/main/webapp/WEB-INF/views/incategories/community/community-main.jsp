<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.sideright {
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
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=1')"><div>
							<h3>맛집</h3>
							<i class="fas fa-angle-right sideright"></i>
						</div></a> <a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=2')"><div>
							<h3>축제</h3>
							<i class="fas fa-angle-right sideright"></i>
						</div></a> <a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=3')"><div>
							<h3>교통</h3>
							<i class="fas fa-angle-right sideright"></i>
						</div></a> <a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=4')"><div>
							<h3>추천 코스</h3>
							<i class="fas fa-angle-right sideright"></i>
						</div></a> <a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=5')"><div>
							<h3>기타</h3>
							<i class="fas fa-angle-right sideright"></i>
						</div></a>
				</div>
			</aside>
			<main>
				<div id="main-content">
					<c:choose>
						<c:when test="${ComVO.comcategorynum==2}">
							<h1 style="display: block;">축제</h1>
						</c:when>
						<c:when test="${ComVO.comcategorynum==3}">
							<h1 style="display: block;">교통</h1>
						</c:when>
						<c:when test="${ComVO.comcategorynum==4}">
							<h1 style="display: block;">추천 코스</h1>
						</c:when>
						<c:when test="${ComVO.comcategorynum==5}">
							<h1 style="display: block;">기타</h1>
						</c:when>
						<c:otherwise>
							<h1 style="display: block;">맛집</h1>
						</c:otherwise>
					</c:choose>
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
										href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=${ComVO.comcategorynum}&num=${minBlock-1}${query}">
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
										href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=${ComVO.comcategorynum}&num=${num-1}${query}">
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
											href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=${ComVO.comcategorynum}&num=${i}${query}">${i}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${num==total}">
									<i class="fas fa-angle-right pagingarrow-right"></i>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=${ComVO.comcategorynum}&num=${num+1}${query}">
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
										href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=${ComVO.comcategorynum}&num=${maxBlock+1}${query}">
										<i class="fas fa-angle-right pagingarrow-right2"></i><i
										class="fas fa-angle-right"></i>
									</a>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
					<input id="create-btn" type="button" value="글쓰기">
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
							<input type="text" id="search-text" name="text"
								value="${content}" />
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
		<script type="text/javascript">
			$(function() {
				$("#create-btn")
						.click(
								function() {
									location.href = "${pageContext.request.contextPath}/incategories/community/create";
								});

				$("#search")
						.click(
								function() {
									let category = $("#category").val();
									let text = $("#search-text").val();

									if (category == "title") {
										location.href = "${pageContext.request.contextPath}/incategories/community/community-main?title="
												+ text;
									} else if (category == "content") {
										location.href = "${pageContext.request.contextPath}/incategories/community/community-main?content="
												+ text;
									} else if (category == "both") {
										location.href = "${pageContext.request.contextPath}/incategories/community/community-main?title="
												+ text + "&content=" + text;
									}
								});
				$('#search-text')
						.on(
								'keydown',
								function(e) {
									var keyCode = e.which; // 눌린 키 기록

									if (keyCode === 13) { // Enter Key
										let category = $("#category").val();
										let text = $("#search-text").val();

										if (category == "title") {
											location.href = "${pageContext.request.contextPath}/incategories/community/community-main?title="
													+ text;
										} else if (category == "content") {
											location.href = "${pageContext.request.contextPath}/incategories/community/community-main?content="
													+ text;
										} else if (category == "both") {
											location.href = "${pageContext.request.contextPath}/incategories/community/community-main?title="
													+ text + "&content=" + text;
										}
									}
								});
			});

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
					$('#main-content').children().remove();
					// Contents 영역 교체
					$('#main-content').html(data);
				});
			};
		</script>
</body>
</html>