<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<style>
.container{
	position: relative;
    left: 50%;
    transform: translateX(-50%);
    display: flex;
    flex-direction: column;
    justify-content: center;
    max-width: 1600px;
    padding-right: 1.7rem;
    padding-left: 1.7rem;
}
.main-container {
    width: 100%;
    height: 800px;
    display: flex;
}

aside {
	position: relative;
	height: 200px;
	width: 180px;
	margin-right: 30px;
	margin-top: 100px;
}

.sidemenubar {
	/*position: absolute;
      left: 0;
      top: 150px;*/
	
}

.sidemenubar>a>div {
	width: 180px;
	height: 47px;
	background-color: #fafafa;
	border: 1.3px solid #e7e7e7;
	display: flex;
	/*      justify-content: center;*/
	align-items: center;
}

.sidemenubar>a>div>h3 {
	margin-right: 20px;
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
	margin-left: 30px;
	margin-top: 50px;
	/* margin-left: 30px; */
	width: 80%;
	height: 700px;
	position: relative;
}

main>h1 {
	margin-left: 20px;
}

div {
	box-sizing: content-box;
}

#table-con {
	width: 100%;
	margin: 34px 20px;
	height: auto;
}

table, th, td, tr {
	border-radius: 10px;
}

table {
	width: 70%;
	line-height: 3;
	border-collapse: separate;
	border-spacing: 30px;
	height: auto;
}

tr {
	border-style: none;
}

td {
	text-align: center;
}

.info {
	width: 80%;
	height: 100%;
	border-style: none;
	font-size: 1rem;
	margin-left: 20px;
}

.info_title2 {
	width:30%;
	background: #B2DFDB;
	color: white;
}

.info_box {
	background-color: white;

}

.info_btn {
	margin-top: 20px;
	padding: 10px;
	border-radius: 5px;
	font-size: 1rem;
	color: white;
	background-color: #B2DFDB;
	border: 1px solid #ffff;
	float: right;
}
</style>
</head>
<body>

	<div class="container">
	<jsp:include page="../includes/header.jsp"></jsp:include>
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="${pageContext.request.contextPath}/mypage">
						<div>
							<h3>내 정보</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> 
					<a href="${pageContext.request.contextPath}/myqna"><div>
							<h3>문의 내역</h3>
							<i class="fas fa-angle-right"></i>	
							</div></a> 
					<a href="${pageContext.request.contextPath}/mycommunity"><div>
							<h3>내 글 보기</h3>
							<i class="fas fa-angle-right"></i>
							</div></a> 
					<a href="${pageContext.request.contextPath}/mycourse"><div>
							<h3>내 코스</h3>
							<i class="fas fa-angle-right"></i>
							</div></a> 
					<a href="${pageContext.request.contextPath}/myrestaurant"><div>
							<h3>내 음식점</h3>
							<i class="fas fa-angle-right"></i>
							</div></a>
				</div>
			</aside>
			<main>
				<h1 style="display: block;">내정보수정</h1>
				<div id="table-con">
					<form action="${pageContext.request.contextPath}/update_result" method="post" >
						<table cellpadding="30" cellspacing="50">
							<tr>
								<td class="info_title2">이름</td>
								<td class="info_box"><input class="info" type="text" value="${account.username}" id="username" name="username"> </td>
							</tr>
							<tr>
								<td class="info_title2">닉네임</td>
								<td class="info_box"><input class="info" type="text" value="${account.usernickname}" id="usernickname" name="usernickname" ></td>
							</tr>
							<tr>
								<td class="info_title2">아이디</td>
								<td class="info_box"><input class="info" type="text" value="${account.userid }" id="userid" name="userid" readonly></td>
							</tr>
							<tr>
								<td class="info_title2">비밀번호</td>
								<td class="info_box"><input class="info" type="password" id="userpassword" name="userpassword" required="required"></td>
							</tr>
							<tr>               
								<td class="info_title2">전화번호</td>
								<td class="info_box"><input class="info" type="text" value="${account.userphonenumber}" id="userphonenumber" name="userphonenumber"></td>
							</tr>
							<tr>
								<td class="info_title2">이메일</td>
								<td class="info_box"><input class="info" type="text" value="${account.useremail}" id="useremail" name="useremail"></td>
							</tr>
							<tr>
								<td colspan="2">
									<button id="updatebtn" type="submit" class="info_btn">수정하기</button>
									<button id="cancle" class="info_btn" type="button">취소</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	<script>
	$(document).ready(function(){
		// 취소
		$("#cancle").on("click", function(){
			
			location.href = "${pageContext.request.contextPath}/member/mypage";
					    
		})
		
		$("#updatebtn").on("click", function(){
			if($("#userpassword").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#userpassword").focus();
				return false;
			}
			if($("#username").val()==""){
				alert("성명을 입력해주세요.");
				$("#username").focus();
				return false;
			}
			if($("#usernickname").val()==""){
				alert("닉네임을 입력해주세요.");
				$("#usernickname").focus();
				return false;
			}
			if($("#useremail").val()==""){
				alert("이메일을 입력해주세요.");
				$("#useremail").focus();
				return false;
			}
			if($("#userphonenumber").val()==""){
				alert("전화번호를 입력해주세요.");
				$("#userphonenumber").focus();
				return false;
			}
			else{
				alert("다시 로그인 해주세요.");
			}
		});
		
			
		
	});
	
	</script>
</body>
</html>