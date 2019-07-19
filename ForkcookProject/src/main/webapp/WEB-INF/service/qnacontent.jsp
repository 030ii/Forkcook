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
등록 날짜 : <fmt:formatDate value="${qdto.writeday}"
				   pattern="yyyy-MM-dd HH:mm"/><br>
가맹점 : ${sdto.name}<br>
내용 : ${qdto.content}<br>
사진 : ${qdto.image}
</pre>
<hr>
<c:if test="${qdto.qnastate==1}">
<!-- 답변 없음 -->
	<div>문의 확인 중 입니다.</div>
</c:if>
<c:if test="${qdto.qnastate==2}">
<!-- 답변 있음 -->
	<!-- TODO : 답변 content 가져오기! -->
	<div>
		<c:forEach  var="reqdto" items="${reqlist}">
			<b>제 목 : </b>${reqdto.subject}<br><br><br>
			<b>내 용 : </b>${reqdto.content}<hr>
		</c:forEach>
	</div>
</c:if>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" class="btn btn-info btn-sm"
	  onclick="history.back()">뒤로가기</button>
<button type="button" class="btn btn-info btn-sm"
	  onclick="location.href='${root}/main/qna/list.do'">목록</button>
<button type="button" class="btn btn-success btn-sm"
	  onclick="location.href='updateform.do?qnum=${qdto.num}&pageNum=${pageNum}'">수정</button>
<button type="button" class="btn btn-danger btn-sm"
	  onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'">삭제</button>
</body>
</html>