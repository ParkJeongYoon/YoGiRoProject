<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
main {
	width: 1600px;
}

body {
	display: flex;
	width: 100vw;
	flex-direction: column;
}
/* .container {
    position: relative;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    flex-direction: column;
    justify-content: center;
    max-width: 1600px;
    padding-right: 1.7rem;
    padding-left: 1.7rem;
} */
/* 사이드 메뉴바 */
aside {
	position: relative;
	height: 300px;
	width: 180px;
	margin-right: 30px;
	margin-top: 100px;
	display: inline-block;
}

#course_real_container {
	display: flex;
	flex-direction: column;
	width: 100%;
}

.sidemenubar {
	/*position: absolute;
      left: 0;
      top: 150px;*/
	
}

.sidemenubar>a>div {
	width: 180px;
	height: 47px;
	background-color: #FAFAFA;
	border: 1.3px solid #E7E7E7;
	display: flex;
	/*      justify-content: center;*/
	align-items: center;
}

.fa-angle-right {
	position: absolute;
	right: 10px;
}

h3 {
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
	width: 95%;
	height: 80%;
	position: relative;
	background-color: #fff;
	padding: 40px;
	border-radius: 30px;
}

main>h1 {
	margin-left: 20px;
}

/* 세부페이지 설정  */
#title {
	border-bottom: 1px solid gray;
	display: inline-block;
	border-width: 30%;
	margin-left: 10px;
	font-weight: bold;
}

#common-img {
	width: 600px;
	height: 400px;
	border-radius: 30px;
}

hr {
	border: 1px solid #ccc;
}

#course_detail_container{
	display :flex;
}

#course_detail_img{

	width : 50%;
}
#detail_img{
	border-radius : 30px;

}
#course_detail_overview{
	padding : 20px;
	width : 50%;
}
#overview{
	font-weight : bold;
}
</style>
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../../includes/header.jsp"></jsp:include>

		
		<main>
		
			<h1>나의 맛집</h1>
			<br /><br /><br /><br />
			<p id="title">${myfoodtodetailpage.myfoodname}</p>
			<br /><br /><br /> 
			
				<div id="uploadResult">
					
				</div>
			
			<br />
			<br /><br />
			<hr />
			<br><br>
			<h2>개요</h2>
			<br><br />
			<p>주소 : ${myfoodtodetailpage.myfoodaddress}</p><br>
			<p>맛집 설명 : </p><br><br><br><p>${myfoodtodetailpage.myfooddetail}</p>
			<br /><br /><br /><br /><br /><br />

			<c:set var="i" value="1" />

			<%-- <c:forEach var="item" items="${mycoursedetailtodetailpage}">
				<h2>${i}코스:${item.mycoursedetailname}</h2>
				<br />
				<div id="course_detail_container">
					<div id="course_detail_img">
						
							<img src="${item.mycoursedetailimage}" alt="" id="detail_img"/>
						
					</div>
					<div id="course_detail_overview">
						<p id="overview"> <<코스개요>> </p>
						<br />
						<p>${item.mycoursedetailoverview}</p>
					</div>
				</div>
				<br /><br /><br /><br /><br /><br /><br />
	
				
				

				<c:set var="i" value="${i+1}"></c:set>
			</c:forEach> --%>
			
			
		</main>



		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	
	<script type="text/javascript">
		let uploadResult = $("#uploadResult");	
	 	
	 	$(document).ready(function(){
	 		let str = "";
	 		let strr = "<c:out value='${myfoodtodetailpage.myfoodimg}'/>";
	 		let fileCallPath = encodeURIComponent(strr);
	 		str += "<img id='common-img' src='${pageContext.request.contextPath}/display?fileName=" + fileCallPath +"'>";
	 		
	 		uploadResult.html(str); 
	 		
	 	});
	
	</script>
</body>
</html>