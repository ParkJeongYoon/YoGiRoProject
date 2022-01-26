<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
   href="${pageContext.request.contextPath}/css/default.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js"
   crossorigin="anonymous"></script>
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

#table-con {
   width: 100%;
   margin: 34px 20px;
   height: 300px;
}

.mypage_info{
   display:block;
   justify-content:center;
   
}

.mypage_info > div{
   border: 1px solid #ffff;
   padding:20px;
   height:50px;
}

.inputarea{
   width:80%;
   display:flex;
   
}
div.inputarea{
   margin:20px;
   padding:0;
}

.input-info{
   width:100%;
}
.input-info> input{
   width:100%;
   border-style:none;
   height:100%;
}
label{
   margin-top:20px;
   color:#ffff;
}
.label{
   width:30%;
   text-align:center;
}
div.label{
   height:50px;   
   background-color:#B2DFDB;
   padding:15px;
}

/* table {
   width: 100%;
   height : 80%;
   text-align: center;
} */

.mypage-btn {
   text-align: center;
   margin-top: 20px;
   justify-content: space-between;
   font-size: 1.1rem;
}

.mypage-btn>button {
   position: relative;
   width: 100px;
   height: 40px;
   color: white;
   background-color: #b2dfdb;
   border: 1px solid #fafafa;
   border-radius: 10px;
}
</style>
</head>
<body>
   <!-- <header>
      <a href=""><h1 id="logo">YoGiRo</h1></a>
      <div class="right">
         <a href="" class="qna">문의하기</a> <a href="" class="login">마이페이지</a>
      </div>
      <div class="center">
         <a href=""><div class="topmenu">
               <p>음식점</p>
            </div></a> <a href=""><div class="topmenu">
               <p>축제</p>
            </div></a> <a href=""><div class="topmenu">
               <p>코스</p>
            </div></a> <a href=""><div class="topmenu">
               <p>커뮤니티</p>
            </div></a>
      </div>
   </header> -->
   <jsp:include page="../includes/header.jsp"></jsp:include>
   <div class="container">
      <div class="main-container">
         <aside>
            <div class="sidemenubar">
               <a href=""><div>
                     <h3>내 정보</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href=""><div>
                     <h3>즐겨찾기</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href=""><div>
                     <h3>문의 내역</h3>
                     <i class="fas fa-angle-right"></i>
                  </div></a> <a href="/member/mycommunity"><div>
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
            <h1 style="display: block;">내정보수정</h1>
            <div id="table-con">
            <form id="memberFrm" action="${ pageContext.request.contextPath }/member/update"
                  method="post">
               <div class="mypage_info">
                  <div class="inputarea">
                  <div class="label"><label for="username">이름</label></div>
                  <div class="input-info"><input type="text" id="username"></div>
                  </div>
                  <div class="inputarea">
                  <div class="label"><label for="usernickname">닉네임</label></div>
                  <div class="input-info"><input type="text" id="usernickname"></div>
                  </div>
                  <div class="inputarea">
                  <div class="label"><label for="userid">아이디</label></div>
                  <div class="input-info"><input type="text" id="userid"></div>
                  </div>
                  <div class="inputarea">
                  <div class="label"><label for="userpassword">비밀번호</label></div>
                  <div class="input-info"><input type="text" id="userpassword"></div>
                  </div>
                  <div class="inputarea">
                  <div class="label"><label for="userphonenumber">전화번호</label></div>
                  <div class="input-info"><input type="text" id="userphonenumber"></div>
                  </div>
                  <div class="inputarea">
                  <div class="label"><label for="useremail">이메일</label></div>
                  <div class="input-info"><input type="text" id="useremail"></div>
                  </div>
               </div>
               <div class="mypage-btn">
                  <button type="button" id="updatePw">비밀번호변경</button>
                  <button type="button" id="insertPw">정보수정</button>
                  <button type="button" id="deletemember">탈퇴</button>
               </div>
               </form>
            </div>
         </main>
      </div>
      <jsp:include page="../includes/footer.jsp"></jsp:include>
   </div>

</body>
</html>