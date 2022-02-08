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
<style>

 @import url('http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css');
 main {
	background-color: #FAFAFA;
	border-radius : 15px;
	padding : 50px;
}
#myfoodtitle {
	border-bottom : 2px solid gray;
	display : inline-block;
}
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

#info{
	position: absolute;
	right : 0;
	display : inline-block;
	background-color : pink;
}
#mycoursecommontitle{
	font-size : 16px;
}
#firstimgtitle{
	display : inline-block;
}
#mycourseregionlabel{
	display : inline-block;
}

.noenter{
	display : inline-block;
	margin-right : 10px;
}
#send{
	padding : 10px 30px;
	font-size : large; 
	background-color : #B2DFDB;
	border-radius : 15px;
	box-sizing: border-box; 
    margin: 0 auto; 
    position: relative;
    display:block;
    width : 200px;

}
#add_course_btn{
	background-color : #B2DFDB;
	border-radius : 15px;
	padding : 5px 10px;
}

#delete_btn{
	background-color : #F8B4D6;
	border-radius : 15px;
	padding : 5px 10px;
	margin-bottom : 15px;
}
</style>
</head>
<body class="body">
	<div class="container">
		<jsp:include page="../../includes/header.jsp"></jsp:include>
		<br> <br> <br> <br> <br>
		<main>
			
			<h1 id="myfoodtitle">내 코스 작성</h1>
			<br>
			<br><br><br><br><br>
			<h2>
				<i class="xi-check-min"></i>공통정보
			</h2>
			<br><br><br>
			
				<form action="${pageContext.request.contextPath}/create_my_course" method="POST">
					<ul>
						<li><label for="mycourse_commontitle"><h3 class="noenter">코스 제목 : </h3></label> <input
							type="text" id="mycoursecommontitle" name="mycoursecommontitle"></li><br>

					</ul>


					<br>
					<label for="upload"><h3 class="noenter">파일 추가 : </h3></label><input type="file"
						name="uploadFile0" id="uploadFile0" onchange="f_changeFunc(this)"/> <br><br>
					<div id="add_image_div0"></div>
					<br> 
					<h3>개요 :</h3><br>
					<li><textarea name="mycourseinfo" id="mycourseinfo" cols="50"
							rows="10"></textarea></li> <br> <br> <br> <br> <br>
					<br> <br>
					<h2><i class="xi-check-min"></i>코스</h2>
					<br> <br>
					<li><label for="totaldistance"><h3 class="noenter">총 거리 : </h3></label><input
						type="text" name="totaldistance" id="totaldistance" /></li> <br><br>
					<li><label for="totaltime"><h3 class="noenter">소요 시간 : </h3></label><input type="text"
						id="totaltime" name="totaltime" /></li> <br><br>
					<li><label for="mycourseregion" id="mycourseregionlabel"><h3 class="noenter">권역 : </h3></label>
					<select name="mycourseregion" id="mycourseregion">
						<option value="서울">수도권</option>
						<option value="강원">강원권</option>
						<option value="충청">충청권</option>
						<option value="전라">전라권</option>
						<option value="경상">경상권</option>
					
					</select>
					</li>
					 <br>


					<br> <br> <br> <br> <br> <br> <br>
					<h2><i class="xi-check-min"></i>코스 정보</h2>
					<br> <br>
					<div id="my_course_detail">
						<ul>
							<li><label for="mycoursedetailname1"><h3 class="noenter">장소 이름 : </h3></label> 
							<input type="text" name="mycoursedetailname1" id="mycoursedetailname1" /></li><br>
							<br>
							<label for="uploadFile1"><h3 class="noenter">코스 이미지 첨부 :</h3></label>
							<input type="file" name="uploadFile1" id="uploadFile1" onchange="f_changeFunc(this)"/> <br>
							<div id="add_image_div1"></div><br>
							<br> 
							<li><label for="mycoursedetailoverview1"><h3 class="noenter">장소 설명 : </h3></label> 
							<input type="text" id="mycoursedetailoverview1"
								name="mycoursedetailoverview1" /></li><br>
							<br>
						</ul>
					</div>

					<%-- <c:set var="num" value="1" /> --%>
					
					<a onclick="addForm();" style="cursor: pointer" id="add_course_btn">코스추가</a>

					<div id="add_my_course_detail" class="sr-only">
						<div id="form_input">
							<button type="button" onclick="delForm(this);" id="delete_btn">삭제</button>
							<li>
							<label for="mycoursedetailname">장소 이름 : </label>
							<input type="text" name="mycoursedetailname" id="mycoursedetailname" />
							</li>
							<br>
							<label for="uploadFile">코스 이미지 첨부 :</label>
							<input type="file" name="uploadFile" id="uploadFile" onchange="f_changeFunc(this)"/> <br>
							<div id="add_image_div"></div>
							<br> 
							</li>
							<li>
							<label for="mycoursedetailoverview">장소 설명 : </label>
							<input type="text" id="mycoursedetailoverview"
								name="mycoursedetailoverview" />
								</li> 
							<br>
						
						</div>
					</div>
					<br><br><br><br>
					<input type="submit"  id="send" value="등록" style="cursor: pointer"/>
					<br><br><br><br>
				</form>
				
		</main>

		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		let num = 2;
		let callnum = 0;
		function addForm() {
			$('#my_course_detail').append($('#add_my_course_detail').html());
			
			$("#mycoursedetailname").attr('id','mycoursedetailname'+num);
			$("#mycoursedetailname"+num).attr('name','mycoursedetailname'+num);
			$("#mycoursedetailoverview").attr('id','mycoursedetailoverview'+num);
			$("#mycoursedetailoverview"+num).attr('name','mycoursedetailoverview'+num);
			
					
			$("#uploadFile").attr('id','uploadFile'+num);
			$("#uploadFile"+num).attr('name','uploadFile'+num);
			$("#add_image_div").attr('id','add_image_div'+num);
			num++;
			
		}

		function delForm(obj) {
			var div = $(obj).parent();
			//console.log(div);
			//라인 삭제
			div.remove();
			num--;
		}
		
		
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
			let uploadResult = $("#add_image_div"+callnum);
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			//let fileCallPath = obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName;
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') +"/"+ obj.uuid + "_" + obj.fileName);
			
			str += "<input type='hidden' name='mycoursemainimage"+callnum+"' value='"+ obj.uploadPath.replace(/\\/g, '/') +"/"+obj.uuid +"_" +obj.fileName+"'>";
			
			uploadResult.append(str);
			callnum++;
		}
	</script>
</body>
</html>
