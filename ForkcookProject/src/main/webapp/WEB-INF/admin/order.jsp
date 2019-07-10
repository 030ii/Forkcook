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
	관지라 주문 페이지<br>
	총 ${totalCount}개의 주문이 있습니다.<br>
	
	<table border=1>
		<tr>
			<th>No.</th>
			<th>num</th>
			<th>주문번호</th>
			<th>주문자 num</th>
			<th>매장 num</th>
			<th>메뉴 num</th>
			<th>메뉴 수량</th>
			<th>메뉴별 총 금액</th>
			<th>주문 유형</th>
			<th>주문 날짜</th>
			<th>주문 상태</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.num}</td>
				<td>${dto.ordernum}</td>
				<td>${dto.unum}</td>
				<td>${dto.snum}</td>
				<td>${dto.mnum}</td>
				<td>${dto.mcount}</td>
				<td>${dto.mtotalprice}</td>
				<td>
					<c:choose>
					    <c:when test="${dto.ordertype eq 'A'}">현장 주문</c:when>
					    <c:when test="${dto.ordertype eq 'B'}">예약 주문</c:when>
					    <c:when test="${dto.ordertype eq 'C'}">(준비중)배달 주문</c:when>
					    <c:otherwise>잘못된 주문</c:otherwise>
					</c:choose>
				</td>
				<td>${dto.orderdate}</td>
				<td>
					<c:choose>
					    <c:when test="${dto.orderstate eq 1}">접수 완료</c:when>
					    <c:when test="${dto.orderstate eq 2}">조리중</c:when>
					    <c:when test="${dto.orderstate eq 3}">조리 완료</c:when>
					    <c:when test="${dto.orderstate eq 4}">전달 완료</c:when>
					    <c:when test="${dto.orderstate eq 5}">(준비중)배달 시작</c:when>
					    <c:when test="${dto.orderstate eq 6}">(준비중)배달 완료</c:when>
					    <c:when test="${dto.orderstate eq 7}">사용자 취소</c:when>
					    <c:when test="${dto.orderstate eq 8}">가맹점 취소</c:when>
					    <c:otherwise>잘못된 상태</c:otherwise>
					</c:choose>
				</td>
				<td>
					<button type="button" onclick="location.href='updateform.do?ordernum=${dto.ordernum}'">수정</button>
					<button type="button" onclick="location.href='delete.do?ordernum=${dto.ordernum}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>