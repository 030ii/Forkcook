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
장바구니목록
<!-- 로그인 안했을 시에 장바구니 누르면 '먼저로그인하세요' 창 뜨게 해야함  -->
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/order/orderform.do'">주문하기</button>
</body>
</html>