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

<div class="fk-heading">공지사항 게시판</div>
	<br><br>
	<p class="fk-desc">총 ${totalCount}개의 공지글이 있습니다</p>
	<br><br><br>
	<input type="text" id="word" list="list">	
	<button type="button" id="btnsearch">검색</button>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
	    <thead>
	        <tr>
	            <th>No.</th>
				<th>제목</th>
				<th>날짜</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a></td>
				<td><fmt:formatDate value="${dto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
	    </tbody>
	</table>
<div>
	<ul  class="pagination uk-pagination uk-flex-center" uk-margin>
		<c:if test="${startPage>1}">
			<li>
				<a href="list.do?pageNum=${startPage-1}"><span uk-pagination-previous></span></a>
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
				<a href="list.do?pageNum=${endPage+1}"><span uk-pagination-next></span></a>
			</li>
		</c:if>
	</ul>
</div>

</body>
</html>