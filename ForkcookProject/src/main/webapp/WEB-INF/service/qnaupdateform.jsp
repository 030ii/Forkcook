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
	문의 수정 페이지
	<br> 아래 폼에 값들이 채워있어야 합니다
	<br> 작성자 : ${dto.writer}
	<br> 제목 :
	<input type="text" value="${dto.subject}">
	<br> 가맹점 :
	<select>
		<option>강남점</option>
		<option>분당점</option>
	</select>
	<br> 내용 :
	<textarea name="content" class="form-control">${dto.content}</textarea>
	<br> 사진 업로드 :


	<c:set var="root" value="<%=request.getContextPath() %>" />
	<input type="hidden" name="num" value="${dto.num}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<button type="button" onclick="history.back()">취소하기(목록으로 가기)</button>
	<button type="submit" onclick="location.href='${root}/qna/update.do'">수정하기(수정한문의글 페이지로 감)</button>
</form>
</body>
</html>