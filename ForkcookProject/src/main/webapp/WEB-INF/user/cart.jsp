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
<!-- 로그인 안했을 시에 장바구니 누르면 '먼저로그인하세요' 창 뜨게 해야함  -->
<div class="cartlist">
	<table style="border: 1px;">
		<caption>장바구니 목록</caption>
		<tr>
			<th>메뉴</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<td>{dto.name}</td>
			<td>수량</td>
			<td>{dto.price}</td>
		</tr>
		</c:forEach>	
	</table>
	
	
</div>

	<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/main/order/orderform.do'">결제하러가기</button>
</body>
</html>