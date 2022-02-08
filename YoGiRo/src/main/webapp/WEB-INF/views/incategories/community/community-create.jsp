<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
	/* 사이드 메뉴바 */
	.main-container {
		width: 100%;
		height: 800px;
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
		/*position: absolute;
		left: 0;
		top: 150px;*/
	}
	.sidemenubar > a > div {
		width: 180px;
		height: 47px;
		background-color: #FAFAFA;
		border: 1.3px solid #E7E7E7;
		display: flex;
		align-items: center;
	}
	.fa-angle-right {
		position: absolute;
		right: 10px;
	}
	h3{
		font-weight: 500;
		margin-left: 50px;
	}
	p {
		font-weight: 500;
		font-size: 1.3rem;
	}
	/* 메인 */
	main {
		margin-top: 100px;
		margin-left: 30px;
		width: 70%;
		height: 80%;
		position: relative;
	}
	ul>li {
		list-style: none;
	}
	/* 에디터 */
	#editor {
		width: 100%;
		height: 100%;
	}
	#comtitle {
		width: 87%;
		height: 35px;
		border: 1px solid lightgray;
		position: absolute;
		right: 0;
	}
	#comcategorynum {
		width: 13%;
		height: 35px;
		border: 1px solid lightgray;
	}
	#btn {
		width: 60px;
		height: 35px;
		position: absolute;
		right: 0;
		background-color: #B2DFDB;
		/* border: 1px solid lightgray;  */
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
	 		<form:form modelAttribute="ComVO"
				action="${pageContext.request.contextPath}/incategories/community/create_result">
				<ul>
					<li><form:select id="comcategorynum" path="comcategorynum">
							<form:option value="1">맛집</form:option>
							<form:option value="2">축제</form:option>
							<form:option value="3">교통</form:option>
							<form:option value="4">추천 코스</form:option>
							<form:option value="5">기타</form:option>
						</form:select> <form:input id="comtitle" path="comtitle" placeholder="제목을 입력해주세요" /></li>
					<li><form:textarea path="comcontent" id="editor" cols="50" rows="10" /></li>
					<%-- <li><form:button id="btn">임시저장</form:button></li> --%>
					<li><form:button id="btn">전송</form:button></li>
					<form:hidden path="comuserid"
						value="${sessionScope.account.userid}" />
					<%-- <form:hidden path="ownername" value="${sessionScope.account.name}"/>
					<form:hidden path="filelist"/> 1--%>
				</ul>
			</form:form>
	 	</main>
 	</div>
 	<jsp:include page="../../includes/footer.jsp"></jsp:include>
 </div>
	<script>
	window.onload = function() {
		ck = CKEDITOR
				.replace(
						"editor",
						{
							filebrowserUploadUrl : "${pageContext.request.contextPath}/comimg/imageUpload",
							enterMode : '2'
						}); // 파일업로드 컨트롤러로 보내기
	};
	
	// 임시저장
	
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
    </script>
</body>
</html>