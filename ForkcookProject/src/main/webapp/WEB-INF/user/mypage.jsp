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
마이페이지
<!-- 나중에 탭 형식으로 /주문내역/리뷰내역/문의내역/내 정보/ 표시할것 -->
<c:forEach var="dto" items="${list}" varStatus="status">
	<table border=1>
		<tr>
			<th>id</th>
			<td>${dto.id}</td>
		</tr>
		<tr>
			<th>pass</th>
			<td>${dto.pass}</td>
		</tr>
		<tr>
			<th>name(nickname)</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>phone</th>
			<td>${dto.phone}</td>
		</tr>
	</table>
</c:forEach>
						<!-- 일단 num을 1로 해둠. 나중에 세션추가하면 dto.num으로 수정 -->
	<button type="button" onclick="location.href='passconfirm.do?num=${loginInfo.num}'">정보수정하기</button>
	<button type="button" onclick="location.href='myqna.do?num=${loginInfo.num}'">내 문의내역</button>
</body>
</html>