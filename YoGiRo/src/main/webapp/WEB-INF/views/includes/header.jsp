<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/includes/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/icons/fontawesome-free-5.15.4-web/css/all.css">
<header>
    <div class="header-top">
        <div class="logo-box">
            <a style="display: inline;" href="${pageContext.request.contextPath}/"><h1 class="logo">YoGiRo</h1></a>
        </div>
        <div class="login-box">
        	<a href="" class="login-box-a">?마이?페?이지?<i class="far fa-address-card"></i></a>
        	<a href="${pageContext.request.contextPath}/manager/manager1/manager-chart" class="login-box-a">사이트관리<i class="fas fa-chalkboard-teacher"></i></a>
            <a href="${pageContext.request.contextPath}/qna/qna-main" class="login-box-a">문의하기<i class="far fa-question-circle"></i></a>
            <a href="${pageContext.request.contextPath}/login/login-main" class="login-box-a">로그인<i class="fas fa-sign-in-alt"></i></a>
            <a href="${pageContext.request.contextPath}/signup/signup-main" class="login-box-a">회원가입<i class="fas fa-user-plus"></i></a>
        </div>
    </div>
    <nav class="header-nav">
        <a href="${pageContext.request.contextPath}/move-to-food-main" class="header-nav-a">음식점</a>
        <a href="${pageContext.request.contextPath}/incategories/festa/festa-main" class="header-nav-a">축제</a>
        <a href="${pageContext.request.contextPath}/move-to-course-main" class="header-nav-a">코스</a>
        <a href="${pageContext.request.contextPath}/incategories/community/community-main" class="header-nav-a">커뮤니티</a>
    </nav>
</header>