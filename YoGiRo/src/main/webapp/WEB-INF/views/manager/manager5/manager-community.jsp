<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/questions.css">
    <script src="https://kit.fontawesome.com/79203d0d3b.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div class="container">
		
		
			<jsp:include page="../../includes/header.jsp"></jsp:include>
		<div class="middle-container">
		<aside>
		
		 <div class="sidemenubar">
		         
		         <a href="${pageContext.request.contextPath}/manager/manager2/manager-que"><div><h3>문의내역 보기</h3><i class="fas fa-angle-right"></i></div></a>
		         <a href="${pageContext.request.contextPath}/manager/manager3/manager-member"><div><h3>회원관리</h3><i class="fas fa-angle-right"></i></div></a>
		         <a href="${pageContext.request.contextPath}/manager/manager4/manager-block-member"><div><h3>차단회원 관리</h3><i class="fas fa-angle-right"></i></div></a>
		         <a href="${pageContext.request.contextPath}/manager/manager5/manager-community"><div><h3>게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
		         <a href="${pageContext.request.contextPath}/manager/manager6/manager-delete-community"><div><h3>삭제된 게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
		 </div>
   		</aside>
   		<main>
   			<div class="main2">
		   		<h1>게시판 관리</h1>
		   		<hr />
		   		<div class="community" >
                        <table>
                            <thead>
                               <tr>
                               	  <th>삭제여부
                               	  	<input type="checkbox" id="allCheck" name="allCheck" />
                               	  </th>
                               	  <th>번호</th>
                                  <th>카테고리</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  
                               </tr>
                            </thead>
                            <tbody>
                               <c:forEach var="item" items="${list}" >
                                  <tr>    
                                  	 <td><input type="checkbox" id="checkBox" name="delCheck" value="${item.comid}" /></td>                             	 
                                     <td>${item.comid}</td>
                                     <td>
                                     	<c:choose>
											<c:when test="${item.comcategorynum ==2}">
												축제
											</c:when>
											<c:when test="${item.comcategorynum==3}">
												교통
											</c:when>
											<c:when test="${item.comcategorynum==4}">
												추천 코스
											</c:when>
											<c:when test="${item.comcategorynum==5}">
												기타
											</c:when>
											<c:otherwise>
												맛집
											</c:otherwise>
										</c:choose>                             
                                     </td>
									<td><a
										href="${pageContext.request.contextPath}/incategories/community/community-detail?comid=${item.comid}">${item.comtitle}</a></td>
									<td>${item.comuserid}</td>
									<td>${item.comcreatedate}</td>
									
                                   </tr>
                               </c:forEach>
                               
                            </tbody>
                         </table>
               		<div class="pagenum" style="text-align: center; margin-top: 20px; ">
               			 <input type="button" value="삭제" class="delbtn" onclick="deleteValue();" />
               			 
						<%
						int num = (Integer) request.getAttribute("num");
						int count = (Integer) request.getAttribute("count");
						int total = count / 10 + ((count % 10 == 0) ? 0 : 1);
						int minBlock = (((num - 1) / 10) * 10) + 1;
						int maxBlock = (((num - 1) / 10) + 1) * 10;

						pageContext.setAttribute("total", total);
						pageContext.setAttribute("minBlock", minBlock);
						pageContext.setAttribute("maxBlock", maxBlock);

						String query = "";

						String title = (String) request.getAttribute("title");
						String content = (String) request.getAttribute("content");

						if (title != null) {
							query += "&title=" + title;
						}
						if (content != null) {
							query += "&content=" + content;
						}
						
						
						pageContext.setAttribute("query", query);
						%>
						<c:choose>
							<c:when test="${(minBlock-1) < 1}">
								<i class="fas fa-angle-double-left"></i>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/manager/manager5/manager-community?num=${minBlock-1}${query}">
									<span><i class="fas fa-angle-double-left"></i></span>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${num==1}">
								<span><i class="fas fa-chevron-left"></i></span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/manager/manager5/manager-community?num=${num-1}${query}">
									<span><i class="fas fa-chevron-left"></i></span>
								</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="${minBlock}"
							end="${maxBlock>total?total:maxBlock}" step="1" var="i">
							<c:choose>
								<c:when test="${num == i}">
									<b>${i}</b>
								</c:when>
								<c:otherwise>
									<a
										href="${pageContext.request.contextPath}/manager/manager5/manager-community?num=${i}${query}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${num==total}">
								<span><i class="fas fa-chevron-right"></i></span>
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/manager/manager5/manager-community?num=${num+1}${query}">
									<span><i class="fas fa-chevron-right"></i></span>
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${maxBlock > total}">
								<span> <i class="fas fa-angle-double-right"></i></span>  
							</c:when>
							<c:otherwise>
								<a
									href="${pageContext.request.contextPath}/manager/manager5/manager-community?num=${maxBlock+1}${query}">
									<span> <i class="fas fa-angle-double-right"></i></span>  
								</a>
							</c:otherwise>
						</c:choose>
					</div>
				
				 
				 <div class="cate-input">
				 	<c:choose>
			               <c:when test="${item.comcategorynum ==2}">
			                  <select name="category" id="category">
			                  	 <option>카테고리</option>
			                     <option value="food" selected>맛집</option>
			                     <option value="festa">축제</option>
			                     <option value="traffic">교통</option>
			                     <option value="course">추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			                  
			               </c:when>
			               <c:when test="${festa}">
			                  <select name="category" id="category">
			                  	 <option>카테고리</option>
			                     <option value="food">맛집</option>
			                     <option value="festa" selected>축제</option>
			                     <option value="traffic">교통</option>
			                     <option value="course">추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			               
			               </c:when>
			               <c:when test="${traffic}">
			                  <select name="category" id="category">
			                  	 <option>카테고리</option>
			                     <option value="food">맛집</option>
			                     <option value="festa">축제</option>
			                     <option value="traffic" selected>교통</option>
			                     <option value="course">추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			                 
			               </c:when>
			               <c:when test="${course}">
			                  <select name="category" id="category">
			                     <option>카테고리</option>
			                     <option value="food">맛집</option>
			                     <option value="festa">축제</option>
			                     <option value="traffic">교통</option>
			                     <option value="course" selected>추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			                  
			               </c:when>
			               <c:when test="${others}">
			                  <select name="category" id="category">
			                     <option>카테고리</option>
			                     <option value="food">맛집</option>
			                     <option value="festa">축제</option>
			                     <option value="traffic">교통</option>
			                     <option value="course" selected>추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			                  
			               </c:when>
			               <c:otherwise>
			                  <select name="category" id="category">
			                  	 <option selected>카테고리</option>
			                     <option value="food">맛집</option>
			                     <option value="festa">축제</option>
			                     <option value="traffic">교통</option>
			                     <option value="course">추천코스</option>
			                     <option value="others">기타</option>
			                  </select>
			                  
			               </c:otherwise>
			         </c:choose>
			         <button id="cate-search">검색</button>
				 </div>
				
				 <div class="com-input">
			              <c:choose>
			               <c:when test="${(title!=null)&&(content!=null)}">
			                  <select name="category" id="category">
			                     <option value="title">제목</option>
			                     <option value="content">내용</option>
			                     <option value="both" selected>제목+내용</option>
			                  </select>
			                  <input type="text" id="search-text" name="text" value="${title}" />
			               </c:when>
			               <c:when test="${title!=null}">
			                  <select name="category" id="category">
			                     <option value="title" selected>제목</option>
			                     <option value="content">내용</option>
			                     <option value="both">제목+내용</option>
			                  </select>
			                  <input type="text" id="search-text" name="text" value="${title}" />
			               </c:when>
			               <c:when test="${content!=null}">
			                  <select name="category" id="category">
			                     <option value="title">제목</option>
			                     <option value="content" selected>내용</option>
			                     <option value="both">제목+내용</option>
			                  </select>
			                  <input type="text" id="search-text" name="text" value="${content}" />
			               </c:when>
			               <c:otherwise>
			                  <select name="category" id="category">
			                     <option value="title">제목</option>
			                     <option value="content">내용</option>
			                     <option value="both">제목+내용</option>
			                  </select>
			                  <input type="text" id="search-text" name="text" />
			               </c:otherwise>
			            </c:choose>
            			<button id="search">검색</button>
                      
                        </div>
		 	</div>
		 </div>
   		</main>
   		</div>
   		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
   $(function() {
      
      $("#search").click(function() {
         let category = $("#category").val();
         let text = $("#search-text").val();
         
         if(category == "title") {
            location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?title="+text;
         }else if(category == "content") {
            location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?content="+text;
         }else if(category == "both") {
            location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?title="+text+"&content="+text;
         }
      });
      $('#search-text').on('keydown', function(e) {
         var keyCode = e.which; // 눌린 키 기록

         if (keyCode === 13) { // Enter Key
            let category = $("#category").val();
            let text = $("#search-text").val();
            
            if(category == "title") {
               location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?title="+text;
            }else if(category == "content") {
               location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?content="+text;
            }else if(category == "both") {
               location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?title="+text+"&content="+text;
            }
         }
      });
      
      
      
      $("#cate-search").click(function() {
          let category = $("#category").val();          
          
          if(category == "food") {
             location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?comcategory="+text;
          }else if(category == "festa") {
             location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?comcategory="+text;
          }else if(category == "traffic") {
             location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?comcategory="+text;
          }else if(category == "course") {
             location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?comcategory="+text;
          }else if(category == "others") {
             location.href = "${pageContext.request.contextPath}/manager/manager5/manager-community?comcategory="+text;
          }
       });
      
   });
   
	// 체크박스 전체 선택
   $(function(){
  	 const chkObj = document.getElementByName("delCheck");
  	 const rowCnt = chkObj.length;
  	 
  	 $("input[name='allCheck']").click(function(){
  		const chk_listArr = $("input[name='delCheck']");
  		for (var i=0; i < chk_listArr.length; i++){
  			chk_listArr[i].checked = this.checked;
  		}
  	 });
  	 $("input[name='delCheck']").click(function(){
  		 if($("input[name='delCheck']:checked").length == rowCnt){
  			 $("input[name='allCheck']")[0].checked = true;
  		 }
  		 else{
  			 $("input[name='allCheck']")[0].checked = false;
  		 }
  	 });
    });
    // 게시판 삭제
    function deleteValue(){
  	  
  	  const url = "delete";		// controller로 보내고자 하는 url
  	  const valueArr = new Array();
  	  const list = $("input[name='delCheck']");
  	  
  	  for (var i = 0; i < list.length; i++) {
			if (list[i].checked) { // 선택되어있으면 배열에 값을 저장
				valueArr.push(list[i].value);
			}
		}
  	  if(valueArr.length == 0){
  		  alert("삭제할 항목을 선택해주세요");
  		  
  	  }
  	  
  	  const chk = confirm('정말 삭제하시겠습니까?');
  	  
  	  if(chk){  
  		  
  		  $.ajax({
  			  type : 'POST',  
  			  url : url,		// 전송 URL
  			  dataType : 'json',
  			  data :{ valueArr : valueArr }, 	// 보내고자 하는 data 변수 설정		  
  			  success : function(result){
  				  if(result = 1) {
  					  alert("삭제 성공");
  					  location.replace("list") // list로 페이지 새로고침
  				  }else{
  					  alert("삭제 실패");
  				  }
  			  }
  		  })
  	  }
    }
   </script>
</body>
</html>