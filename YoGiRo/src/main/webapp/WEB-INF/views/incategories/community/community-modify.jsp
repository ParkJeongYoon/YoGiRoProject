<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		padding: 0;
		margin: 0;
		text-decoration: none;
		font-family: 'Noto Sans KR', 'Noto Sans KR Black', 'Noto Sans KR Light', 'Noto Sans KR Medium', 'Noto Sans KR Thin';
	}
	body {
		display: flex;
		width: 100vw;
		flex-direction: column;
	}
	/* 헤더 */
	header {
		margin-left: 5%;
		margin-right: 5%;
		position: relative;
		height: 100px;
		width: 90%;
	}
	a:visited {
		color: black;
	}
	a {
		color: black;
	}
	#logo {
		font-family: Righteous-Regular;
		font-size: 4rem;
		color: black;
	}
	.right {
		font-size: 1.1rem;
		color: black;
		position: absolute;
		right: 0;
		top: 30px;
		color: black;
	}
	.qna, .login, .signup {
		font-family: 티웨이_항공, tway air;
		font-weight: 500;
		margin: 5px;
	}
	.center {
		position: absolute;
		left: 50%;
		transform: translate(-50%, -50%);
		color: black;
		display: flex;
		
	}
	.topmenu {
		width: 100px;
		height: 50px;
	}
	/* 사이드 메뉴바 */
	.container {
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
/*		justify-content: center;*/
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/css/default.css"></script>
</head>
<body>
	<header>
		<a href=""><h1 id="logo">YoGiRo</h1></a>
		<div class="right">
			<a href="" class="qna">문의하기</a>
			<a href="" class="login">로그인</a>
			<a href="" class="signup">회원가입</a>
		</div>
		<div class="center">
			<a href=""><div class="topmenu"><p>음식점</p></div></a>
			<a href=""><div class="topmenu"><p>축제</p></div></a>
			<a href=""><div class="topmenu"><p>코스</p></div></a>
			<a href=""><div class="topmenu"><p>커뮤니티</p></div></a>
		</div>
	</header>
	<div class="container">
		<aside>
			<div class="sidemenubar">
				<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=1')"><div><h3>맛집</h3><i class="fas fa-angle-right sideright"></i></div></a>
				<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=2')"><div><h3>축제</h3><i class="fas fa-angle-right sideright"></i></div></a>
				<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=3')"><div><h3>교통</h3><i class="fas fa-angle-right sideright"></i></div></a>
				<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=4')"><div><h3>추천 코스</h3><i class="fas fa-angle-right sideright"></i></div></a>
				<a href="#" onclick="acyncMovePage('main-ajax?comcategorynum=5')"><div><h3>기타</h3><i class="fas fa-angle-right sideright"></i></div></a>
			</div>
		</aside>
	 	<main>
	 		<form:form modelAttribute="comVO" action="${pageContext.request.contextPath}/com/modify_result" >
				<ul>
					<li>
						<form:select path="comcategorynum">
			 				<form:option value="1">맛집</form:option>
			 				<form:option value="2">축제</form:option>
			 				<form:option value="3">교통</form:option>
			 				<form:option value="4">추천 코스</form:option>
			 				<form:option value="5">기타</form:option>
			 			</form:select>
						<form:input path="comtitle" placeholder="제목을 입력해주세요"/>
					</li>
					<li><form:textarea path="comcontent" id="editor" cols="50" rows="10"/></li>
					<form:hidden path="comid"/>
					<%-- <li><form:button id="btn">전송</form:button></li> --%>
					<form:hidden path="comuserid" value="${sessionScope.account.userid}"/>
					<%-- <form:hidden path="ownername" value="${sessionScope.account.name}"/>
					<form:hidden path="filelist"/> --%>
				</ul>
			</form:form>
			<button type="button" id="modify">수정</button>
	 	</main>
 	</div>
	<script>
		// 에디터
	    window.onload = function(){
	       ck = CKEDITOR.replace("editor", {
	    	   filebrowserUploadUrl: '${pageContext.request.contextPath}/com/fileupload',
	    	   enterMode:'2'
	       }); // 파일업로드 컨트롤러로 보내기
	    };
	    
	    // 사이드메뉴 ajax
	    function acyncMovePage(url){
	        // ajax option
	        var ajaxOption = {
	                url : url,
	                async : true,
	                type : "GET",
	                dataType : "html",
	                cache : false
	        };
	        
	        $.ajax(ajaxOption).done(function(data){
	            // Contents 영역 삭제
	            $('#main-content').children().remove();
	            // Contents 영역 교체
	            $('#main-content').html(data);
	        });
	    };
	    
	    $("#modify").click(function(){
	    	$("#comVO").submit();
	    }
    </script>
</body>
</html>