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
#course_real_container{
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

#course_top {
   display: inline-block;
}

#search_btn {
   height: 35px;
   width: 80px;
   /* position: absolute;
   right: 0px; */
   float : right;
   background-color: #B2DFDB;
   border-radius : 15px;
}

#search_btn:hover {
   background-color: #92C8FF;
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
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 20px;
   justify-content: center; /* 수평 가운데 정렬 */
}

.course_content {
   border: 1px solid black;
   border-radius: 30px;
   width: 18vw;
}

.bg {
   background-color: rgba(0, 0, 0, 0.5);
   border-radius: 30px;
   width: 18vw ;
   height: 100px;
   position: absolute;
}

.div_image {
   border-radius: 30px;
   width: 18vw;
   height: 100px;
   background-size: cover;
   background-repeat: no-repeat;
   max-width : 100%;
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
   display: grid;
   grid-template-columns: repeat(3, 1fr);
   gap: 20px;
   justify-content: center; /* 수평 가운데 정렬 */
}

.mycourse_content {
   border: 1px solid black;
   border-radius: 30px;
   width: 18vw;
}


</style>
</head>
<body class="body">
   <div class="container">

      <jsp:include page="../../includes/header.jsp"></jsp:include>

      <br><br>
      <main>
         <aside>
            <div class="sidemenubar">
               <a href="#" onclick="acyncMovePage('move-to-course-main-ajax?region=서울')"><div>
                     <h3>수도권</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href="#" onclick="acyncMovePage('move-to-course-main-ajax?region=강원')"><div>
                     <h3>강원권</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href="#" onclick="acyncMovePage('move-to-course-main-ajax?region=충청')"><div>
                     <h3>충청권</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href="#" onclick="acyncMovePage('move-to-course-main-ajax?region=전라')"><div>
                     <h3>전라권</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href="#" onclick="acyncMovePage('move-to-course-main-ajax?region=경상')"><div>
                     <h3>경상권</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a>
            </div>
         </aside>
         <div id="course_real_container">
            <div id="course_top">
               <h1>코스</h1>
               <div id="search_box">
                  <button id="search_btn" onclick="location.href='course_more?region=${commonList[0].region}'">더보기</button>
               </div>
            </div>

            <div class="course_container">
               <div id="main_course">

                  <c:forEach var="i" begin="0" end="2">
                     <div id="course${i}" class="course_content">

                        <a href="course_detail?contentid=${commonList[i].contentid}&themecode='2'" class="course-a">
                        
                           <div class="div_image"
                              style="background-image: url('${commonList[i].firstimage}')">
                              <div class="bg"></div>
                              <p>${commonList[i].title}</p>
                           </div>
                           
                        </a>


                        <c:forEach var="item" items="${detailList}">

                           <c:if test="${item.contentid eq commonList[i].contentid}">
                              <div class="subname_container">
                                 <img class="icon"
                                    src="https://cdn.visitkorea.or.kr/resources/images/sub/ico_leftobj.png"
                                    alt="" />
                                 <p class="subname">${item.subname}</p>
                                 <br>
                              </div>
                           </c:if>
                        </c:forEach>
                     </div>
                  </c:forEach>

               </div>



            </div>
            <br /> <br />
            <hr />
            <br /><br />
            <h1>YoGiRo 어때요?</h1>
            <div id="search_box">
                  <button id="search_btn" onclick="location.href='mycourse_more?region=${commonList[0].region}'">더보기</button>
               </div>
            <br />
            <c:if test="${sessionScope.account.userid != null}">
            <br> <a href="${pageContext.request.contextPath}/add_my_course"><h4 id="add_my_course">내 코스 올리기</h4></a> <br>
            <br>
            </c:if>
            <div class="course_container">
               <div id="user_course">


                  <c:forEach var="j" begin="0" end="2">
                     <c:if test="${myCommonList[j].mycoursecommonid != null}">
                        <div id="my_course${j}" class="mycourse_content">
                        
                           <a href="mycourse_detail?mycoursecommonid=${myCommonList[j].mycoursecommonid}">
                              <div class="image_wrap div_image" data-mycoursemainimage="${myCommonList[j].mycoursemainimage}">
                                 <div class="bg"></div>
                                 <p>${myCommonList[j].mycoursecommontitle}</p>
                              </div>
                           </a>
                           
                        <c:forEach var="item2" items="${myDetailList}">

                           <c:if
                              test="${item2.mycoursecommonid eq myCommonList[j].mycoursecommonid}">
                              <div class="subname_container">
                                 <img class="icon"
                                    src="https://cdn.visitkorea.or.kr/resources/images/sub/ico_leftobj.png"
                                    alt="" />
                                 <p class="subname">${item2.mycoursedetailname}</p>
                                 <br>
                              </div>
                           </c:if>
                        </c:forEach>
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
   $(document).ready(function() {
      /* 이미지 삽입 */
      $(".image_wrap").each(function(i, obj){
         
         const bobj = $(obj);
         if(bobj.data("mycoursemainimage")){
            const filecall = bobj.data("mycoursemainimage");
            
            const fileCallPath = encodeURIComponent(filecall);
            
            $(this).attr('style', "background-image: url('${pageContext.request.contextPath}/display?fileName="+fileCallPath+"')");
            
         }else{
            $(this).attr('style', "background-image: url('${pageContext.request.contextPath}/resources/img/noimg.jpg')");
            
         }
         
      });
                
   
   });
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
            $('#course_real_container').children().remove();
            // Contents 영역 교체
            $('#course_real_container').html(data);
        });
    }
 
</script>


</body>
</html>