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
    <style type="text/css">
    #block {
    	position:absolute;
    	left: 15%;
    	bottom: 3%;
    	background-color: #B2DFDB;
    	border: none;
    	padding: 10px 15px;
    	cursor: pointer;
    }
    </style>
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
		   		<h1>회원 관리</h1>
		   		<hr />
		   		<table>
		   			
		   				<thead>
                               <tr>      
                               	  <th>차단여부</th>                                                              
                                  <th>회원아이디</th>                                  
                                  <th>회원이메일</th>
                                  
                               </tr>
                        </thead>
                            <tbody> 
                            <c:forEach var="user" items="${list}" >                         	
                            	<tr>
                            	   <td><label><input type="checkbox" name="bloCheck" value="${user.userid}"></label></td>
	                               <td>${user.userid}</td>	                               
	                               <td>${user.useremail}</td>
	                               
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
                 
                 <input type="button" value="회원차단" id="block" onclick="blockbtn()" />
                 
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
		
		/*function blockbtn(){
			var req = new XMLHttpRequest();
			req.open("GET", "${pageContext.request.contextPath}/manager/manager3/manager-mem");
			req.send();
			location.href = "${pageContext.request.contextPath}/manager/manager3/manager-mem";
		}*/
		
		function blockbtn(){
		  	  
		  	  const url = "manager-mem";		// controller로 보내고자 하는 url
		  	  const valueArr = new Array();
		  	  const list = $("input[name='bloCheck']");
		  	  
		  	  console.log(list);
		  	  
		  	  for (var i = 0; i < list.length; i++) {
					if (list[i].checked) { // 선택되어있으면 배열에 값을 저장
						valueArr.push(list[i].value);
					}
				}
		  	  
		  	  console.log(valueArr);
		  	  
		  	  
		  	  if(valueArr.length == 0){
		  		  alert("삭제할 항목을 선택해주세요");
		  		  
		  	  }
		  	  
		  	  const chk = confirm('정말 삭제하시겠습니까?');
		  	  
		  	  if(chk){      
		  		  
		  		  $.ajax({
		  			  type : 'POST',  
		  			  url : url,		// 전송 URL
		  			  dataType : 'json',
		  			  contentType:'application/json',
		  			  data : JSON.stringify({ valueArr }), 	// 보내고자 하는 data 변수 설정		  
		  			  success : function(result){
		  				  if(result = 1) {
		  					  alert("삭제 성공");
		  					  location.replace("${pageContext.request.contextPath}/manager/manager3/manager-member"); // list로 페이지 새로고침
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