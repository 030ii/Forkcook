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
		<form action="update.do" method="post">
	문의 답변 수정 페이지
	<br>
	<div>
		
			<b>제 목 : </b><input type="text" name="subject" value="${dto.subject}" class="form-control"><br><br><br>
			<b>내 용 : </b><textarea name="content" class="form-control">${dto.content}</textarea><br>
		
	</div>


	<input type="hidden" name="num" value="${dto.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<button type="button" onclick="location.href='list.do'">취소하기(목록으로 가기)</button>
	<button type="submit" onclick="location.href='content.do?num=${dto.num}&pageNum=${pageNum}'">수정하기(수정한문의글 페이지로 감)</button>
</form>
</body>
</html>