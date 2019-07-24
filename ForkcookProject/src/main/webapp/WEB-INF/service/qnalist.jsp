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
	<b>문의 게시판</b>
	<br><br>
	<c:set var="root" value="<%=request.getContextPath() %>" />
매장별 보기 : <a href="${root}/main/qna/list.do">전체</a> |
 			<a href="">강남점</a> |
 			<a href="">분당점</a> |
 			<a href="">부산점</a>
 <br>
	<div>총 ${totalCount}개의 문의글이 있습니다</div>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>매장</th>
			<th>날짜</th>
			<th>수정/삭제</th>
		</tr>
		<c:forEach var="qdto" items="${qlist}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<td><a href="content.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
					</c:when>
					<c:otherwise>
						<c:set var="root" value="<%=request.getContextPath() %>" />
						<td><a href="${root}/main/user/login.do">${qdto.subject}</a></td>
					</c:otherwise>
				</c:choose>
				<td>${qdto.unum}</td>
				<td><fmt:formatDate value="${qdto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
				<td>
					<c:if test="${qdto.qnastate==1}">
						<button type="button"
	  						onclick="location.href='updateform.do?qnum=${qdto.num}&pageNum=${pageNum}'">수정</button>
						<button type="button" onclick="location.href='delete.do?qnum=${qdto.num}&pageNum=${pageNum}'">삭제</button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
	<!-- 페이지 번호 출력 -->
<div style="width: 600px;text-align: center;">
	<ul  class="pagination">
		<c:if test="${startPage>1}">
			<li>
				<a href="list.do?pageNum=${startPage-1}">◀</a>
			</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<li>
			  <c:if test="${pp==currentPage}">
				<a href="list.do?pageNum=${pp}">${pp}</a>
			  </c:if>
			  <c:if test="${pp!=currentPage}">
				<a href="list.do?pageNum=${pp}">${pp}</a>
			  </c:if>	
			</li>
		</c:forEach>
		<c:if test="${endPage<totalPage}">	
			<li>
				<a href="list.do?pageNum=${endPage+1}">▶</a>
			</li>
		</c:if>
	</ul>
</div>
<br>
<c:choose>
	<c:when test="${not empty loginInfo}">
		<c:set var="root" value="<%=request.getContextPath() %>" />
		<button type="button" onclick="location.href='${root}/main/qna/form.do'">문의 작성</button>
	</c:when>
</c:choose>
</body>
</html>