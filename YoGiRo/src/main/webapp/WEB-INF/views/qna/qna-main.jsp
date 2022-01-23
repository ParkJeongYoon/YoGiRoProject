<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html class="vh">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-main.css">
</head>
<body class="body vh">
    <div class="container vh">
		<jsp:include page="header.jsp"></jsp:include>



        <main class="qna-main">
        
			<section>
			
				<h1>문의하기</h1>
				
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
						<%-- <c:forEach var="item" items="${list}">
							<tr>
								<td>${item.num}</td>
								<td><a href="${pageContext.request.contextPath}/bbs/detail?num=${item.num}">${item.title}</a></td>
								<td>${item.ownername}</td>
								<td>${item.createdate}</td>
							</tr>
						</c:forEach> --%>
					</tbody>
					<tfoot class="qna-list-bottom">
						<div class="qna-list-bottom-inner-left">
							<button type="submit">글쓰기 <i class="fas fa-pen"></i></button>
						</div>
						<div class="qna-list-bottom-inner-right">
							<!-- <form:form>
								<form:select path=""></form:select>&#x20;
								<form:select path=""></form:select>&#x20;&#x20;
								<form:input path=""/>&#x20;&#x20;
								<form:button></form:button>
							</form:form> -->
						</div>
					</tfoot>
				</table>
				
			</section>
			
        </main>



        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</body>
</html>