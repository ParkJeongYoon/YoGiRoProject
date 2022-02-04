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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-main.css">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
</head>
<body class="body">
    <div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>



        <main class="qna-main">
        	<form:form modelAttribute="QnaVO" action="${pageContext.request.contextPath}/qna/qna-create-result">
				<ul>
					<li><label for="title">제목 : </label><form:input path="title"/></li>
        			<li><form:textarea path="qcontent" id="editor" cols="50" rows="10"/></li>
					<!-- <form:hidden path="userid" value="${sessionScope.account.id}"/> -->
					<form:button>전송</form:button>
				</ul>
			</form:form>
        </main>



        <jsp:include page="../includes/footer.jsp"></jsp:include>
        
    </div>
    
    
    
	
	
    <script type="text/javascript">
    	window.onload = function() {
	       ck = CKEDITOR.replace("editor");
	    };
	</script>
</body>
</html>