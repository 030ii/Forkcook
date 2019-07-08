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
	관리자 문의 관리 페이지
	<div>총 ${totalCount}개의 문의글이 있습니다</div>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>매장</th>
			<th>날짜</th>
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a></td>
				<td>${dto.unum}</td>
				<td><fmt:formatDate value="${dto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
				<td>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>