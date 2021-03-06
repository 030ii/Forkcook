<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<c:set var="root" value="<%=request.getContextPath() %>" />
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="${root}/js/uikit.min.js"></script>
		<script src="${root}/js/uikit-icons.min.js"></script>
		<link rel="stylesheet" href="${root}/css/uikit.min.css" />
		<link rel="stylesheet" href="${root}/css/forkcook.css" />
		<title>포크쿡 관리 페이지입니다</title>
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	</head>
	<body>
		<c:choose> 
		    <c:when test="${not empty adminLoginInfo}">
		        <div id="header-admin" class="layout">
					<tiles:insertAttribute name="header-admin"/>
				</div>
				<div id="main-admin" class="layout">
					<tiles:insertAttribute name="admin"/>
				</div>
		    </c:when>
		    <c:otherwise>
		    

<div class="loginAdmin_wrap uk-flex uk-flex-wrap uk-flex-wrap-around uk-background-muted uk-height-medium">
<!-- <div class="loginAdmin_wrap"> -->
	<div class="adminLogin-text uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
	      <p class="adminLogintext">포크쿡 관리자/가맹점용 페이지 입니다<br>
	      				로그인 해주세요<br></p>
        <form action="adminlogin.do" method="get" class="adminloginForm">
		  <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: user"></span>
	            <input class="uk-input adminlogin-input" type="text" name="id" placeholder="ID" required="required">
	        </div>
	    </div>
	
	    <div class="uk-margin">
	        <div class="uk-inline">
	            <span class="uk-form-icon" uk-icon="icon: lock"></span>
	            <input class="uk-input adminlogin-input" type="password" name="pass" placeholder="password" required="required">
	        </div>
	    </div>
   		<button type="submit" class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom login_btn" id="adminLogin_btn">로그인</button>
   
			<c:if test="${not empty msg}">
				<span class="uk-label uk-label-danger">로그인에 실패했습니다. 다시 로그인해주세요.</span>
			</c:if>
		</form>
</div>    
</div>
		    </c:otherwise>                  
		</c:choose>
	</body>
</html>
