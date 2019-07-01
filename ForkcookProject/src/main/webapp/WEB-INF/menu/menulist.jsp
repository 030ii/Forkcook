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
	데이터 갯수 : ${totalCount}
	<c:set var="root" value="<%=request.getContextPath() %>" />
	<button type="button" onclick="location.href='${root}/menu/detail.do'">메뉴상세보기 페이지 이동</button>

<!-- TODO : CSS는 추후에 UI kit에 맞게 다시 재배열 -->
<!-- TODO : 카테고리별 분류 -->
	<c:forEach var="dto" items="${list}">
		<div class="card" style="width: 20rem;">
			<img class="card-img-top" src="../image/${dto.image}" alt="Card image cap">
			<div class="card-body">
				<h4 class="card-title">${dto.name}</h4>
				<p class="card-text">${dto.shortmsg}</p>
				<a href="${root}/menu/detail.do?num=${dto.num}" class="btn btn-primary">자세히 보기&rarr;</a>
			</div>
		</div>
		<br>
	</c:forEach>

</body>
</html>
