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
제목 : ${dto.subject}
등록 날짜 : <fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm"/><br>
가맹점 : ${dto.unum}<br>
내용 : ${dto.content}<br>
사진 : ${dto.image}
</pre>
<hr>
<c:if test="${dto.qnastate==1}">
<!-- 답변 없음 -->
	<div>답변이 없습니다. 답변을 작성해주세요.</div>
	<button type="button" onclick="location.href='reqnaform.do?num=${dto.num}'">답변 추가</button>
</c:if>
<c:if test="${dto.qnastate==2}">
<!-- 답변 있음 -->
	<!-- TODO : 답변 content 가져오기! -->
	<div>
		<c:forEach  var="qdto" items="${qlist}">
			<b>제 목 : </b>${qdto.subject}<br><br><br>
			<b>내 용 : </b>${qdto.content}
		</c:forEach>
	</div>
	<button type="button" onclick="location.href='reqnaupdate.do?num=${dto.num}'">답변 수정</button>
	<button type="button" onclick="location.href='reqnadelete.do?num=${dto.num}'">답변 삭제</button>
</c:if>

<hr>

<button type="button" onclick="location.href='list.do'">목록</button>
<button type="button" onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'">해당 문의 삭제하기</button>
</body>
</html>