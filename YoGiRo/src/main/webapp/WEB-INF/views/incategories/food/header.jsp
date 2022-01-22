<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
<header>
    <div class="header-top">
        <div class="logo-box">
            <h1 class="logo">YoGiRo</h1>
        </div>
        <div class="login-box">
            <a href="${pageContext.request.contextPath}/qna/qna-main" class="login-box-a">문의하기</a>
            <a href="${pageContext.request.contextPath}/login/login-main" class="login-box-a">로그인</a>
            <a href="${pageContext.request.contextPath}/signup/signup-main" class="login-box-a">회원가입</a>
            <i class="fas fa-globe"></i>
        </div>
    </div>
    <nav class="header-nav">
        <a href="${pageContext.request.contextPath}/incategories/food/food-main" class="header-nav-a">음식점</a>
        <a href="${pageContext.request.contextPath}/incategories/festa/festa-main" class="header-nav-a">축제</a>
        <a href="${pageContext.request.contextPath}/incategories/course/course-main" class="header-nav-a">코스</a>
        <a href="${pageContext.request.contextPath}/incategories/community/community-main" class="header-nav-a">커뮤니티</a>
    </nav>
</header>