<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="<%=request.getContextPath() %>" />

<div class="uk-section-primary uk-preserve-color">
	<div uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">    
        <nav class="uk-navbar-container fk-navbar" uk-navbar style="position: relative; z-index: 980;">
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
		        	<c:choose> 
		        		<c:when test="${not empty loginInfo}">
		        			num : ${loginInfo.num }<br>
		        			name : ${loginInfo.name }<br>
		        			usertype : ${loginInfo.usertype}<br>
					        <li><a href="${root}/main/user/logout.do">로그아웃</a></li>
							<li><a href="${root}/main/user/mypage.do?num=${loginInfo.num}">마이페이지</a></li>
							<li><a href="${root}/main/cart/list.do?num=${loginInfo.num}">장바구니</a></li>
							
							
					    </c:when>
					    <c:otherwise>
					    	<li><a href="${root}/main/user/login.do">로그인</a></li>
							<li><a href="${root}/main/user/membership.do">회원가입</a></li>
							<li><a href="${root}/main/user/login.do" onclick="alert('먼저 로그인해주세요')">장바구니</a></li>
					    </c:otherwise>
				    </c:choose>	
		        </ul>
		    </div>
		</nav>
    </div>
</div>