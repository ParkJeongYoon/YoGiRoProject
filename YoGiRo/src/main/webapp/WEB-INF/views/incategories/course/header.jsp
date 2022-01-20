<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<header>
    <div class="header-top">
        <div class="logo">
            <h1>YoGiRo</h1>
        </div>
        <div class="login-box">
            <a href="${pageContext.request.contextPath}/qna/qna-main">문의하기</a>
            <a href="${pageContext.request.contextPath}/login/login-main">로그인</a>
            <a href="${pageContext.request.contextPath}/signup/signup-main">회원가입</a>
            <i>!콘!</i>
        </div>
    </div>
    <nav class="header-nav">
        <a href="${pageContext.request.contextPath}/incategories/food/food-main">음식점</a>
        <a href="${pageContext.request.contextPath}/incategories/festa/festa-main">축제</a>
        <a href="${pageContext.request.contextPath}/incategories/course/course-main">코스</a>
        <a href="${pageContext.request.contextPath}/incategories/community/community-main">커뮤니티</a>
    </nav>
</header>