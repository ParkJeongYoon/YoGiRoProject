<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>create title here</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-create.css">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body class="body">
    <div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>



        <main class="qna-create">
        	<h1 class="qna-title">문의하기</h1>
        	<form:form modelAttribute="questionVO" action="${pageContext.request.contextPath}/qna/qna-create-result">
				<ul>
					<li><label for="qtitle">제목</label><form:input path="qtitle"/></li>
        			<li><form:textarea path="qcontent" id="editor" cols="50" rows="10"/></li>
					<form:hidden path="userid" value="${sessionScope.account.userid}"/>
					<li><form:button class="button-sty">전송</form:button></li>
				</ul>
			</form:form>
        </main>



        <jsp:include page="../includes/footer.jsp"></jsp:include>
    </div>
    
    
    
	
	
    <script type="text/javascript">
		document.querySelector("button").addEventListener("click" , function() {
			this.setAttribute("disabled" , "");
			let setTo = setTimeout(function(){
				document.querySelector(".qna-create").removeAttribute("disabled");
			}, 1000);
		});
		
		window.onload = function() {
			CKEDITOR.replace("editor" , {
				height: 500,
				enterMode : '2'
			});
		};
	</script>
</body>
</html>