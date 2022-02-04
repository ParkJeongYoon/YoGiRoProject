<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>create title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-main.css">
</head>
<body class="body">
    <div class="container">
		<jsp:include page="../includes/header.jsp"></jsp:include>



        <main class="qna-main">
        
			<h1 class="qna-title">문의하기</h1>

			<section class="qna-section">
				<table class="qna-list">
					<thead class="qna-list-top">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>조회</th>
						</tr>
					</thead>
					<tbody class="qna-list-main">
						<c:forEach var="item" items="${qlist}">
							<tr>
								<td>${item.qnum}</td>
								<td>
									<c:forEach var="sp" begin="1" end="${item.depth}">&nbsp;&nbsp;</c:forEach>
									<c:if test="${item.depth > 0}">ㄴRe : </c:if>
									<!-- <a href="${pageContext.request.contextPath}/bbs/detail?qnum=${item.qnum}"> -->${item.qtitle}<!-- </a> -->
								</td>
								<td>${item.userid}</td>
								<td>${item.readcount}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
                <div class="pagination-box">
	                
					<%
					int qnum = (Integer)request.getAttribute("qnum");
					int count = (Integer)request.getAttribute("count");
					int total = count/10+((count%10==0)?0:1);
					int minblock = (((qnum-1)/10)*10)+1;
					int maxblock = (((qnum-1)/10)+1)*10;
					pageContext.setAttribute("total" , total);
					pageContext.setAttribute("minblock" , minblock);
					pageContext.setAttribute("maxblock" , maxblock);
					
					String query = "";
					String qtitle = (String)request.getAttribute("qtitle");
					String qcontent = (String)request.getAttribute("qcontent");
					
					if (qtitle != null) {
						query += "&title=" + qtitle;
					}
					if (qcontent != null) {
						query += "&qcontent=" + qcontent;
					}
					
					pageContext.setAttribute("query" , query);
					%>
					
					<c:choose>
						<c:when test="${(minblock-1) < 1}">
							<span>&laquo;&laquo;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna/qna-main?qnum=${minblock-1}${query}">&laquo;&laquo;</a>
						</c:otherwise>
					</c:choose>
					
					&nbsp;&nbsp;
					
					<!-- 1미만으로 안넘어가게 처리 -->
					<c:choose>
						<c:when test="${qnum == 1}">
							<span>&laquo;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna/qna-main?qnum=${qnum-1}${query}">&laquo;</a>
						</c:otherwise>
					</c:choose>
					
					<c:forEach begin="${minblock}" end="${(total<maxblock)?total:maxblock}" step="1" var="i">
						<!-- 현재페이지 클릭 기능 제거를 위한 choose -->
						<c:choose>
							<c:when test="${qnum == i}">
								<span>${i}</span>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/qna/qna-main?qnum=${i}${query}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<!-- 최대 초과로 안넘어가게 처리 -->
					<c:choose>
						<c:when test="${qnum == total}">
							<span>&raquo;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna/qna-main?qnum=${qnum+1}${query}">&raquo;</a>
						</c:otherwise>
					</c:choose>
					
					&nbsp;&nbsp;
					<!-- 블록건너뛰기 -->
					<!-- 조건 1. 현재 페이지보다 큰페이지 존재. -->
					<!-- 조건 2. 그 큰페이지가 속한 최대페이지 존재. -->
						<!-- 현재페이지가 속한 블록의 최대페이지가 최종페이지보다 크면 당연히 비활성화 --> <!-- 현재페이지가 기준이 아니다 !! 주의 -->
					<c:choose>
						<c:when test="${maxblock > total}">
							<span>&raquo;&raquo;</span>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/qna/qna-main?qnum=${maxblock+1}${query}">&raquo;&raquo;</a>
						</c:otherwise>
					</c:choose>
                	
                </div>
                
			</section>

            <aside class="qna-aside">
                <div class="qna-list-bottom-inner-left">
	                <%-- <c:if test="      ${sessionScope.account.id != null}      "> --%>
                    	<button type="submit" class="button-sty qna-create">글쓰기 <i class="fas fa-pen"></i></button>
					<%-- </c:if> --%>
                </div>
                <div class="qna-list-bottom-inner-right">
                    <div class="search-bar">
	                    <% if ((qtitle!=null)&&(qcontent!=null)) { %>
							<select name="category" id="category">
								<option value="qtitle">제목</option>
								<option value="qcontent">내용</option>
								<option value="both" selected>제목+내용</option>
							</select>
							<input type="text" id="text" name="text" placeholder="검색어를 입력해주세요" value="${qtitle}">
						<% }else if (qtitle != null) { %>
							<select name="category" id="category">
								<option value="qtitle" selected>제목</option>
								<option value="qcontent">내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="text" name="text" placeholder="검색어를 입력해주세요" value="${qtitle}">
						<% }else if (qcontent != null) { %>
							<select name="category" id="category">
								<option value="qtitle">제목</option>
								<option value="qcontent" selected>내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="text" name="text" placeholder="검색어를 입력해주세요" value="${qcontent}">
						<% }else { %>
							<select name="category" id="category">
								<option value="qtitle">제목</option>
								<option value="qcontent">내용</option>
								<option value="both">제목+내용</option>
							</select>
							<input type="text" id="text" name="text" placeholder="검색어를 입력해주세요">
						<% } %>
						<button class="qna-search button-sty">검색</button>
                    </div>
                </div>
            </aside>
			
        </main>



        <jsp:include page="../includes/footer.jsp"></jsp:include>
        
    </div>
    
    
    <script type="text/javascript">
    	document.querySelector(".qna-create").addEventListener("click" , function() {
    		location.href = "${pageContext.request.contextPath}/qna/qna-create";
    	});
    	
    	document.querySelector(".qna-search").addEventListener("click" , function() {
    		let category = document.querySelector("#category").value;
    		let text = document.querySelector("#text").value;
    		
    		if (category == "qtitle") {
				location.href = "${pageContext.request.contextPath}/qna/qna-main?qtitle=" + text;
			}else if (category == "qcontent") {
				location.href = "${pageContext.request.contextPath}/qna/qna-main?qcontent=" + text;
			}else if (category == "both") {
				location.href = "${pageContext.request.contextPath}/qna/qna-main?qtitle=" + text + "&qcontent=" + text;
			}
    	});
	</script>
</body>
</html>