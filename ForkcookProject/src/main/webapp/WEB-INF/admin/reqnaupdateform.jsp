<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<form action="requpdate.do" method="post" enctype="multipart/form-data">
		문의 답변 수정 페이지<br>
		<div>
			<input type="text" name="subject" value="${reqdto.subject}" class="form-control"><br><br>
			<input type="file" name="upfile" class="form-control" value="${dto.image}"><br><br>
			<textarea name="content" class="form-control">${reqdto.content}</textarea><br>
		</div>
		<input type="hidden" name="qnum" value="${reqdto.qnum}">
		<input type="hidden" name="num" value="${reqdto.num}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<button type="button" onclick="history.back()">취소하기</button>
		<button type="submit">수정하기</button>
	</form>
