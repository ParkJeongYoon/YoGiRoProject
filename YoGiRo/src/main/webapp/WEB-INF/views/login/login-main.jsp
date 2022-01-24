<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/login/css/login.css">
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../includes/header.jsp"></jsp:include>


	<div id="login">
		<div id="login_box">
			<form class="login_content animate" action="#" method="post">
				<span class="close" title="close">&times;</span>
				<div class="login_inside">
					<input type="text" placeholder="아이디 또는 이메일 입력" name="userid" required> 
					<input type="password" placeholder="비밀번호 입력" name="userpassword" required>
					<button class="login_button" type="submit">로그인</button>
					<label class="findandjoin"><a href="#">비밀번호 찾기</a> 
					<a href="#">회원가입</a>
					</label>
				</div>
			</form>
		</div>
	</div>

		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login/js/login.js"></script>
</body>
</html>