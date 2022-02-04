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
		   		<h1>회원 관리</h1>
		   		<hr />
		   		<table>
		   			
		   				<thead>
                               <tr>                                                                    
                                  <th>회원아이디</th>                                  
                                  <th>회원이메일</th>
                                  <th>차단여부</th>
                               </tr>
                        </thead>
                            <tbody> 
                            <c:forEach var="user" items="${list}" >                         	
                            	<tr>
	                               <td>${user.userid}</td>	                               
	                               <td>${user.useremail}</td>
	                               <td><label><input type="checkbox" name="bloCheck" value="${user.userid}"></label></td>
                               	</tr>
                            </c:forEach>                        	
                            </tbody>		   			              
                </table>
		   		
		   		<div class="pagenum" style="text-align: center; margin-top: 20px; ">
                      <%
                        int usernum = (Integer)request.getAttribute("usernumber");
                        int count = (Integer)request.getAttribute("count");
                        int total = count/10+((count%10==0)?0:1);
                        int minBlock = (((usernum-1)/10)*10)+1;
                        int maxBlock = (((usernum-1)/10)+1)*10;
                        
                        pageContext.setAttribute("total", total);
                        pageContext.setAttribute("minBlock", minBlock);
                        pageContext.setAttribute("maxBlock", maxBlock);
                        
                         //검색 데이터 연동
                        String query = "";
                        
                        String userid = (String)request.getAttribute("userid");
                        String useremail = (String)request.getAttribute("useremail");
                        
                        if(userid != null){
                           query += "&userid="+userid;
                        }
                        
                        if(useremail != null){
                           query += "&useremail="+useremail;
                        }
                        
                        pageContext.setAttribute("query", query);
                     %>
                     <c:choose>
                        <c:when test="${(minBlock-1) < 1 }">
                           <span><i class="fas fa-angle-double-left"></i></span>   
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/manager/manager3/manager-member?usernum=${minBlock-1}${query}">
                              <span><i class="fas fa-angle-double-left"></i></span>
                           </a>
                        </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                        <c:when test="${usernum == 1 }">
                           <span><i class="fas fa-chevron-left"></i></span>
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/manager/manager3/manager-member?usernum=${usernum-1}${query}">
                              <span><i class="fas fa-chevron-left"></i></span>
                           </a>
                        </c:otherwise>
                     </c:choose>
                     <c:forEach begin="${minBlock}" end="${(total<maxBlock)?total:maxBlock}" step="1" var="i">
                        <c:choose>
                           <c:when test="${usernum == i}">
                              <span>${i}</span>
                           </c:when>
                           <c:otherwise>
                              <a href="${pageContext.request.contextPath}/manager/manager3/manager-member?usernum=${i}${query}">${i}</a>
                           </c:otherwise>
                        </c:choose>
                  
                     </c:forEach>
                     <c:choose>
                        <c:when test="${usernum == total }">
                           <span><i class="fas fa-chevron-right"></i></span>
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/manager/manager3/manager-member?usernum=${num+1}${query}">
                              <span><i class="fas fa-chevron-right"></i></span>
                           </a>   
                        </c:otherwise>
                     </c:choose>
                     &nbsp;&nbsp;
                     <c:choose>
                        <c:when test="${maxBlock > total }">
                           <span> <i class="fas fa-angle-double-right"></i></span>   
                        </c:when>
                        <c:otherwise>
                           <a href="${pageContext.request.contextPath}/manager/manager3/manager-member?usernum=${maxBlock+1}${query}">
                              <span> <i class="fas fa-angle-double-right"></i></span>
                           </a>
                        </c:otherwise>
                     </c:choose>
                 </div>
                 
                 <input type="button" value="회원차단" id="block" />
                 
                 <div class="com-input">
			              <c:choose>
			               
			               <c:when test="${userid!=null}">
			                  <select name="category" id="category">
			                     <option value="userid" selected>회원아이디</option>
			                     <option value="useremail">회원이메일</option>
			                     
			                  </select>
			                  <input type="text" id="search-text" name="text" value="${userid}" />
			               </c:when>
			               <c:when test="${useremail!=null}">
			                  <select name="category" id="category">
			                     <option value="userid" selected>회원아이디</option>
			                     <option value="useremail">회원이메일</option>
			                     
			                  </select>
			                  <input type="text" id="search-text" name="text" value="${useremail}" />
			               </c:when>
			               <c:otherwise>
			                  <select name="category" id="category">
			                    <option value="userid" selected>회원아이디</option>
			                     <option value="useremail">회원이메일</option>
			                     
			                  </select>
			                  <input type="text" id="search-text" name="text" />
			               </c:otherwise>
			            </c:choose>
            			<button id="search">검색</button>
                      
                        </div>
		 	</div>
		 	
		 	
   		</main>
   		</div>
   		<jsp:include page="../../includes/footer.jsp"></jsp:include>
	</div>
	<script type="text/javascript">
		$(function(){
			$("#block").click(function(){
				let chk_val = [];
				$("input:checkbox[name=bloCheck]:checked").each(function()){
					chk_val.push
				}
				
				
			})
			
			
			$("#search").click(function() {
		         let category = $("#category").val();
		         let text = $("#search-text").val();
		         
		         if(category == "userid") {
		            location.href = "${pageContext.request.contextPath}/manager/manager3/manager-member?userid="+text;
		         }else if(category == "useremail") {
		            location.href = "${pageContext.request.contextPath}/manager/manager3/manager-member?useremail="+text;
		         }
		      });
		});
	</script>
</body>
</html>