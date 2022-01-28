<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/login/css/form.css">
</head>
<body class="body">
<form:form action="${pageContext.request.contextPath}/user/signupResult">
	<div class="container">

		<jsp:include page="../includes/header.jsp"></jsp:include>

		<div class="register">
			<h3>회원가입</h3>
			<form action="">
				<div class="flex">
					<ul class="container">
						<li class="item center">이름</li>
						<li class="item"><input type="text" name="username"
							placeholder="이름을 입력하세요." autofocus required></li>
					</ul>
					<ul class="container">
						<li class="item center">닉네임</li>
						<li class="item"><input type="text" name="usernickname" placeholder="닉네임 3~12자 "
							required></li>
					</ul>
					<ul class="container">
						<li class="item center">아이디</li>
						<li class="item"><input type="text" name="userid" required></li>
						<!-- jsp인데 인풋을 쓰고 네임과 안맞췄다? 자살각 -->
					</ul>
					<ul class="container">
						<li class="item center">비밀번호</li>
						<li class="item"><input type="password"
							name = "userpassword" placeholder="영문+숫자 조합 8자리이상" required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">비밀번호 확인</li>
						<li class="item"><input type="password" required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">이메일</li>
						<li class="item"><input type="email" name="useremail"></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">전화번호</li>
						<li class="item"><input type="tel" name="userphonenumber"></li>
						<li class="item"></li>
					</ul>
					<div class="checkbox">
						<div>
							<input type="checkbox" id="check1"> <label for="check1"></label>
							<p>이용약관 및 개인정보처리방침에 동의합니다. (필수)</p>
						</div>
						<div>
							<input type="checkbox" id="check2"> <label for="check1"></label>
							<p>마케팅 활용 동의 및 광고 수신에 동의합니다. (선택)</p>
						</div>
						<ul class="container">
							<li class="item">
								<button class="submit">회원가입</button>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</form:form>
</body>
</html>