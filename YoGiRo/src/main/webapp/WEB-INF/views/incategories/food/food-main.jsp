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
	display: flex;
	width: 1600px;
	flex-direction: row;
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
#food_real_container{
	display: flex;
	flex-direction: column;
	width :  100%;
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

#food_top {
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

.food_container {
	width: 100%;
	height: auto;
	margin-top: 80px;
	display: flex;
	flex-wrap: wrap;
}

#main_food {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: space-around;
	flex-wrap: wrap;
}

.food_content {
	width: 18vw;
	margin-bottom: 20px;
	overflow : hidden;
}



.div_image {
	border-radius: 30px;
	height: 250px;
	width : 18vw;
	background-size: cover;
	background-repeat: no-repeat;
	max-width : 100%;
	margin-bottom: 20px;
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

#add_my_food {
	right: 0;
	position: absolute;
	margin-top: 5px;
}

#user_food {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

.myfood_content {
	width: 19vw;
	margin-right : 2vw;
	margin-left : 2vw;
}
p {
	overflow :hidden;
}
</style>
</head>
<body class="body">
	<div class="container">

		<jsp:include page="../../includes/header.jsp"></jsp:include>



		<main>
			<aside>
				<div class="sidemenubar">
					<a href="#" onclick="acyncMovePage('move-to-food-main-ajax?region=서울')"><div>
							<h3>수도권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#" onclick="acyncMovePage('move-to-food-main-ajax?region=강원')"><div>
							<h3>강원권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#" onclick="acyncMovePage('move-to-food-main-ajax?region=충청')"><div>
							<h3>충청권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#" onclick="acyncMovePage('move-to-food-main-ajax?region=전라')"><div>
							<h3>전라권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a> <a href="#" onclick="acyncMovePage('move-to-food-main-ajax?region=경상')"><div>
							<h3>경상권</h3>
							<i class="fas fa-angle-right"></i>
						</div></a>
				</div>
			</aside>
			<div id="food_real_container">
				<div id="food_top">
					<h1>음식점</h1>
					<div id="search_box">
						<button id="search_btn" onclick="location.href='food_more?region=${foodList[0].region}'">더보기</button>
					</div>
				</div>
 
				<div class="food_container">
					<div id="main_food">

						<c:forEach var="i" begin="0" end="5">
							<div id="food${i}" class="food_content"> 

								<a href="food_detail?contentid=${foodList[i].contentid}&themecode=3" class="course-a">
								
									<div class="div_image"
										style="background-image: url('${foodList[i].firstimage}')">
										
									</div>
									<p>${foodList[i].title}</p>
								</a>


								
							</div>
						</c:forEach>

					</div>



				</div>
				<br /> <br />
				<hr />
				<br /><br />
				<h1>맛집 리뷰!</h1>
				<div id="search_box">
						<button id="search_btn" onclick="location.href='myfood_more?region=${foodList[0].region}'">더보기</button>
					</div>
				<br /><br />
				<br> <a href="${pageContext.request.contextPath}/add_my_food"><h4 id="add_my_food">나의 맛집 올리기</h4></a> <br>
				<br>
				<div class="food_container">
					<div id="user_food">


						<c:forEach var="j" begin="0" end="2">
							<c:if test="${myFoodList[j].myfoodid != null}">
								<div id="my_food${j}" class="myfood_content">

									<a href="myfood_detail?myfoodid=${myFoodList[j].myfoodid}">
										<div class="div_image"
											style="background-image: url('${myFoodList[j].myfoodimg}')">
											
											
										</div>
										<p>${myFoodList[j].myfoodname}</p>
									</a>

									
								  
							</div>
							</c:if>
						</c:forEach>
					
					</div>
				</div>
			</div>
		</main>
		

		<br><br><br><br><br><br>
		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script>
 
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
            $('#food_real_container').children().remove();
            // Contents 영역 교체
            $('#food_real_container').html(data);
        });
    }
 
</script>


</body>
</html>