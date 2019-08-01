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
<div class="orderSuccess_wrapper uk-card uk-card-default uk-card-body uk-width-1-2@m">
	<p class="orderMsg">주문이 완료되었습니다.</p>
	
	<c:set var="root" value="<%=request.getContextPath() %>" />
	<a href="${root}/main/main.do" class="orderSuccess_Atag">메인페이지로→</a>
</div>
</body>
</html>