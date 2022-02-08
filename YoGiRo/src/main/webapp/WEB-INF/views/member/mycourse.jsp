<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/css/default.css">
	<script src="https://kit.fontawesome.com/79203d0d3b.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
	<style>
.main-container {
	margin-left: 30px;
	width: 100%;
	height: 80%;
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
	margin-left: 30px;
	margin-top: 50px;
	/* margin-left: 30px; */
	width: 80%;
	height: 700px;
	position: relative;
}

main>h1 {
	margin-left: 20px;
}

div {
	box-sizing: content-box;
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

.course_container {
	width: 100%;
	height: auto;
	margin-top: 80px;
	display: flex;
}

#main_course {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.course_content {
	border: 1px solid black;
	border-radius: 30px;
	width: 18vw;
}

.bg {
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 30px;
	width: 18vw ;
	height: 100px;
	position: absolute;
}

.div_image {
	border-radius: 30px;
	width: 18vw;
	height: 100px;
	background-size: cover;
	background-repeat: no-repeat;
	max-width : 100%;
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

#add_my_course {
	right: 0;
	position: absolute;
	margin-top: 5px;
}

#user_course {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

.mycourse_content {
	border: 1px solid black;
	border-radius: 30px;
	width: auto;
	margin-right : 3vw;
	margin-left : 2vw;
}
</style>
</head>
<body>

	<jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="container">
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="">
						<div>
							<h3>내 정보</h3>
							<i class="fas fa-angle-right"></i>
						</div>
					</a> <a href="${pageContext.request.contextPath}/myfavorite"><div>
							<h3>즐겨찾기</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/myqna"><div>
							<h3>문의 내역</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/mycommunity"><div>
							<h3>내 글 보기</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/mycourse"><div>
							<h3>내 코스</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/myrestaurant"><div>
							<h3>내 음식점</h3>
							<i class="fas fa-angle-right"></i>
						</div></a>
				</div>
			</aside>
			<main>
				<h1>YoGiRo 어때요?</h1>
				<div id="search_box">
					<button id="search_btn"
						onclick="location.href='mycourse_more?region=${commonList[0].region}'">더보기</button>
				</div>
				<br />
				<br />
				<c:if test="${sessionScope.account.userid != null}">
					<br>
					<a href="${pageContext.request.contextPath}/add_my_course"><h4
							id="add_my_course">내 코스 올리기</h4></a>
					<br>
					<br>
				</c:if>
				<div class="course_container">
					<div id="user_course">


						<c:forEach var="j" begin="0" end="2">
							<c:if test="${myCommonList[j].mycoursecommonid != null}">
								<div id="my_course${j}" class="mycourse_content">

									<a
										href="mycourse_detail?mycoursecommonid=${myCommonList[j].mycoursecommonid}">
										<div class="div_image"
											style="background-image: url('${myCommonList[j].mycoursemainimage}')">
											<div class="bg"></div>
											<p>${myCommonList[j].mycoursecommontitle}</p>
										</div>
									</a>


									<c:forEach var="item2" items="${myDetailList}">

										<c:if
											test="${item2.mycoursecommonid eq myCommonList[j].mycoursecommonid}">
											<div class="subname_container">
												<img class="icon"
													src="https://cdn.visitkorea.or.kr/resources/images/sub/ico_leftobj.png"
													alt="" />
												<p class="subname">${item2.mycoursedetailname}</p>
												<br>
											</div>
										</c:if>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>