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
	관리자 메뉴 관리 페이지
	<button type="button" onclick="location.href='writeform.do'">새로운 메뉴 추가하기</button>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>메뉴 이름</th>
			<th>카테고리</th>
			<th>인분</th>
			<th>가격</th>
			<th>사진</th>
			<th>평점</th>
			<th>요약</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.name}</td>
				<td>${dto.category}</td>
				<td>${dto.persons}</td>
				<td>${dto.price}</td>
				<td>${dto.image}</td>
				<td>${dto.rate}</td>
				<td>${dto.shortmsg}</td>
				<td>
					<button type="button" onclick="location.href='updateform.do?num=${dto.num}'">수정</button>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>