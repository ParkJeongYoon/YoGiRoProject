<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
<script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
<style>


.main-container {
   width: 100%;
   height: 80%;
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
   margin-top: 50px;
   margin-left: 30px;
   width: 70%;
   height: 80%;
   position: relative;
}

main>h1 {
   margin-left: 20px;
}

#table-con {
   margin: 34px 20px;
   height: 80%;
}
table, th, tr, td {
   height: 20%;
   border-spacing: 0px 20px;
}

tr {
   border-bottom: 1px solid #e7e7e7;
   margin-top:20px;
}

th {
   color: white;
   width: 30%;
   background-color: #b2dfdb;
}

td {
   width: 70%;
   border: 1px solid #82ada9;
}

/* table {
   width: 100%;
   height : 80%;
   text-align: center;
} */

table input {
   margin-left: 20px;
   border-style: none;
   width: 90%;
   height: 100%;
   font-size: 1.1rem;
}

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
                  <h3>내 정보2</h3>
                  <i class="fas fa-angle-right"></i>
               </div></a> <a href=""><div>
                  <h3>즐겨찾기</h3>
                  <i class="fas fa-angle-right"></i>
               </div></a> <a href=""><div>
                  <h3>문의 내역</h3>
                  <i class="fas fa-angle-right"></i>
               </div></a> <a href=""><div>
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
            <form id="memberFrm"
               action="#"
               method="post">
               <table>
                  <tr>
                     <th>이름</th>
                     <td><input type="text" name="username" id="username"
                        value="" required /></td>
                  </tr>
                  <tr>
                     <th>닉네임</th>
                     <td><input type="text" name="usernickname" id="usernickname"
                        value="" required /></td>
                  </tr>
                  <tr>
                     <th>아이디</th>
                     <td><input type="text" name="userid" id="userId" value=""
                        readonly required /></td>
                  </tr>
                  <tr>
                     <th>비밀번호</th>
                     <td><input type="password" name="userpassword"
                        id="userpassword" value="" required /></td>
                  </tr>
                  <tr>
                     <th>전화번호</th>
                     <td><input type="tel" name="userphonenumber"
                        id="userphonenumber" value="" maxlength="11" />
                     </td>
                  </tr>
                  <tr>
                     <th>이메일</th>
                     <td><input type="email" name="useremail" id="useremail"
                        value="" /></td>
                  </tr>
               </table>
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