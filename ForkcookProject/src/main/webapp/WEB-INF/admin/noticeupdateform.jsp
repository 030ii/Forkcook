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

	<c:choose>
		<c:when test="${not empty pageNum}">
			<form action="updatec.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pageNum" value="${pageNum}">
		</c:when>
		<c:otherwise>
			<form action="updatel.do" method="post" enctype="multipart/form-data">	
		</c:otherwise>
	</c:choose>
				
	<fieldset class="uk-fieldset">

        <legend class="uk-legend">공지글 수정</legend>

        <div class="uk-margin">
            <input type="text" name="subject" class="form-control" required="required" value="${dto.subject}">
        </div>

        <div class="uk-margin">
            <input type="file" name="upfile" class="form-control" value="${dto.image}">
        </div>

        <div class="uk-margin">
            <textarea name="content" class="form-control">${dto.content}</textarea>
        </div>

        <div class="uk-margin">
            <input type="hidden" name="num" value="${dto.num}">
				
			<button type="submit">수정하기</button>
				
			<button type="button" onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
				
			<button type="button" onclick="history.back()">취소</button>
        </div>

    </fieldset>
</form>

</body>
</html>
