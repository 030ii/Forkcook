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
	<b>관리자 문의 관리 페이지</b>
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
			<th>삭제</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a></td>
				<td>${dto.unum}</td>
				<td><fmt:formatDate value="${dto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
				<td>
					<button type="button"
	  					onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'">수정</button>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'">삭제</button>
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
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/main/qna/form.do'">문의 작성</button>
</body>
</html>