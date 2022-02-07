<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>create title here</title>
	
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-detail.css">
    
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body class="body">
    <div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>



        <main class="qna-detail">
        	<h1 class="qna-title">문의하기</h1>
        	
        	<div class="qna-qnabox">
        		<section class="qna-question">
		        	<nav class="qna-nav">
		        		<div class="qna-nav-left">
		        			<button class="button-sty move-qna-main">목&nbsp;&nbsp;&nbsp;&nbsp;록</button>
		        		</div>
		        		<div class="qna-nav-right">
		        			<c:choose>
								<c:when test="${item.isans eq 'Y'}">
									<button class="button-sty" disabled>답변완료</button>
								</c:when>
				        		<c:when test="${sessionScope.account.ismanager eq 'Y'}">
									<button class="button-sty ans-create">답변하기</button>
								</c:when>
		        			</c:choose>
		        			<c:choose>
				        		<c:when test="${sessionScope.account.ismanager eq 'Y'}">
									<button class="button-sty delete">삭&nbsp;&nbsp;&nbsp;&nbsp;제</button>
								</c:when>
								<c:when test="${sessionScope.account.userid eq questionVO.userid}">
									<button class="button-sty delete">삭&nbsp;&nbsp;&nbsp;&nbsp;제</button>
								</c:when>
		        			</c:choose>
						</div>
		        	</nav>
		        	
		        	<div class="qna-question-info">
		        		<div class="qna-question-info-title">
		        			<div class="qna-question-info-title-left">제목</div>
		        			<div class="qna-question-info-title-right">${questionVO.qtitle}</div>
		        		</div>
		        		<div class="qna-question-info-userid">
		        			<div class="qna-question-info-userid-left">작성자</div>
		        			<div class="qna-question-info-userid-right">${questionVO.userid}</div>
		        		</div>
		        		<div class="qna-question-info-createdate">
		        			<div class="qna-question-info-createdate-left">작성일</div>
		        			<div class="qna-question-info-createdate-right">${questionVO.qcreatedate}</div>
		        		</div>
		        	</div>
		        	<div class="qna-question-content">${questionVO.qcontent}</div>
	        	</section>
	        	
	        	<section class="qna-answer">
					
	        	</section>
        	</div>
        </main>



        <jsp:include page="../includes/footer.jsp"></jsp:include>
    </div>
    
    
	<script type="text/javascript">
		window.onload = function() {
			CKEDITOR.replace("editor" , {
				enterMode : '2'
			});
		};
		
		const qnaAnswer = document.querySelector(".qna-answer");
		const label = document.createElement("label");
		const inputTitle = document.createElement("input");
		const textarea = document.createElement("textarea");
		const inputUserid = document.createElement("input");
		const inputIsmanager = document.createElement("input");
		const button = document.createElement("button");
		
		document.querySelector(".ans-create").addEventListener("click" , function() {
			label.setAttribute("for" , "atitle")
			inputTitle.setAttribute("id" , "atitle");
			inputTitle.setAttribute("name" , "atitle");
			textarea.setAttribute("id" , "editor");
			textarea.setAttribute("name" , "acontent");
			inputUserid.setAttribute("name" , "userid");
			inputUserid.innerText = '${sessionScope.account.userid}';
			inputIsmanager.setAttribute("name" , "ismanager");
			inputIsmanager.innerText = '${sessionScope.account.ismanager}';
			button.classList.add("button-sty" , "set-answer");
			button.innerText = '전송';
			qnaAnswer.append(label);
			qnaAnswer.append(inputAtitle);
			qnaAnswer.append(textarea);
			qnaAnswer.append(inputUserid);
			qnaAnswer.append(inputIsmanager);
			qnaAnswer.append(button);
		});
		
		
	</script>
</body>
</html>