<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body>
    <div class="container">
        
		<jsp:include page="header.jsp"></jsp:include>



        <main>
            <section class="section1">
                <article class="article-l">
                    <div class="rok-thumbnail">
                        <img src="${pageContext.request.contextPath}/resources/img/KakaoTalk_20220117_070411036.jpg" alt="카잔">
                    </div>
                </article>
                <article class="article-r">
					<%@ include file="ROK.html" %>
                </article>
            </section>
        </main>



        <footer>
            <div class="api-list"></div>
        </footer>
    </div>
</body>
</html>