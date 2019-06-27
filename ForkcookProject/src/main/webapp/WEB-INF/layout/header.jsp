<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>" />
<body>
<!-- <a href="${root}/main.do">
		<img src="${root}/image/08.png" width="50" align="center">Spring5+Tiles3+Mybatis3+Oracle
	</a>-->
	<div>
		<a href="${root}/main.do">forkcook 로고</a>
	</div>
	<div class="menu">
		<ul>
			<li><a href="${root}/brand/info.do">브랜드 소개</a></li>
			<li><a href="${root}/menu/list.do">메뉴</a></li>
			<li><a href="${root}/store/list.do">매장</a></li>
			<li><a href="${root}/board/list.do">공지</a></li>
			<li><a href="${root}/qna/list.do">고객센터</a></li>
		</ul>
	</div>
	<div class="btnContainer">
		<ul class="loginNo">
			<li><a href="${root}/user/login.do">로그인</a></li>
			<li><a href="${root}/user/signup.do">회원가입</a></li>
			<li><a href="${root}/cart/list.do">장바구니</a></li>
		</ul>
		<ul class="loginYes">
			<li><a href="${root}/user/logout.do">로그아웃</a></li>
			<li><a href="${root}/user/mypage.do">마이페이지</a></li>
			<li><a href="${root}/cart/list.do">장바구니</a></li>
		</ul>
	</div>
</body>
</html>