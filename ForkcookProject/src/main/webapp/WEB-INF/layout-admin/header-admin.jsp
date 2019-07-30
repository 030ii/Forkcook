<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<c:set var="root" value="<%=request.getContextPath() %>" />

<!-- 상단바 -->
<div class="uk-section-primary uk-preserve-color">
	<div uk-sticky="sel-target: .uk-navbar-container; cls-active: uk-navbar-sticky; bottom: #transparent-sticky-navbar">    
        <nav class="uk-navbar-container fk-navbar" uk-navbar style="position: relative; z-index: 980;">
		    <div class="uk-navbar-left">
		        <ul class="uk-navbar-nav fk-nav">
		        	<li><a href="${root}/admin/main.do"><img class="logo" alt="forkcook" src="${root}/image/logo.png"></a></li>
	            	<c:choose> 
					    <c:when test="${adminLoginInfo.usertype == 1}">
					        <li><a href="${root}/admin/main.do">관리자로 로그인하셨습니다.</a></li>
					    </c:when>
					    <c:otherwise>
					    	<li><a href="${root}/admin/main.do">가맹점주(${adminLoginInfo.sname})로 로그인하셨습니다.</a></li>
					    </c:otherwise>
				    </c:choose>	
		        </ul>
		    </div>
		    <div class="uk-navbar-right">
		        <ul class="uk-navbar-nav">
					<li><a href="${root}/main/main.do"><span uk-icon="icon: home"></span>&nbsp;포크쿡 홈페이지</a></li>
	        		<li><a href="${root}/admin/storeuser/logout.do"><span uk-icon="icon: sign-out"></span>&nbsp;로그아웃</a></li>
		        </ul>
		    </div>
		</nav>
    </div>
</div>

<!-- 왼쪽 사이드 메뉴 -->
<div class="fk-left-slidebar">
	<ul>
		<c:choose> 
		    <c:when test="${adminLoginInfo.usertype == 1}">
		        <!----관리자용 메뉴---->		
				<li><a href="${root}/admin/user/list.do"><span uk-icon="icon: user"></span> 회원 관리</a></li>
				<li><a href="${root}/admin/storeuser/list.do"><span uk-icon="icon: users"></span> 가맹점 회원 관리</a></li>
				<li><a href="${root}/admin/menu/list.do"><span uk-icon="icon: thumbnails"></span> 메뉴 관리</a></li>
				<li><a href="${root}/admin/review/list.do"><span uk-icon="icon: commenting"></span> 메뉴리뷰 관리</a></li>
				<li><a href="${root}/admin/store/list.do"><span uk-icon="icon: location"></span> 매장 관리</a></li>
				<li><a href="${root}/admin/order/list.do"><span uk-icon="icon: cart"></span> 주문 관리</a></li>
				<li><a href="${root}/admin/notice/list.do"><span uk-icon="icon: info"></span> 공지 관리</a></li>
				<li><a href="${root}/admin/qna/list.do"><span uk-icon="icon: question"></span> 문의 관리</a></li>
		    </c:when>
		    <c:otherwise>
				<!----가맹점용 페이지---->
				<li>
					<a href="${root}/admin/order/now.do">
						<span uk-icon="icon: file-text"></span> 현장주문 관리
						<span class="uk-badge">${nowTotalCount}</span>
					</a>
				</li>
				<li>
					<a href="${root}/admin/order/reserve.do">
						<span uk-icon="icon: future"></span> 예약주문 관리
						<span class="uk-badge">${reserveTotalCount}</span>
					</a>
				</li>
				<li>
					<a href="${root}/admin/order/finish.do">
						<span uk-icon="icon: check"></span> 완료주문 관리
						<span class="uk-badge">${finishTotalCount}</span>
					</a>
				</li>
				<li>
					<a href="${root}/admin/qna/partner.do">
						<span uk-icon="icon: question"></span> 매장문의 관리
					</a>
				</li>
		    </c:otherwise>
	    </c:choose>	
	</ul>
</div>