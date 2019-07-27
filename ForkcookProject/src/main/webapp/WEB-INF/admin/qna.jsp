<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">관리자 문의 관리 페이지</div>
<br><br>
<c:set var="root" value="<%=request.getContextPath() %>" />
		매장별 보기 : 
		<a href="${root}/admin/qna/list.do">전체</a> |
			<a href="">강남점</a> |
			<a href="">분당점</a> |
			<a href="">부산점</a>
	<br>
<p class="fk-desc">총 ${totalCount}개의 문의글이 있습니다</p>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
    <thead>
        <tr>
            <th>No.</th>
			<th>제목</th>
			<th>매장</th>
			<th>날짜</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="qdto" items="${qlist}" varStatus="status">
		<tr>
			<td>${status.count}</td>
			<td><a href="content.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
			<td>${qdto.unum}</td>
			<td><fmt:formatDate value="${qdto.writeday }"
			   pattern="yyyy-MM-dd"/></td>
		</tr>
		</c:forEach>
    </tbody>
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