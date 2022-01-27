<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body class="body">
	<div class="container">
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		<main>
			<br><br><br><br><br>
			<h1>내 코스 작성</h1>
			<br>
			<p id="info"><i></i>는 필수</p>
			<br>
			<h2><i></i>공통정보</h2>
			<div>
				<h3>코스 제목 : </h3>
				<input type="text" id="title" />
				<br>
				<h3>대표 이미지 첨부 : </h3>
				
				<br>
				<h3>개요 : </h3>
				<textarea name="addmycourse_overview" id="addmycourse_overview" cols="30" rows="10"></textarea>
			</div>
			<br><br><br><br><br><br><br>
			<h2>코스</h2>
			<h3>총 거리 : </h3>
			<input type="text" id="addmycourse_distance" />
			<br>
			<h3>소요 시간 : </h3>
			<input type="text" id="addmycourse_taketime" />
			<br>
		</main>
		
		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>