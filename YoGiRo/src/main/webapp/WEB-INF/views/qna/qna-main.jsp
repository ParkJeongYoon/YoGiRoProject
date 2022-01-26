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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/qnacss/qna-main.css">
</head>
<body class="body vh">
    <div class="container vh">
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
                        <tr>
                            <td>1</td>
                            <td><a href="">제목이 곧 내용1</a></td>
                            <td>제곧내1</td>
                            <td>?</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><a href="">제목이 곧 내용2</a></td>
                            <td>제곧내2</td>
                            <td>?</td>
                        </tr>
						<!-- <%-- <c:forEach var="item" items="${list}">
							<tr>
								<td>${item.num}</td>
								<td><a href="${pageContext.request.contextPath}/bbs/detail?num=${item.num}">${item.title}</a></td>
								<td>${item.ownername}</td>
								<td>${item.createdate}</td>
							</tr>
						</c:forEach> --%> -->
					</tbody>
				</table>
				
                <div class="pagination-box">
                    <a href="#">&laquo;</a>
                    <a href="#" class="active">1</a>
                    <a href="#">&raquo;</a>
                </div>
			</section>

            <aside class="qna-aside">
                <div class="qna-list-bottom-inner-left">
                    <button type="submit" class="button-sty qna-insert">글쓰기 <i class="fas fa-pen"></i></button>
                </div>
                <div class="qna-list-bottom-inner-right">
                    <form action="#">
                        <select name="" id="">
                            <option value="">제목</option>
                            <option value="">내용</option>
                            <option value="">제목+내용</option>
                        </select>&#x20;&#x20;
                        <input type="text" placeholder="검색어를 입력해주세요">&#x20;&#x20;
                        <button type="submit" class="button-sty">검색</button>
                    </form>
                    <!-- <%-- <form:form>
                        <form:select path=""></form:select>&#x20;
                        <form:select path=""></form:select>&#x20;&#x20;
                        <form:input path=""/>&#x20;&#x20;
                        <form:button></form:button>
                    </form:form> --%> -->
                </div>
            </aside>
			
        </main>



        <jsp:include page="../includes/footer.jsp"></jsp:include>
        
    </div>
</body>
</html>