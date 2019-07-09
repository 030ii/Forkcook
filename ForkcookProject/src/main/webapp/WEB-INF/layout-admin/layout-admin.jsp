<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../css/uikit.min.css" />
		<script src="../js/uikit.min.js"></script>
		<script src="../js/uikit-icons.min.js"></script>
		<title>포크쿡 관리 페이지입니다</title>
		<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	</head>
	<body>
		<div id="header-admin" class="layout">
			<tiles:insertAttribute name="header-admin"/>
		</div>
		<div id="main-admin" class="layout">
			<tiles:insertAttribute name="admin"/>
		</div>
	</body>
</html>
