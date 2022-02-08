<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style>
@import url('http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css');

.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

#info {
	position: absolute;
	right: 0;
	display: inline-block;
	background-color: pink;
}

#mycoursecommontitle {
	font-size: 16px;
}

#firstimgtitle {
	display: inline-block;
}

#regionlabel {
	display: inline-block;
}
#myfooddetail {
		width: 100%;
		height: 100%;
}
</style>
</head>
<body class="body">
	<div class="container">
		<jsp:include page="../../includes/header.jsp"></jsp:include>

		<main>
			<br> <br> <br> <br> <br>
			<h1>내 맛집 리뷰 작성</h1>
			<br>
			<p id="info">
				<i class="xi-check-min"></i>는 필수
			</p>
			<br>
			<br>
			<br>
			<br>
			<br>
			<h2>
				<i class="xi-check-min"></i>공통정보
			</h2>
			<br>
			<br>
			<br>

			<form action="${pageContext.request.contextPath}/create_my_food"
				method="POST">
				<ul>
					<li><label for="myfoodname">음식점 이름 : </label> <input
						type="text" id="myfoodname" name="myfoodname"></li>

				</ul>


				<br>
				<h3 id="firstimgtitle">대표 이미지 첨부 :</h3>
				<label for="upload">파일 추가 : </label><input type="file"
					name="uploadFile" id="uploadFile" onchange="f_changeFunc(this)"/> <br>
				<div id="add_image_div"></div>
				<br>
				<h3>맛집 설명 :</h3>
				<li><textarea name="myfooddetail" id="myfooddetail" cols="50"
						rows="10"></textarea></li> <br> <br> <br> <br> <br>

				<li><label for="myfoodaddress">맛집 주소 : </label><input
					type="text" name="myfoodaddress" id="myfoodaddress" /></li> <br>
				<li><label for="region" id="regionlabel">권역 : </label> <select
					name="region" id="region">
						<option value="서울">수도권</option>
						<option value="강원">강원권</option>
						<option value="충청">충청권</option>
						<option value="전라">전라권</option>
						<option value="경상">경상권</option>

				</select></li> <br> <br>
				<br>
				<br>
				<br> <input type="submit" value="전송" /> <br>
				<br>
				<br>
				<br>
			</form>

		</main>

		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		// 에디터
		window.onload = function() {
			ck = CKEDITOR.replace("myfooddetail",{
					filebrowserUploadUrl : '${pageContext.request.contextPath}/add_my_food/imageUpload',
					enterMode : '2'
			}); // 파일업로드 컨트롤러로 보내기
		};
		
		/* 대표 이미지 업로드 */
		function f_changeFunc(obj){
			let formData = new FormData();
			let fileInput = $(obj);
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			
			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
			
			formData.append("uploadFile", fileObj);
			
			$.ajax({
				url: '${pageContext.request.contextPath}/uploadAjaxAction',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json',
		    	success : function(result){
			    	console.log(result);
			    	showUploadImage(result);			    	
			    },
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
			});	
		}
		
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
		
		/* input 추가 */
		function showUploadImage(uploadResultArr){
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			let uploadResult = $("#add_image_div");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') +"/"+ obj.uuid + "_" + obj.fileName);
			
			str += "<input type='hidden' name='myfoodimg' value='"+ obj.uploadPath.replace(/\\/g, '/') +"/"+obj.uuid +"_" +obj.fileName+"'>";
			
			uploadResult.append(str);
		}
	</script>
</body>
</html>
