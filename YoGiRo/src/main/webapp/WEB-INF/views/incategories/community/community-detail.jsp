<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
<style type="text/css">
	a:visited {
		color: black;
	}
	a {
		color: black;
	}
	.main-container{
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
		
	}
	.sidemenubar > a > div {
		width: 180px;
		height: 47px;
		background-color: #FAFAFA;
		border: 1.3px solid #E7E7E7;
		display: flex;
		align-items: center;
	}
	.sidemenubar > a > div > h3 {
		font-weight: 500;
		margin-left: 50px;
	}
	.sideright {
		position: absolute;
		right: 10px;
	}
	/* 메인 */
	main {
		width: 70%;
		height: 80%;
		position: relative;
		margin-top: 50px;
	}
	main > h1 {
		margin-left: 20px;
	}
	/* 글 */
	.post-container {
		margin-top: 20px;
		margin-left: 5px;
		width: 100%;
		height: 50vh;
	}
	.userid {
		margin-top: 10px;
	}
	.content{
		width: 70%;
		height: 80%;
		padding: 15px;
	}
	.little{
		font-size: 0.9rem;
	}
	.comdate {
		position: absolute;
		right: 10px;
	}
	.line {
		border-bottom: 1px solid lightgray;
		width: 100%;
	}
</style>
</head>
<body>
<jsp:include page="../../includes/header.jsp"></jsp:include>
	<div class="container">
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href=""><div><h3>맛집</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href=""><div><h3>축제</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href=""><div><h3>교통</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href=""><div><h3>추천 코스</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href=""><div><h3>기타</h3><i class="fas fa-angle-right sideright"></i></div></a>
				</div>
			</aside>
			<main>
				<h2>맛집</h2>
				<div class="post-container">
					<h3>${CommunityVO.comtitle}</h3>
					<p class="userid little">작성자 : ${CommunityVO.comuserid}</p>
					<p class="comdate little">${CommunityVO.comcreatedate}</p>
					<div class="line"></div>
					<p class="content">${CommunityVO.comcontent}</p>
				</div>
				<div class="line"></div>
			</main>
		</div>
	</div>
</body>
</html>