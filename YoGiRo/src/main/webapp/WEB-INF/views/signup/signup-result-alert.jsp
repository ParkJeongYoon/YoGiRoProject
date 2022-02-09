<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<body>
	<script type="text/javascript">
		$(document).ready(function() {
			alert("회원가입에 성공하였습니다.");
			location.href = '${pageContext.request.contextPath}/';
		});
	</script>
</body>
</html>