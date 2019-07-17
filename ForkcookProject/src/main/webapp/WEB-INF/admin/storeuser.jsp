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
	관리자 가맹점 회원 관리 페이지
	<div>총 ${totalCount-1}명의 가맹점 회원이 있습니다</div>
	<button type="button" onclick="location.href='insertform.do'">새로운 가맹점 회원 등록하기</button>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>가맹점 지역</th>
			<th>가맹점명</th>
			<th>가입날짜</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:if test="${dto.usertype==2}">
				<tr>
					<td>${status.count-1}</td>
					<td>${dto.id}</td>
					<td>${dto.sarea}</td>
					<td>${dto.sname}</td>
					<td>${dto.gaipday}</td>
					<td>
						<button type="button" onclick="location.href='updateform.do?num=${dto.num}'">수정</button>
						<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>
