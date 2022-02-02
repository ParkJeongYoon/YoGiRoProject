<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/questions.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/questions-detail.css">
    <script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container" id="container1">
	
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		
		<div class="middle-container">
			<aside>
			
				 <div class="sidemenubar">
				         <a href="${pageContext.request.contextPath}/manager/manager1/manager-chart"><div><h3>방문자수 통계</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager2/manager-que"><div><h3>문의내역 보기</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager3/manager-member"><div><h3>회원관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager4/manager-block-member"><div><h3>차단회원 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager5/manager-community"><div><h3>게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager6/manager-delete-community"><div><h3>삭제된 게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				 </div>
	   		</aside>
	   		<main>
	   			 <div class="main2-1">
	   			 	<form:form modelAttribute="AnswerVO" action="${pageContext.request.contextPath}/manager/manager2/answer_result" method="POST">
	   			 		
	   			 			<div class="qtitle">
				                <div><h4>답변 제목</h4></div>
				                <div><form:input path="atitle"/></div>
				            </div>
				            <div class="qcreatedate">
				                <div>
				                    <div>작성자</div>
				                    <div></div>
				                </div>
				                <div>
				                    <div>등록일</div>
				                    <div></div>
				                </div>
				            </div>
				            <div class="qcontent">
				                <form:textarea path="acontent" cols="50" rows="10"/>
				            </div>
				            
	   			 			<form:button type="submit">답변완료</form:button>
	   			 		
	   			 	</form:form>
		   		</div>		 	
	   		</main>		 	
	   	</div>
	   			 	 
    </div>
</body>
</html>