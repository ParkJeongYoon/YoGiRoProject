<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
a:visited {
	color: black;
}

a {
	color: black;
}

.main-container {
	display: flex;
}

aside {
	position: relative;
	height: 300px;
	width: 180px;
	margin-right: 30px;
	margin-top: 100px;
}

.sidemenubar {
	
}

.sidemenubar>a>div {
	width: 180px;
	height: 47px;
	background-color: #FAFAFA;
	border: 1.3px solid #E7E7E7;
	display: flex;
	align-items: center;
}

.sidemenubar>a>div>h3 {
	font-weight: 500;
	margin-left: 50px;
}

.sideright {
	position: absolute;
	right: 10px;
}
/* 메인 */
main {
	width: 70%;
	height: 80%;
	position: relative;
	margin-top: 100px;
	margin-left: 25px;
}

main>h1 {
	margin-left: 20px;
}
/* 글 */
.post-container {
	width: 100%;
	height: 100%;
	background-color: #fafafa;
	padding-left: 5px;
}

.userid {
	margin-top: 10px;
}

.content {
	width: 70%;
	height: 80%;
	padding: 15px;
	padding-top: 25px;
}

.content:after {
	content: "";
	display: block;
	clear: both;
}

.little {
	font-size: 0.9rem;
	display: inline-block;
	margin-bottom: 5px;
}
.fa-user{
	padding-left: 5px;
}
.fa-clock {
	position: absolute;
	right: 90px;
	top: 79px;
}
.comdate {
	position: absolute;
	right: 10px;
	top: 77px;
}
.userid{
	margin-left: 3px;
}
.title{
	padding: 7px;
	font-size: 1.4rem;
}
.line {
	border-bottom: 1px solid lightgray;
	width: 100%;
}

.comment-container {
	width: 100%;
	margin-top: 40px;
}

#comment {
	width: 100%;
	border: 1px solid lightgray;
	border-radius: 2px;
	margin-top: 34px;
}

#set-comment {
	width: 80px;
	height: 35px;
	border: 1px solid lightgray;
	outline: 0;
	background-color: #fff;
	border-radius: 2px;
	margin-bottom: 30px;
}

#modify, #delete {
	width: 50px;
	height: 35px;
	border: 1px solid lightgray;
	outline: 0;
	background-color: #fff;
	border-radius: 2px;
}

#modify {
	margin-top: 3px;
	position: absolute;
	right: 50px;
}

#delete {
	margin-top: 3px;
	position: absolute;
	right: 0;
}
/* 댓글 리스트 */
#comment-list > div > button {
	width: 35px;
	height: 25px;
	background-color: #fff;
	border: 1px solid lightgray;
	border-radius: 2px;
	padding-bottom: 25px;
	text-align: center;
	
}

#comment-list > div {
	margin: 5px;
	position: relative;
	border: 1px solid lightgray;
	background-color: #fafafa;
}
#comment-list > div > h3, #comment-list > div > p {
	padding-bottom: 5px;
	padding-left: 5px;
}
</style>
</head>
<body>
	<div class="container">
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="${pageContext.request.contextPath}/incategories/community/community-main" onclick="acyncMovePage('main-ajax?comcategorynum=1')"><div><h3>맛집</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=2" onclick="acyncMovePage('main-ajax?comcategorynum=2')"><div><h3>축제</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=3" onclick="acyncMovePage('main-ajax?comcategorynum=3')"><div><h3>교통</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=4" onclick="acyncMovePage('main-ajax?comcategorynum=4')"><div><h3>추천 코스</h3><i class="fas fa-angle-right sideright"></i></div></a>
					<a href="${pageContext.request.contextPath}/incategories/community/community-main?comcategorynum=5" onclick="acyncMovePage('main-ajax?comcategorynum=5')"><div><h3>기타</h3><i class="fas fa-angle-right sideright"></i></div></a>
				</div>
			</aside>
			<main>
				<div class="post-container">
					<h3 class="title">${ComVO.comtitle}</h3>
					<i class="fa fa-solid fa-user"></i>
					<p class="userid little">${ComVO.comuserid}</p>
					<i class="fa fa-solid fa-clock"></i>
					<p class="comdate little">${ComVO.comcreatedate}</p>
					<div class="line"></div>
					<p class="content">${ComVO.comcontent}</p>
				</div>
				<div class="line"></div>
				<c:if test="${sessionScope.account.userid == ComVO.comuserid}">
					<!-- 세션스코프의 아이디와 vo의 오너아이디가 같으면 -->
					<button id="modify">수정</button>
					<button id="delete">삭제</button>
				</c:if>
				<div class="comment-container">
					<div class="line"></div>
					<div id="comment-list"></div>
					<div>
						<textarea name="comment" id="comment" rows="5"></textarea>
						<button id="set-comment">댓글 등록</button>
					</div>
				</div>
			</main>
		</div>
		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/comcomment/get/${ComVO.comid}",
				type:"GET",
				dataType: "json",
				success: function(data) {
					// console.log(data);
					for(const item of data) {
						let userid = "${sessionScope.account.userid}";
						// $("#comment-list").append("<div><h3>"+item.comuserid+"</h3><p>"+item.comcommentcontent+"</p></div>");
						const commentList = document.querySelector("#comment-list");
						
						const div = document.createElement("div");
						const h3 = document.createElement("h3");
						h3.innerText = item.comuserid;
						const p = document.createElement("p");
						p.innerText = item.comcommentcontent;
						
						// 해당 유저가 쓴 댓글일 경우
						if(userid == item.comuserid){
							// 삭제 버튼
							const delete_button = document.createElement("button");
							delete_button.innerText = "삭제";
							
							delete_button.addEventListener("click", function(){
								let yn = confirm("삭제하시겠습니까?");
								// console.log(yn);
								if(yn) {
									// comment_data = {comid: item.comid};
									comment_data = {comcommentid: item.comcommentid};
									
									$.ajax({
										url: "${pageContext.request.contextPath}/comcomment/delete",
										type:"DELETE",
										data:JSON.stringify(comment_data),
										contentType: "application/json; charset=utf-8",
										dataType: "json",
										success:function(data){
											div.remove();
											// console.log("삭제완료되었습니다.");
										}
									});
								}
							});
							
							/* div.append(delete_button); */
							
							// 수정 버튼
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								// edit_textarea.cols = "200";
								edit_textarea.style.width = "100%";
								edit_textarea.rows = "5";
								
								edit_textarea.value = p.innerText; // p태그 안에 있는 텍스트를 넣는것
								
								const edit_modify = document.createElement("button");
								edit_modify.innerText = "수정완료";
								edit_modify.style.width = "60px";
								const edit_cancel = document.createElement("button");
								edit_cancel.innerText = "취소";
								
								edit_div.append(edit_textarea);
								edit_div.append(edit_modify);
								edit_div.append(edit_cancel);
								
								div.after(edit_div);
								div.style.display = "none";
								
								// 취소 버튼 클릭시 이벤트
								edit_cancel.addEventListener("click", function() {
									div.style.display = "block";
									edit_div.remove();
								});
								
								// 수정완료 버튼 클릭 시 이벤트
								edit_modify.addEventListener("click", function() {
									// alert("수정완료 버튼 클릭");
									if(confirm("수정하시겠습니까")){
										let comcommentcontent = edit_textarea.value;
										
										const modify_data = {comcommentcontent, comcommentid: item.comcommentid};
										
										$.ajax({
											url:"${pageContext.request.contextPath}/comcomment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
												console.log(data);
												p.innerText = data.comcommentcontent;
												div.style.display = "block";
												edit_div.remove();
											}
										});
									}
								});
							});
							
							div.append(modify_button);
							div.append(delete_button);
						}
						
						div.prepend(p);
						div.prepend(h3);
						
						commentList.append(div);
					}
				}
			}); // ajax 1
			
			
			// 코멘트 추가
			$("#set-comment").click(function(){
				let comcommentcontent = $("#comment").val();
				
				if(comcommentcontent.length > 0){
					let comment_data = {comcommentcontent, comid : "${ComVO.comid}"};
					
					$.ajax({
						url: "${pageContext.request.contextPath}/comcomment/set",
						type:"POST",
						data:JSON.stringify(comment_data),
						contentType: "application/json; charset=utf-8",
						dataType: "json",
						success:function(data){
							let userid = data.comuserid;
							// $("#comment-list").append("<div><h3>"+item.comuserid+"</h3><p>"+item.comcommentcontent+"</p></div>");
							const commentList = document.querySelector("#comment-list");
							
							const div = document.createElement("div");
							const h3 = document.createElement("h3");
							h3.innerText = data.comuserid;
							const p = document.createElement("p");
							p.innerText = data.comcommentcontent;
							
							$("#comment").val("");
							
							// 삭제 버튼
							const delete_button = document.createElement("button");
							delete_button.innerText = "삭제";
								
							delete_button.addEventListener("click", function(){
								let yn = confirm("삭제하시겠습니까?");
								// console.log(yn);
								if(yn) {
									// comment_data = {comid: item.comid};
									let comment_data = {comcommentid: data.comcommentid};
									
									$.ajax({
										url: "${pageContext.request.contextPath}/comcomment/delete",
										type:"DELETE",
										data:JSON.stringify(comment_data),
										contentType: "application/json; charset=utf-8",
										dataType: "html",
										success:function(data){
											div.remove();
											//console.log("삭제완료되었습니다.");
											//$("#comment").val("");
										}
									});
								}
							
							});	
							
							div.append(delete_button);
							
							// 수정 버튼
							// 수정 버튼
							const modify_button = document.createElement("button");
							modify_button.innerText = "수정";
							
							modify_button.addEventListener("click", function(){
								const edit_div = document.createElement("div");
								const edit_textarea = document.createElement("textarea");
								// edit_textarea.cols = "200";
								edit_textarea.style.width = "100%";
								edit_textarea.rows = "5";
								
								edit_textarea.value = p.innerText; // p태그 안에 있는 텍스트를 넣는것
								
								const edit_modify = document.createElement("button");
								edit_modify.innerText = "수정완료";
								const edit_cancel = document.createElement("button");
								edit_cancel.innerText = "취소";
								
								edit_div.append(edit_textarea);
								edit_div.append(edit_modify);
								edit_div.append(edit_cancel);
								
								div.after(edit_div);
								div.style.display = "none";
								
								// 취소 버튼 클릭시 이벤트
								edit_cancel.addEventListener("click", function() {
									div.style.display = "block";
									edit_div.remove();
								});
								
								// 수정완료 버튼 클릭 시 이벤트1
								edit_modify.addEventListener("click", function() {
									// alert("수정완료 버튼 클릭");
									if(confirm("수정하시겠습니까")){
										let comcommentcontent = edit_textarea.value;
										
										const modify_data = {comcommentcontent, comcommentid: data.comcommentid};
										
										$.ajax({
											url:"${pageContext.request.contextPath}/comcomment/update",
											type:"PATCH",
											data:JSON.stringify(modify_data),
											contentType : "application/json; charset=utf-8",
											dataType : "json",
											success:function(data){
												console.log(data);
												p.innerText = data.comcommentcontent;
												div.style.display = "block";
												edit_div.remove();
											}
										});
									}
								});
							});
							
							div.append(modify_button);
							
							div.prepend(p);
							div.prepend(h3);
							
							commentList.append(div);
						}
					}); // ajax
				}else{
					alert("댓글을 달아주세요");
				}
			});
		}); // $fun
		
		
		// 사이드메뉴 ajax 이동
		function acyncMovePage(url) {
			// ajax option
			var ajaxOption = {
				url : url,
				async : true,
				type : "GET",
				dataType : "html",
				cache : false
			};

			$.ajax(ajaxOption).done(function(data) {
				// Contents 영역 삭제
				$('#main-content').children().remove();
				// Contents 영역 교체
				$('#main-content').html(data);
			});
		};
		
		// 글 삭제1
		$("#delete").click(function() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = "${pageContext.request.contextPath}/incategories/community/delete?comid=${ComVO.comid}";
			}
		});
		// 글 수정1
		$("#modify").click(function() {
			location.href = "${pageContext.request.contextPath}/incategories/community/modify?comid=${ComVO.comid}";
		});
	</script>
</body>
</html>