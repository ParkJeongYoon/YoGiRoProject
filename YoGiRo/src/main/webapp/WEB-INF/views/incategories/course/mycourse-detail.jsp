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
<style>
main {
	display: flex;
	width: 1600px;
	flex-direction: column;
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
	width: 90%;
	height: 80%;
	position: relative;
}

main>h1 {
	margin-left: 20px;
}

.table-con {
	margin-top: 34px;
	height: 80%;
}

table, th, tr, td {
	border-collapse: collapse;
	height: 40px;
}

thead {
	background-color: #FAFAFA;
	border: 1px solid #E7E7E7;
}

tr {
	border-bottom: 1px solid #E7E7E7;
}

table {
	width: 99%;
	text-align: center;
}

#bbs-create {
	background-color: #fff;
	border: 1px solid black;
	width: 100px;
	height: 35px;
}

#category {
	height: 35px;
	position: absolute;
	right: 305px;
}

#course_top {
	display: inline-block;
}

#search_btn {
	height: 35px;
	width: 80px;
	position: absolute;
	right: 0px;
	background-color: #1DC078;
}

#search_btn:hover {
	background-color: green;
}

#search {
	height: 35px;
	width: 200px;
	position: absolute;
	right: 80px;
}

.course_container {
	width: 100%;
	height: auto;
	margin-top: 80px;
	display: flex;
}

#main_course {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
}

.course_content {
	border: 1px solid black;
	border-radius: 30px;
	width: 19vw;
}

.bg {
	background-color: rgba(0, 0, 0, 0.5);
	border-radius: 30px;
	width: 19vw;
	height: 100px;
	position: absolute;
}

.div_image {
	border-radius: 30px;
	width: 19vw;
	height: 100px;
	background-size: cover;
	background-repeat: no-repeat;
	max-width: 100%;
}

.div_image p {
	padding: 10px;
	color: #ffffff;
	z-index: 1000;
	position: relative;
}

.icon {
	display: inline-block;
	margin: 5px;
	padding-left: 10px;
}

.subname_container {
	margin-top: 10px;
}

.subname {
	display: inline-block;
	margin-bottom: 10px;
	font-size: 18px;
}

#add_my_course {
	right: 0;
	position: absolute;
	margin-top: 5px;
}

#user_course {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}
</style>
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../../includes/header.jsp"></jsp:include>



		<main>
		<p>test</p>
			<p>${mycoursecommontodetailpage.mycoursecommonid}</p>
			
			<p>${mycoursecommontodetailpage.userid}</p>
			<p>${mycoursecommontodetailpage.mycoursecommontitle}</p>
			<p>${mycoursecommontodetailpage.mycourseinfo}</p>
			<c:forEach var="item1" items="${mycoursedetailtodetailpage}">
				
					<div class="subname_container">
					<p >${item1.mycoursecommonid}</p>
						<p >${item1.userid}</p>
						<p >${item1.mycoursedetailname}</p>
						<p >${item1.mycoursedetailoverview}</p>
						<br>
						<p>test</p>
					</div>
				
			</c:forEach>
		</main>



		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>