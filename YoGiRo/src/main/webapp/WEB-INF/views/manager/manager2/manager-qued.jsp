<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style type="text/css">
    	.quedbtn {
	      	position: absolute;
	      	right: 0;
	      	background-color: #B2DFDB;
	      	padding: 10px 15px;
	      	margin-top: 2px;
	      	font-size: 15px;
	      }
    </style>
</head>
<body>
	<div class="container" id="container1">
	
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		
		<div class="middle-container">
			<aside>
			
				 <div class="sidemenubar">
				         
				         <a href="${pageContext.request.contextPath}/manager/manager2/manager-que"><div><h3>문의내역 보기</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager3/manager-member"><div><h3>회원관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager4/manager-block-member"><div><h3>차단회원 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager5/manager-community"><div><h3>게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				         <a href="${pageContext.request.contextPath}/manager/manager6/manager-delete-community"><div><h3>삭제된 게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
				 </div>
	   		</aside>
	   		<main>
	   			 <div class="main2-1">
	   			 	<div class="que-detail">
	   			 		<div class="qtitle">
			                <div><h4>제목</h4></div>
			                <div><h4>${questionVO.qtitle}</h4></div>
			            </div>
			            <div class="qcreatedate">
			                <div>
			                    <div>작성자</div>
			                    <div>${questionVO.userid}</div>
			                </div>
			                <div>
			                    <div>등록일</div>
			                    <div>${questionVO.qcreatedate}</div>
			                </div>
			            </div>
			            <div class="qcontent">
			                <div><p>${questionVO.qcontent}</p>
			                </div>
			            </div>
	   			 	 </div>
	   			 	 
        			
	   			 	 
	   			 	
	   			 	<button class="quedbtn">
	   			 		<a href="${pageContext.request.contextPath}/manager/manager2/move_answer">답변하기</a>
	   			 	</button>
	   			 		
	   			 	
        		</div>
        		
        		
	   		</main>
	   	</div>
		
		<jsp:include page="../../includes/footer.jsp"></jsp:include>
		
		
	</div>
	<script type="text/javascript">
		
	</script>
	
	
</body>
</html>