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
	문의글 입니다 <br>
	<pre>
		제목 : ${qdto.subject}
		등록 날짜 : <fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd HH:mm"/><br>
		가맹점 : ${qdto.unum}<br>
		내용 : ${qdto.content}<br>
		사진 : ${qdto.image}
	</pre>
	<hr>
	<c:if test="${qdto.qnastate==1}">
		<!-- 답변 없음 -->
		<div>답변이 없습니다. 답변을 작성해주세요.</div><br><br>
		<button type="button" onclick="location.href='reqform.do?qnum=${qdto.num}&pageNum=${pageNum}'">답변 추가</button>
	</c:if>
	<c:if test="${qdto.qnastate==2}">
	<!-- 답변 있음 -->
		<div>
			<c:forEach  var="reqdto" items="${reqlist}">
				<b>제 목 : </b>${reqdto.subject}<br><br><br>
				<b>내 용 : </b>${reqdto.content}<br><br>
				<button type="button" onclick="location.href='requpdateform.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">답변 수정</button>
				<button type="button" onclick="location.href='reqdelete.do?reqnum=${reqdto.num}&pageNum=${pageNum}'">답변 삭제</button>
				<hr>
			</c:forEach>	
		</div>
	</c:if>
	<button type="button" onclick="location.href='list.do'">목록</button>
	<c:if test="${qdto.qnastate==1}">
	<button type="button" onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'">해당 문의 삭제하기</button>
	</c:if>
</body>
</html>