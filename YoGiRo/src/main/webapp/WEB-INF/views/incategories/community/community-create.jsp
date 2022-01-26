<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
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
		margin-top: 50px;
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
		width: 800px;
	}
</style>
</head>
<body>
<div class="container">
	<jsp:include page="../../includes/header.jsp"></jsp:include>
	<div class="main-container">
		<aside>
			<div class="sidemenubar">
				<a href=""><div><h3>맛집</h3><i class="fas fa-angle-right"></i></div></a>
				<a href=""><div><h3>축제</h3><i class="fas fa-angle-right"></i></div></a>
				<a href=""><div><h3>교통</h3><i class="fas fa-angle-right"></i></div></a>
				<a href=""><div><h3>추천 코스</h3><i class="fas fa-angle-right"></i></div></a>
				<a href=""><div><h3>기타</h3><i class="fas fa-angle-right"></i></div></a>
			</div>
		</aside>
	 	<main>
	 		<form:form modelAttribute="comVO" action="${pageContext.request.contextPath}/com/create_result" >
	 			<!-- <select>
	 				<optgroup label="">맛집</optgroup>
	 				<optgroup label="">축제</optgroup>
	 				<optgroup label="">교통</optgroup>
	 				<optgroup label="">추천 코스</optgroup>
	 				<optgroup label="">기타</optgroup>
	 			</select> -->
				<ul>
					<li><label for="comtitle">제목 : </label><form:input path="comtitle"/></li>
					<li><form:textarea path="comcontent" id="editor" cols="50" rows="10"/></li>
				</ul>
			</form:form>
	 	</main>
 	</div>
 	<jsp:include page="../../includes/footer.jsp"></jsp:include>
 </div>
	<script>
	    window.onload = function(){
	       ck = CKEDITOR.replace("editor");
	    };    
    </script>
</body>
</html>