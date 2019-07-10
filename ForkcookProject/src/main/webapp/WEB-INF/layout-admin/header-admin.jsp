<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>" />
	<div>
		<a href="${root}/admin/main.do">관리자 메인으로</a>
	</div>
	<div class="menu">
		<ul>
			<li>----관리자용 페이지----</li>
			<li><a href="${root}/admin/user/list.do">회원 관리</a></li>
			<li><a href="${root}/admin/storeuser/list.do">가맹점 회원 관리</a></li>
			<li><a href="${root}/admin/menu/list.do">메뉴 관리</a></li>
			<li><a href="${root}/admin/review/list.do">메뉴리뷰 관리</a></li>
			<li><a href="${root}/admin/store/list.do">매장 관리</a></li>
			<li><a href="${root}/admin/order/list.do">주문 관리</a></li>
			<li><a href="${root}/admin/notice/list.do">공지 관리</a></li>
			<li><a href="${root}/admin/qna/list.do">문의 관리</a></li>
		</ul>
	</div>
	<div class="menu">
		<ul>
			<li>----가맹점용 페이지----</li>
			<li><a href="${root}/admin/now/list.do">현장주문 관리</a></li>
			<li><a href="${root}/admin/reserve/list.do">예약주문 관리</a></li>
			<li><a href="${root}/admin/finish/list.do">완료주문 관리</a></li>
			<li><a href="${root}/admin/partnerqna/list.do">매장문의 관리</a></li>
		</ul>
	</div>
	<div class="btnContainer">
		<ul>
			<li><a href="${root}/admin/storeuser/logout.do">로그아웃</a></li>
			<li><a href="${root}/main/main.do">회원 전용 페이지로 가기</a></li>
		</ul>
	</div>
</body>
</html>
