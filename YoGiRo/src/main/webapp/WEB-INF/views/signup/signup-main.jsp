<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/login/css/form.css">
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/login/js/signup.js"></script>
<body class="body">
	<div class="container">

		<jsp:include page="../includes/header.jsp"></jsp:include>

		<div class="register">
			<h3>회원가입</h3>
			<form action="${pageContext.request.contextPath}/signupResult"
				method="post">
				<div class="flex">
					<ul class="container">
						<li class="item center">이름</li>
						<li class="item"><input type="text" name="username"
							placeholder="이름을 입력하세요." minlength="2" maxlength="5" autofocus
							required></li>
					</ul>
					<ul class="container">
						<li class="item center">닉네임</li>
						<li class="item"><input type="text" name="usernickname"
							placeholder="닉네임 3~12자 " minlength="3" maxlength="8" required></li>
					</ul>
					<ul class="container">
						<li class="item center">아이디</li>
						<li class="item"><input type="text" name="userid" required
							id="userid" minlength="4" maxlength="20"></li>
						<!-- jsp인데 인풋을 쓰고 네임과 안맞췄다? 자살각 -->
					</ul>
					<ul class="container">
						<li class="item center">비밀번호</li>
						<li class="item"><input type="password" id="pw1" name="userpassword"
							placeholder="영문+숫자 조합 8자리이상" minlength="8" maxlength="20"
							required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">비밀번호 확인</li>
						<li class="item"><input type="password" id="pw2" required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">이메일</li>
						<li class="item"><input type="email" name="useremail"
							minlength="8" maxlength="40" required></li>
						<li class="item"></li>
					</ul>
					<ul class="container">
						<li class="item center">전화번호</li>
						<li class="item"><input type="tel" name="userphonenumber"></li>
						<li class="item"></li>
					</ul>
					<div class="checkbox">
						<div>
							<input type="checkbox" id="check1" required> <label for="check1"></label>
							<p>이용약관 및 개인정보처리방침에 동의합니다. (필수)</p>
						</div>
						<div>
							<input type="checkbox" id="check2"> <label for="check2"></label>
							<p>마케팅 활용 동의 및 광고 수신에 동의합니다. (선택)</p>
						</div>
						<ul class="container">
							<li class="item">
								<button id="submit" class="submit">회원가입</button>
							</li>
						</ul>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
		let userID = document.querySelector('#userID');
		let pw = document.querySelector('#pw1');
		let pwCheck = document.querySelector('#pw2');
		let signUpButton = document.querySelector('#submit');
		
		let userID = document.querySelector('#userID').value; // 여기서 value값을 변수에 담고 싶었다
		function greeting() {
		    if (pw.value !== pwCheck.value) {
		        alert('비밀번호가 다릅니다')
		    } else {
		        alert(userID + '님 환영합니다!');
		    }
		}

		</script>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>