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
			         <a href="${pageContext.request.contextPath}/manager/manager1/manager-chart"><div><h3>방문자수 통계</h3><i class="fas fa-angle-right"></i></div></a>
			         <a href="${pageContext.request.contextPath}/manager/manager2/manager-que"><div><h3>문의내역 보기</h3><i class="fas fa-angle-right"></i></div></a>
			         <a href="${pageContext.request.contextPath}/manager/manager3/manager-member"><div><h3>회원관리</h3><i class="fas fa-angle-right"></i></div></a>
			         <a href="${pageContext.request.contextPath}/manager/manager4/manager-block-member"><div><h3>차단회원 관리</h3><i class="fas fa-angle-right"></i></div></a>
			         <a href="${pageContext.request.contextPath}/manager/manager5/manager-community"><div><h3>게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
			         <a href="${pageContext.request.contextPath}/manager/manager6/manager-delete-community"><div><h3>삭제된 게시글 관리</h3><i class="fas fa-angle-right"></i></div></a>
			 </div>
	   		</aside>
	   		<main>
	   			<div class="main2">
			   		<h1>문의 내역</h1>
                    <div class="community" >
                        <table>
                            <thead>
                               <tr>
                                  <th>번호</th>
                                  <th>제목</th>
                                  <th>작성자</th>
                                  <th>작성일</th>
                                  
                               </tr>
                            </thead>
                            <tbody>
                             
                            	<c:forEach var="item" items="${list}" >
                            		<tr>
	                                  <td>${item.qnum}</td>
	                                  <td>
	                                  	${item.qtitle}
	                                  </td>
	                                  <td>${item.userid}</td>
	                                  <td>${item.qcreatedate}</td>
                               		</tr>
                            	</c:forEach>
                            	
                            </tbody>
                         </table>
                         <div class="paging" style="text-align: center; margin-top: 30px;">
                         	<c:choose>
								<c:when test="${(minBlock-1) < 1 }">
									<span>◀◀</span>	
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/bbs/main?num=${minBlock-1}${query}">◀◀</a>
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;
							<c:choose>
								<c:when test="${num==1 }">
									<span>◀</span>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/bbs/main?num=${num-1}${query}">◀</a>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="${minBlock}" end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
								<c:choose>
									<c:when test="${num == i}">
										<span>${i}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageContext.request.contextPath}/bbs/main?num=${i}${query}">${i}</a>
									</c:otherwise>
								</c:choose>
						
							</c:forEach>
							<c:choose>
								<c:when test="${num == total }">
									<span>▶</span>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/bbs/main?num=${num+1}${query}">▶</a>	
								</c:otherwise>
							</c:choose>
							&nbsp;&nbsp;
							<c:choose>
								<c:when test="${maxBlock > total }">
									<span>▶▶</span>	
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/bbs/main?num=${maxBlock+1}${query}">▶▶</a>
								</c:otherwise>
							</c:choose>
                         </div>
							
									
                        <div class="com-input">
                            <select name="category" id="category">
                                  <option value="comtitle">제목</option>
                                  <option value="comcontent">내용</option>
                                  <option value="comboth" selected>제목+내용</option>
                            </select>
                            <input id="search-text" type="text">
                            <button id="search">검색</button>
                      
                        </div>
                    </div>
                    
			 	</div>
	   		</main>
   		</div>
   	 
   		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
</body>
</html>