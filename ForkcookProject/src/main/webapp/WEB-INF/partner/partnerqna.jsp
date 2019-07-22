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
	가맹점용 문의 관리 페이지<br>
	아직 가맹점 회원 로그인 세션의 코드가 없으므로,<br>
	일단 '포크쿡 강남점(snum값=2)'의 화면이라고 가정하여 구현하겠음<br>
	
	<div class="fk-heading">가맹점 문의 관리 페이지</div>
	<p class="fk-desc">총 ${totalCount}개의 문의글이 있습니다</p>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
	    <thead>
	        <tr>
	            <th>No.</th>
				<th>제목</th>
				<th>날짜</th>
	        </tr>
	    </thead>
	    <c:forEach var="qdto" items="${qlist}" varStatus="status">
		<c:if test="${qdto.snum == '2'}">
	    <tbody>
		    <tr>
		        <td>${status.count}</td>
				<td><a href="pqcontent.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
				<td><fmt:formatDate value="${qdto.writeday }"
				   	pattern="yyyy-MM-dd"/></td>
		    </tr>    
	    </tbody>
	    </c:if>
		</c:forEach>	
	</table>
	<!-- 페이지 번호 출력 -->
	<div style="width: 600px;text-align: center;">
		<ul  class="pagination">
			<c:if test="${startPage>1}">
				<li>
					<a href="partner.do?pageNum=${startPage-1}">◀</a>
				</li>
			</c:if>
			<c:forEach var="pp" begin="${startPage}" end="${endPage}">
				<li>
				  <c:if test="${pp==currentPage}">
					<a href="partner.do?pageNum=${pp}">${pp}</a>
				  </c:if>
				  <c:if test="${pp!=currentPage}">
					<a href="partner.do?pageNum=${pp}">${pp}</a>
				  </c:if>	
				</li>
			</c:forEach>
			<c:if test="${endPage<totalPage}">	
				<li>
					<a href="partner.do?pageNum=${endPage+1}">▶</a>
				</li>
			</c:if>
		</ul>
	</div>
	<br>
</body>
</html>