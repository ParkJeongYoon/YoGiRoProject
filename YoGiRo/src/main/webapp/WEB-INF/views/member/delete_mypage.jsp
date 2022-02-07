<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
.main-container {
	margin-left: 30px;
	width: 100%;
	height: 80%;
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
	font-size: 1.1rem;
	margin-left: 20px;
}

.info_title {
	background: #B2DFDB;
	color: white;
}

.info_box {
	background-color: white;
}
.info_box > input {
	border-style: none;
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

	<jsp:include page="../includes/header.jsp"></jsp:include>

	<div class="container">
		<div class="main-container">
			<aside>
				<div class="sidemenubar">
					<a href="">
						<div>
							<h3>내 정보</h3>
							<i class="fas fa-angle-right"></i>
						</div>
					</a> <a href=""><div>
							<h3>즐겨찾기</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href=""><div>
							<h3>문의 내역</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="${pageContext.request.contextPath}/member/mycommunity"><div>
							<h3>내 글 보기</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href=""><div>
							<h3>내 코스</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href=""><div>
							<h3>내 음식점</h3>
							<i class="fas fa-angle-right"></i>
						</div></a>
				</div>
			</aside>
			<main>
				<h1 style="display: block;">내정보</h1>
				<div id="table-con">
					<form action="${pageContext.request.contextPath}/delete_Result"
						name="delForm" id="delForm" method="post">
						<table cellpadding="30" cellspacing="50">
							<tr>
								<td class="info_title">아이디</td>
								<td class="info_box"><input type="text" id="userid" name="userid"
									value="${account.userid}" required="required" readonly></td>
							</tr>
							<tr>
								<td class="info_title">비밀번호</td>
								<td class="info_box"><input type="password" id="userpassword" name="userpassword" value="${sessionScope.account.userpassword}"></td>
							</tr>
							<tr>
								<td class="info_title">비밀번호확인</td>
								<td class="info_box"><input type="password" id="userpasswordCheck" name="userpasswordCheck"></td>
							</tr>
							<tr>
							<td colspan="2">
								<button id="delbtn" type="submit" class="info_btn">탈퇴</button>
								<button id="cancle" type="button" class="info_btn">취소</button>
							</td>
							</tr>
						</table>
					</form>
				</div>
			</main>
		</div>
		<jsp:include page="../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
			// 취소
			$("#cancle").on("click", function(){
				
				location.href = "${pageContext.request.contextPath}/member/mypage";
						    
			})
		
			$("#delbtn").on("click", function(){
				if($("#userpasswordCheck").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpasswordCheck").focus();
					return;
				}
				
				/* 비밀번호 같은지 확인 */
				if($("#userpasswordCheck").val() != $("#userpassword").val()){
					alert("비밀번호가 일치하지 않습니다.");
					$("#userpasswordCheck").focus();
					return;
				}
					
				/* 비밀번호가 맞는지 확인 */
				$.ajax({
					url : "${pageContext.request.contextPath}/passChk",
					type : "POST",
					dataType : "json",
					data : $("#delForm").serializeArray(),
					success: function(data){
						if(data==0){
							alert("비밀번호가 틀렸습니다.");
							return;
						}else{
							var result = confirm('정말 탈퇴 하시겠습니까?');
							if(result){
								$("#delForm").submit();
							}
							
						}
					},
					error:function(){
						alert("서버 에러");
					}
				});
				
			});
				
		})
	</script>
</body>
</html>