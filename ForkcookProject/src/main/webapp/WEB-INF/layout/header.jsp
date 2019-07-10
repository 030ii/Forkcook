<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="<%=request.getContextPath() %>" />

<div class="uk-section-primary uk-preserve-color">
    <div uk-sticky="animation: uk-animation-slide-top; sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; cls-inactive: uk-navbar-transparent uk-light; top: 200">
        <nav class="uk-navbar-container fk-navbar" uk-navbar>
		    <div class="uk-navbar-left">
		        <ul class="uk-navbar-nav">
		        	<li><a href="${root}/main/main.do"><img class="logo" alt="forkcook" src="${root}/image/logo.png"></a></li>
		            <li><a href="${root}/main/brand/info.do">브랜드 소개</a></li>
					<li><a href="${root}/main/menu/list.do">메뉴</a></li>
					<li><a href="${root}/main/store/list.do">매장</a></li>
					<li><a href="${root}/main/notice/list.do">공지</a></li>
					<li><a href="${root}/main/qna/list.do">고객센터</a></li>
		        </ul>
		    </div>
		    <div class="uk-navbar-right">
		        <ul class="uk-navbar-nav">
		        	<c:if test="${udto.num == null}"><!-- 로그인 세션에 의한 유저 정보가 없으면 -->
			        	<li><a href="${root}/main/user/login.do">로그인</a></li>
						<li><a href="${root}/main/user/membership.do">회원가입</a></li>
						<li><a href="${root}/main/cart/list.do">장바구니</a></li>
					</c:if>
	        		<c:if test="${udto.num != null}"><!-- 로그인 세션에 의한 유저 정보가 있으면 -->
						<li><a href="${root}/main/user/logout.do">로그아웃</a></li>
						<li><a href="${root}/main/user/mypage.do?num=${udto.num}">마이페이지</a></li>
						<li><a href="${root}/main/cart/list.do?num=${udto.num}">장바구니</a></li>
		            </c:if>
		        </ul>
		    </div>
		</nav>
    </div>
</div>