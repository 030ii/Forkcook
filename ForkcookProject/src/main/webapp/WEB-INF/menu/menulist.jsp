<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>" />

<!-- TODO : 카테고리별 분류 -->
<!-- TODO : CSS는 추후에 UI kit에 맞게 다시 재배열 -->
<!-- TODO : 메뉴에 마우스 오버시 장바구니/상세보기 나오게 하기 -->

	<c:forEach var="mdto" items="${list}">
		<div class="card" style="width: 20rem;">
			<img class="card-img-top" src="../../image/${mdto.image}" alt="Card image cap">
			<div class="card-body">
				<h4 class="card-title">${mdto.name}</h4>
				<p class="card-text">${mdto.shortmsg}</p>
				<a href="${root}/main/menu/detail.do?num=${mdto.num}" class="btn btn-primary">자세히 보기&rarr;</a>
			</div>
		</div>
			<button type="button" class="intoCart-btn"
				onclick="location.href='${root}/main/cart/insert.do?unum=1&mnum=${mdto.num}&mcount=1&mtotalprice=${mdto.price }'">장바구니담기</button>
			<button type="button" class="goOrder-btn"
				onclick="location.href='${root}/main/cart/fkdfkdk.do?num=${mdto.num}'">바로주문하기</button>
		<br>
	</c:forEach>
	
	
<div id="count2">
    <span class="figure"></span>
</div>
<button type="button" id="like">Like</button>

</body>
</html>
