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
<!-- <a href="${root}/main.do">
		<img src="${root}/image/08.png" width="50" align="center">Spring5+Tiles3+Mybatis3+Oracle
	</a>-->
	<div>
		<a href="${root}/main/main.do">forkcook 로고</a>
	</div>
	<div class="menu">
		<ul>
			<li><a href="${root}/main/brand/info.do">브랜드 소개</a></li>
			<li><a href="${root}/main/menu/list.do">메뉴</a></li>
			<li><a href="${root}/main/store/list.do">매장</a></li>
			<li><a href="${root}/main/notice/list.do">공지</a></li>
			<li><a href="${root}/main/qna/list.do">고객센터</a></li>
		</ul>
	</div>
	<div class="btnContainer">
		<ul class="loginNo">
			<li><a href="${root}/main/user/login.do">로그인</a></li>
			<li><a href="${root}/main/user/membership.do">회원가입</a></li>
			<li><a href="${root}/main/cart/list.do">장바구니</a></li>
		</ul>
		<ul class="loginYes">
			<li><a href="${root}/main/user/logout.do">로그아웃</a></li>
			<li><a href="${root}/main/user/mypage.do">마이페이지</a></li>
			<li><a href="${root}/main/cart/list.do">장바구니</a></li>
			<li><a href="${root}/admin/main.do">관리자 전용 페이지로 가기</a></li>
		</ul>
	</div>
</body>
</html>