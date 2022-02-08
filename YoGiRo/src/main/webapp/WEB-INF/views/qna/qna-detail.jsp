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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
									<button class="button-sty delete">질문삭제</button>
								</c:when>
								<c:when test="${sessionScope.account.userid eq questionVO.userid}">
									<button class="button-sty delete">질문삭제</button>
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
		document.querySelector(".move-qna-main").addEventListener("click" , function() {
			location.href = "${pageContext.request.contextPath}/qna/qna-main";
		});
		
		
		const qnaAnswer = document.querySelector(".qna-answer");
		const ul = document.createElement("ul");
		const liAtitle = document.createElement("li");
		const label = document.createElement("label");
		const inputAtitle = document.createElement("input");
		const liAcontent = document.createElement("li");
		const textarea = document.createElement("textarea");
		const inputUserid = document.createElement("input");
		const inputIsmanager = document.createElement("input");
		const liButton = document.createElement("li");
		const button = document.createElement("button");
		
		$(document).on("click" , ".ans-create" , function(){
			let isans = '${questionVO.isans}';
			if (isans == 'Y') {
				document.querySelector(".ans-create").setAttribute("disabled" , "");
			}else {
				label.setAttribute("for" , "atitle")
				label.innerText = '답변제목';
				inputAtitle.setAttribute("id" , "atitle");
				inputAtitle.setAttribute("name" , "atitle");
				textarea.setAttribute("id" , "editor");
				textarea.setAttribute("name" , "acontent");
				inputUserid.setAttribute("hidden" , "");
				inputUserid.classList.add("userid");
				inputUserid.setAttribute("name" , "userid");
				inputUserid.innerText = '${sessionScope.account.userid}';
				inputIsmanager.setAttribute("hidden" , "");
				inputIsmanager.classList.add("ismanager");
				inputIsmanager.setAttribute("name" , "ismanager");
				inputIsmanager.innerText = '${sessionScope.account.ismanager}';
				button.classList.add("button-sty" , "set-answer");
				button.innerText = '전송';
				liAtitle.append(label);
				liAtitle.append(inputAtitle);
				ul.append(liAtitle);
				liAcontent.append(textarea);
				ul.append(liAcontent);
				ul.append(inputUserid);
				ul.append(inputIsmanager);
				liButton.append(button);
				ul.append(liButton);
				qnaAnswer.append(ul);
				CKEDITOR.replace("editor" , {
					enterMode : '2'
				});
				this.setAttribute("disabled" , "");
			}
		});
		

		const ansBox = document.createElement("div");
		const ansInfo = document.createElement("div");
		const ansTitle = document.createElement("div");
		const ansTitleLeft = document.createElement("div");
		const ansTitleRight = document.createElement("div");
		const ansUserid = document.createElement("div");
		const ansUseridLeft = document.createElement("div");
		const ansUseridRight = document.createElement("div");
		const ansCreatedate = document.createElement("div");
		const ansCreatedateLeft = document.createElement("div");
		const ansCreatedateRight = document.createElement("div");
		const ansContent = document.createElement("div");
		const deleteButton = document.createElement("button");
		
		ansBox.classList.add("ans-box");
		ansInfo.classList.add("ans-info");
		ansTitle.classList.add("ans-title");
		ansTitleLeft.classList.add("ans-title-left");
		ansTitleLeft.innerHTML = "답변제목";
		ansTitleRight.classList.add("ans-title-right");
		ansUserid.classList.add("ans-userid");
		ansUseridLeft.classList.add("ans-userid-left");
		ansUseridLeft.innerHTML = "관리자명";
		ansUseridRight.classList.add("ans-userid-right");
		ansCreatedate.classList.add("ans-createdate");
		ansCreatedateLeft.classList.add("ans-createdate-left");
		ansCreatedateLeft.innerHTML = "답변일";
		ansCreatedateRight.classList.add("ans-createdate-right");
		ansContent.classList.add("ans-content");
		deleteButton.classList.add("button-sty" , "ans-delete");
		
		$(function() {
			$.ajax({
				url: "${pageContext.request.contextPath}/answer/get/${questionVO.qnum}",
				type: "GET",
				dataType: "JSON",
				success: function(data) {
					for (let item of data) {
						
						let userid = '${sessionScope.account.userid}';
						
						
						
						ansTitleRight.innerText = item.atitle;
						ansUseridRight.innerText = userid;
						ansCreatedateRight.innerText = item.acreatedate;
						ansContent.innerText = item.acontent;
						
						ansTitle.append(ansTitleLeft);
						ansTitle.append(ansTitleRight);
						ansUserid.append(ansUseridLeft);
						ansUserid.append(ansUseridRight);
						ansCreatedate.append(ansCreatedateLeft);
						ansCreatedate.append(ansCreatedateRight);
						
						ansInfo.append(ansTitle);
						ansInfo.append(ansUserid);
						ansInfo.append(ansCreatedate);
						
						ansBox.append(ansInfo);
						ansBox.append(ansContent);
						
						// 당해 유저가 쓴 댓글 일 경우
						if (userid == item.userid) {
							// 삭제버튼
							deleteButton.innerText = "답변삭제";
							
							deleteButton.addEventListener("click" , function() {
								//alert("삭제되었습니다");
								let yn = confirm("삭제하시겠습니까?");
								console.log(yn); // 콘솔에 true false 들어오는지 확인
								if (yn) {
									answerData = {anum:item.anum , qnum: item.qnum};
									console.log(answerData);
									
									$.ajax({
										url: "${pageContext.request.contextPath}/answer/delete",
										type: "DELETE",
										data: JSON.stringify(answerData),
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										success: function(data) {
											console.log(data);
											ansBox.remove();
											document.querySelector(".ans-create").removeAttribute("disabled");
											window.location.reload();
										}
									});
								}
							});

							ansBox.append(deleteButton);
							
						}
						
						
						qnaAnswer.append(ansBox);
						ul.remove();
																							// ㄱ까지 복사했다.
					}
				}
			});
			
			
			
			$(".delete").click(function() {
				if (confirm("정말로 삭제하시겠습니까?")) {
					location.href = "${pageContext.request.contextPath}/qna/qna-delete?qnum=${questionVO.qnum}";
				}
			});
			
			
			
			
			$(document).on("click",".set-answer", function(){
				
				let atitle = $("#atitle").val();
				
				var ckText = CKEDITOR.instances.editor.getData();
				ckText = ckText.replace(/<br\/>/ig, "\n");
				ckText = ckText.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");


				ckText = ckText.replace(/(<([^>]+)>)/gi, "");
				ckText = ckText.replace(/&nbsp;/gi,"");
				
				
				let acontent = ckText;
				let userid = $(".userid").val();
				let ismanager = $(".ismanager").val();
				// 프론트에서 받아지는지 확인
				console.log(acontent);
				console.log(acontent.length);
				
				if (acontent.length > 0) {
					// 코맨트 내용만 확인
					// num데이터를 가져오는데, 어차피 들어오는 bbsVO를 이용해 bbsVO.num으로 탈취
					let answerData = {atitle , acontent , userid , ismanager , qnum: "${questionVO.qnum}"};
					
					$.ajax({
						url: "${pageContext.request.contextPath}/answer/set",
						type: "POST",
						data: JSON.stringify(answerData),
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success: function(data) {
							// 백 콘솔에 들어오는지 확인
							console.log(data);
							
																		
							userid = data.userid;
							
							
							ansTitleRight.innerText = atitle;
							ansUseridRight.innerText = userid;
							ansCreatedateRight.innerText = data.acreatedate;
							ansContent.innerText = acontent;
							
							ansTitle.append(ansTitleLeft);
							ansTitle.append(ansTitleRight);
							ansUserid.append(ansUseridLeft);
							ansUserid.append(ansUseridRight);
							ansCreatedate.append(ansCreatedateLeft);
							ansCreatedate.append(ansCreatedateRight);

							ansInfo.append(ansTitle);
							ansInfo.append(ansUserid);
							ansInfo.append(ansCreatedate);
							
							ansBox.append(ansInfo);
							ansBox.append(ansContent);
							
							
							// 삭제버튼
							deleteButton.innerText = "답변삭제";
							
							deleteButton.addEventListener("click" , function() {
								//alert("삭제되었습니다");
								let yn = confirm("삭제하시겠습니까?");
								console.log(yn); // 콘솔에 true false 들어오는지 확인
								if (yn) {
									answerData = {anum: data.anum , qnum: data.qnum};
									console.log(answerData);
									
									$.ajax({
										url: "${pageContext.request.contextPath}/answer/delete",
										type: "DELETE",
										data: JSON.stringify(answerData),
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										success: function(data) {
											console.log("딜리트시 오는 데이터 : "+data);
											ansBox.remove();
											document.querySelector(".ans-create").removeAttribute("disabled");
											window.location.reload();
										}
									});
								}
							});

							
							ansBox.append(deleteButton);
							
							
							
							
							qnaAnswer.append(ansBox);
							ul.remove();
						}
					});
				}else {
					alert("답변을 달아주세요")
				}
			});
		});
	</script>
</body>
</html>