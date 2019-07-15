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
<script type="text/javascript">

</script>
</head>
<body>
총 <strong>${totalCount}</strong> 개의 글이 있습니다<br>
공지사항 게시판<br>
<br><br>
	<c:set var="root" value="<%=request.getContextPath() %>" />
매장별 보기 : <a href="${root}/main/notice/list.do">전체</a> |
 			<a href="">강남점</a> |
 			<a href="">분당점</a> |
 			<a href="">부산점</a><br>
게시글 검색하기<br>
	<input type="text" id="word" list="list">	
	<button type="button" id="btnsearch">검색</button>
	
 <br>
	<div>총 ${totalCount}개의 공지글이 있습니다</div>
	<table border=1>
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a></td>
				<td><fmt:formatDate value="${dto.writeday }"
				   pattern="yyyy-MM-dd"/></td>

			</tr>
		</c:forEach>
	</table>
<div>
	<ul  class="pagination">
		<c:if test="${startPage>1}">
			<li>
				<a href="list.do?pageNum=${startPage-1}">◀</a>
			</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<li>
			  <c:if test="${pp==currentPage}">
				<a href="list.do?pageNum=${pp}" style="color: red;">${pp}</a>
			  </c:if>
			  <c:if test="${pp!=currentPage}">
				<a href="list.do?pageNum=${pp}" style="color: black;">${pp}</a>
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


<br><br>

</body>
</html>