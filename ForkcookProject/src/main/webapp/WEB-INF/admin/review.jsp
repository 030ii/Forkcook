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
관리자 메뉴리뷰 관리 페이지

<div>총 ${totalCount}개의 리뷰가 있습니다</div>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>num</th>
			<th>unum</th>
			<th>mnum</th>
			<th>내용</th>
			<th>평점</th>
			<th>작성일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.num}</td>
				<td>${dto.unum}</td>
				<td>${dto.mnum}</td>
				<td>${dto.content}</td>
				<td>${dto.rate}</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>