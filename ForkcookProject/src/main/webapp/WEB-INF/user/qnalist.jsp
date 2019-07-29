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
	<b>내 문의 내역</b>
	<br><br>
	<c:set var="root" value="<%=request.getContextPath() %>" />
매장별 보기 : <a href="${root}/main/user/myqna.do">전체</a> |
 			<a href="">강남점</a> |
 			<a href="">분당점</a> |
 			<a href="">부산점</a>
 <br>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
		<tr>
			<th>No.</th>
			<th>제목</th>
			<th>매장</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="qdto" items="${qlist}" varStatus="status">
		<c:if test="${qdto.unum == '2'}">
			<tr>
				<td>${status.count}</td>
				<td><a href="uqcontent.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
				<td>${slist[qdto.snum-1].name}</td>
				<td><fmt:formatDate value="${qdto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:if>
		</c:forEach>
	</table>
	<!-- 페이지 번호 출력 -->
<div style="width: 600px;text-align: center;">
	<ul  class="pagination uk-pagination uk-flex-center" uk-margin>
		<c:if test="${startPage>1}">
			<li>
				<a href="myqna.do?pageNum=${startPage-1}"><span uk-pagination-previous></span></a>
			</li>
		</c:if>
		<c:forEach var="pp" begin="${startPage}" end="${endPage}">
			<li>
			  <c:if test="${pp==currentPage}">
				<a href="myqna.do?pageNum=${pp}">${pp}</a>
			  </c:if>
			  <c:if test="${pp!=currentPage}">
				<a href="myqna.do?pageNum=${pp}">${pp}</a>
			  </c:if>	
			</li>
		</c:forEach>
		<c:if test="${endPage<totalPage}">	
			<li>
				<a href="myqna.do?pageNum=${endPage+1}"><span uk-pagination-next></span></a>
			</li>
		</c:if>
	</ul>
</div>
<br>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/main/user/form.do'">문의 작성</button>
</body>
</html>