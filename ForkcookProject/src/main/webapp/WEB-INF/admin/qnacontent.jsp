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
	<p class="fk-desc">문의글 입니다</p>
	<table class="uk-table uk-table-middle uk-table-divider">
			<tr>
				<th>
				<b>제 목 : ${qdto.subject}</b>
				<br>날 짜 : <fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd HH:mm"/>
	        	<br>가맹점 : ${qdto.unum}
	        	<br>사 진 : ${qdto.image}
	        	<br><br>내 용 : ${qdto.content}<hr>
	        	</th>
	        </tr>
	</table>
		<c:if test="${qdto.qnastate==1}">
		<!-- 답변 없음 -->
		<div>답변이 없습니다. 답변을 작성해주세요.</div><br><br>
		<button type="button" onclick="location.href='reqform.do?qnum=${qdto.num}&pageNum=${pageNum}'"><span uk-icon="comments"></span> 답변 추가</button>
	</c:if>
	<c:if test="${qdto.qnastate==2}">
	<!-- 답변 있음 -->
		<div>
			<c:forEach  var="reqdto" items="${reqlist}">
				<b> 제 목 : </b>${reqdto.subject}<br><br><br>
				<b> 내 용 : </b>${reqdto.content}<br><br>
				<button type="button" onclick="location.href='requpdateform.do?reqnum=${reqdto.num}&pageNum=${pageNum}'"><span uk-icon="file-edit"></span> 답변 수정</button>
				<button type="button" onclick="location.href='reqdelete.do?reqnum=${reqdto.num}&pageNum=${pageNum}'"><span uk-icon="trash"></span> 답변 삭제</button>
				<hr>
			</c:forEach>	
		</div>
	</c:if>
	<button type="button" onclick="location.href='list.do?"><span uk-icon="list"></span> 목록</button>
	<c:if test="${qdto.qnastate==1}">
	<button type="button" onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'"><span uk-icon="trash"></span> 해당 문의 삭제</button>
	</c:if>
</body>
</html>