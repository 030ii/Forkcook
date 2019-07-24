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
<c:choose>
		<c:when test="${not empty pageNum}">
			<form action="update1.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageNum}">
		</c:when>
		<c:otherwise>
			<form action="update2.do" method="post" enctype="multipart/form-data">	
		</c:otherwise>
	</c:choose>
	문의 수정 페이지
	<br> 아래 폼에 값들이 채워있어야 합니다
	<br> 작성자 : 
	<br> 제목 :
	<input type="text" value="${qdto.subject}" class="form-control" name="subject">
	<br> 내용 :
	<textarea class="form-control" name="content">${qdto.content}</textarea>
	<br> 사진 업로드 :
	<input type="file" name="upfile">


	<c:set var="root" value="<%=request.getContextPath() %>" />
	<input type="hidden" name="num" value="${qdto.num}">
	<button type="button" onclick="history.back()">취소하기</button>
	<button type="submit" onclick="location.href='${root}/main/qna/content.do'">수정하기(수정한문의글 페이지로 감)</button>
</form>
</body>
</html>