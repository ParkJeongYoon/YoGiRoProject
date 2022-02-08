<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
	width: 200px;
	position: absolute;
	right: 80px;
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
						</div></a> 
					<a href="${pageContext.request.contextPath}/myqna"><div>
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
				<h1 style="display: block;">내 음식점</h1>
				<div class="table-con">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>음식점</th>
								<th>지역</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="item" items="${list}">
								<tr>
									<td>${item.myfoodid}</td>
									<td><a href="myfood_detail?myfoodid=${item.myfoodid}">${item.myfoodname}</a></td>
									<td>${item.region}</td>
									<td>${item.userid}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

				</div>

			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>