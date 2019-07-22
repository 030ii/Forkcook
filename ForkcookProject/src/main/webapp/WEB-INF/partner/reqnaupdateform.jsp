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
	<form action="pqupdate.do" method="post">
		문의 답변 수정 페이지<br>
		<div>
			제 목 : <input type="text" name="subject" value="${reqdto.subject}" class="form-control"><br><br><br>
			내 용 : <textarea name="content" class="form-control">${reqdto.content}</textarea><br>
		</div>
		<input type="hidden" name="qnum" value="${reqdto.qnum}">
		<input type="hidden" name="num" value="${reqdto.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<button type="button" onclick="history.back()">취소하기(뒤로 가기)</button>
		<button type="submit">수정하기(수정한문의글 페이지로 감)</button>
	</form>
</body>
</html>