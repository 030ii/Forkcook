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
관리자 회원 관리 페이지
	<table border=1>
	  <caption><회원 테이블></caption>
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>가입날짜</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:if test="${dto.usertype==1}">
				<tr>
					<td>${status.count}</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.phone}</td>
					<td>${dto.gaipday}</td>
					<td>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
				</tr>
			</c:if>
		</c:forEach>
		</table>
		
	<table border=1>
	  <caption><비회원 테이블></caption>
		<tr>
			<th>No.</th>
			<th>이름</th>
			<th>핸드폰</th>
			<th>가입날짜</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:if test="${dto.usertype==2}">
				<tr>
					<td>${status.count}</td>
					<td>${dto.name}</td>
					<td>${dto.phone}</td>
					<td>${dto.gaipday}</td>
					<td>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
				</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>