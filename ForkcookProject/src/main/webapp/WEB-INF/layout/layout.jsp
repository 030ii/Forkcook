<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<c:set var="root" value="<%=request.getContextPath() %>" />

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="${root}/js/uikit.min.js"></script>
		<script src="${root}/js/uikit-icons.min.js"></script>
		<script src="${root}/js/d3.min.js"></script>
		<link rel="stylesheet" href="${root}/css/uikit.min.css" />
		<link rel="stylesheet" href="${root}/css/forkcook.css" />
		<title>포크쿡에 오신 것을 환영합니다</title>
	</head>
	<body>

		<div id="header" class="layout">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="main" class="layout">
			<tiles:insertAttribute name="main" />
			
			
			<div id="footer" class="layout">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
		
	</body>
</html>
