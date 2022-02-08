<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>create title here</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/qnacss/qna-main.css"> --%>
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
	/*      justify-content: center;*/
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

.qna-search{
	height: 35px;
	width: 80px;
	position: absolute;
	right: 10px;
	background-color: #B2DFDB;
}

.search-text {
	height: 35px;
	width: 200px;
	position: absolute;
	right: 95px;
}
/* 페이징 */
.pagination-box {
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
.search-text {
	height: 35px;
	width: 200px;
	position: absolute;
	right: 95px;
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
					<a href="${pageContext.request.contextPath}/myqna"><div>
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
				<h1 style="display: block;" class="qna-title">문의하기</h1>
				<div class="table-con">
					<table>
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
							</tr>
						</thead>
						<tbody class="qna-list-main">
							<c:forEach var="item" items="${qlist}">
								<tr>
									<td>${item.qnum}</td>
									<td><a
										href="${pageContext.request.contextPath}/qna/qna-detail?qnum=${item.qnum}">${item.qtitle}<c:if
												test="${item.isans eq 'Y'}">&nbsp;&nbsp;<i
													class="far fa-lightbulb"></i>
											</c:if></a></td>
									<td>${item.userid}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				<div class="pagination-box">

					<%
					int qnum = (Integer)request.getAttribute("qnum");
					int count = (Integer)request.getAttribute("count");
					int total = count/10+((count%10==0)?0:1);
					int minblock = (((qnum-1)/10)*10)+1;
					int maxblock = (((qnum-1)/10)+1)*10;
					pageContext.setAttribute("total" , total);
					pageContext.setAttribute("minblock" , minblock);
					pageContext.setAttribute("maxblock" , maxblock);
					
					String query = "";
					String qtitle = (String)request.getAttribute("qtitle");
					String qcontent = (String)request.getAttribute("qcontent");
					
					if (qtitle != null) {
						query += "&title=" + qtitle;
					}
					if (qcontent != null) {
						query += "&qcontent=" + qcontent;
					}
					
					pageContext.setAttribute("query" , query);
					%>

					<c:choose>
						<c:when test="${(minblock-1) < 1}">
							<i class="fas fa-angle-left"></i>
							<i class="fas fa-angle-left pagingarrow-left2"></i>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/myqna?qnum=${minblock-1}${query}"><i
								class="fas fa-angle-left"></i><i
								class="fas fa-angle-left pagingarrow-left2"></i></a>
						</c:otherwise>
					</c:choose>
					<!-- 1미만으로 안넘어가게 처리 -->
					<c:choose>
						<c:when test="${qnum == 1}">
							<i class="fas fa-angle-left"></i>&nbsp;&nbsp;&nbsp;
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/myqna?qnum=${qnum-1}${query}"><i
								class="fas fa-angle-left"></i>&nbsp;&nbsp;&nbsp;</a>
						</c:otherwise>
					</c:choose>

					<c:forEach begin="${minblock}"
						end="${(total<maxblock)?total:maxblock}" step="1" var="i">
						<!-- 현재페이지 클릭 기능 제거를 위한 choose -->
						<c:choose>
							<c:when test="${qnum == i}">
								<span>${i}</span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/myqna?qnum=${i}${query}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<!-- 최대 초과로 안넘어가게 처리 -->
					<c:choose>
						<c:when test="${qnum == total}">
							<span>&nbsp;&nbsp;&nbsp;<i class="fas fa-angle-right"></i></span>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/myqna?qnum=${qnum+1}${query}">&nbsp;&nbsp;&nbsp;<i
								class="fas fa-angle-right"></i></a>
						</c:otherwise>
					</c:choose>
					<!-- 블록건너뛰기 -->
					<!-- 조건 1. 현재 페이지보다 큰페이지 존재. -->
					<!-- 조건 2. 그 큰페이지가 속한 최대페이지 존재. -->
					<!-- 현재페이지가 속한 블록의 최대페이지가 최종페이지보다 크면 당연히 비활성화 -->
					<!-- 현재페이지가 기준이 아니다 !! 주의 -->
					<c:choose>
						<c:when test="${maxblock > total}">
							<span><i class="fas fa-angle-right pagingarrow-right2"></i><i
								class="fas fa-angle-right"></i></span>
						</c:when>
						<c:otherwise>
							<a
								href="${pageContext.request.contextPath}/myqna?qnum=${maxblock+1}${query}"><i
								class="fas fa-angle-right pagingarrow-right2"></i><i
								class="fas fa-angle-right"></i></a>
						</c:otherwise>
					</c:choose>

				</div>
				<div class="qna-list-bottom-inner-right">
					<div class="search-bar">
						<% if ((qtitle!=null)&&(qcontent!=null)) { %>
						<select name="category" id="category">
							<option value="qtitle">제목</option>
							<option value="qcontent">내용</option>
							<option value="both" selected>제목+내용</option>
						</select> <input type="text" id="text" name="text"
							placeholder="검색어를 입력해주세요" value="${qtitle}">
						<% }else if (qtitle != null) { %>
						<select name="category" id="category">
							<option value="qtitle" selected>제목</option>
							<option value="qcontent">내용</option>
							<option value="both">제목+내용</option>
						</select> <input type="text" id="text" name="text"
							placeholder="검색어를 입력해주세요" value="${qtitle}">
						<% }else if (qcontent != null) { %>
						<select name="category" id="category">
							<option value="qtitle">제목</option>
							<option value="qcontent" selected>내용</option>
							<option value="both">제목+내용</option>
						</select> <input type="text" id="text" name="text"
							placeholder="검색어를 입력해주세요" value="${qcontent}">
						<% }else { %>
						<select name="category" id="category">
							<option value="qtitle">제목</option>
							<option value="qcontent">내용</option>
							<option value="both">제목+내용</option>
						</select> <input type="text" class="search-text" id="text" name="text"
							placeholder="검색어를 입력해주세요">
						<% } %>
						<button class="qna-search button-sty">검색</button>
					</div>
				</div>
			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>


	<script type="text/javascript">
    	document.querySelector(".qna-search").addEventListener("click" , function() {
    		let category = document.querySelector("#category").value;
    		let text = document.querySelector("#text").value;
    		
    		if (category == "qtitle") {
				location.href = "${pageContext.request.contextPath}/myqna?qtitle=" + text;
			}else if (category == "qcontent") {
				location.href = "${pageContext.request.contextPath}/myqna?qcontent=" + text;
			}else if (category == "both") {
				location.href = "${pageContext.request.contextPath}/myqna?qtitle=" + text + "&qcontent=" + text;
			}
    	});
	</script>
</body>
</html>