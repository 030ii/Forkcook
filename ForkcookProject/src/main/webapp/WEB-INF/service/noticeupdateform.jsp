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
			<form action="updatec.do" method="post">
				<input type="hidden" name="pageNum" value="${pageNum}">
		</c:when>
		<c:otherwise>
			<form action="updatel.do" method="post">	
		</c:otherwise>
	</c:choose>
				
	<table class="table table-striped" style="width: 400px;">
		<caption><b>게시판글수정</b></caption>
		<tr>
			<th style="width: 100px;">제 목</th>
			<td>
				<input type="text" name="subject" class="form-control"
					value="${dto.subject}">
			</td>
		</tr>
		<tr>			
			<td colspan="2">
				<textarea rows="5" cols="40" name="content" class="form-control">${dto.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="num" value="${dto.num}">
				
				<button style="width: 100px;" type="submit">수정하기</button>
				
				<button style="width: 100px;" type="button"
				onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
				
				<button style="width: 100px;" type="button"
				onclick="history.back()">취소</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>
