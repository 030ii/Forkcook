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
<script type="text/javascript">
	if(window.location.pathname == 'http://localhost:9000/ForkcookProject/main/user/login.do'){
		document.write('<style>.footer_wrapper{display:none !important;}</style>');
	};
</script>
<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="footer_wrapper">
	<img class="logo" src="${root}/image/logo.png"><br>
	(주)FOODORDER SYSTEM FORKCOOK<br>
	본사 : 서울특별시 강남구 강남대로 94길 20. 3,4층 | TEL : 02-642-6462 | 대표: 채 보 영 | 사업자등록번호:312-88-42280 | 통신판매업신고증 : 제 2019-서울강남-01024호<br> 
	Copyright ⓒ FORKCOOK Corp. All Rights Reserved.
</div>
</body>
</html>