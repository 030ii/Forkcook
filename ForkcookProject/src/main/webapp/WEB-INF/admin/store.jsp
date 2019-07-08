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
	관리자 매장 관리 페이지
	<div>총 ${totalCount}개의 매장이 있습니다</div>
	<button type="button" onclick="location.href='writeform.do'">새로운 매장 추가하기</button>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>매장명</th>
			<th>지역</th>
			<th width=300>주소</th>
			<th>전화번호</th>
			<th>메인 사진</th>
			<th>지도 사진</th>
			<th width=200>운영 시간</th>
			<th>요약</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.name}</td>
				<td>${dto.area}</td>
				<td>${dto.addr}</td>
				<td>${dto.phone}</td>
				<td>${dto.mainimage}</td>
				<td>${dto.mapimage}</td>
				<td>${dto.opertime}</td>
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