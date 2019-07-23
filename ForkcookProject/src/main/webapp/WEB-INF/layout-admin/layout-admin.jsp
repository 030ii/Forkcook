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
		        포크쿡 관리자/가맹점용 페이지 입니다<br>
		        로그인 해주세요<br>	        
		        <form action="adminlogin.do" method="get">
					아이디 : <input type="text" name="id" required="required"><br>
					비밀번호 : <input type="password" name="pass" required="required"><br>
					<input type="submit" value="로그인하기">
					<c:if test="${not empty msg}">
						<span class="uk-label uk-label-danger">로그인에 실패했습니다. 다시 로그인해주세요.</span>
					</c:if>
				</form>
		    </c:otherwise>                  
		</c:choose>
	</body>
</html>
