<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<body class="body">
    <div class="container">
        
		<jsp:include page="includes/header.jsp"></jsp:include>



        <main>
            <section class="section1">
                <article class="article-l">
                    <div class="rok-thumbnail-box">
                        <img class="rok-thumbnail" src="${pageContext.request.contextPath}/img/KakaoTalk_20220117_070411036.jpg" alt="카잔">
                    </div>
                </article>
                <article class="article-r">
					<%@ include file="ROK.html" %>
                </article>
            </section>
        </main>



        <jsp:include page="includes/footer.jsp"></jsp:include>
    </div>
</body>
</html>