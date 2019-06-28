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
총 <strong>${totalCount}</strong> 개의 글이 있습니다<br>
공지사항 게시판<br>
매장별 보기 : 전체 | 강남점 | 분당점 | 삼성점<br>
게시글 검색하기<br>
<table>
	<tr style="background:gray;">
		<th style="width: 60px;">번호</th>
		<th style="width: 300px;">제 목</th>
		<th style="width: 80px;">작성자</th>
		<th style="width: 60px;">조회</th>
		<th style="width: 100px;">작성일</th>	
	</tr>
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
아래 버튼은 가맹점주나 관리자 페이지에서 구현될 버튼들입니다<br>
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/notice/form.do'">게시글 작성</button>
</body>
</html>