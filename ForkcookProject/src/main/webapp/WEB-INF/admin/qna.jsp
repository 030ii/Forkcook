<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="fk-heading">관리자 문의 관리 페이지</div>
<p class="fk-desc">총 ${totalCount}개의 문의가 있습니다</p>
<br><br>
<!-- 매장별 문의 보기 기능 추후 추가 
		매장별 보기 : 
		<a href="${root}/admin/qna/list.do">전체</a> |
		<a href="">강남점</a> |
		<a href="">분당점</a> |
		<a href="">부산점</a>
-->
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
	        <th>No.</th>
			<th>제목</th>
			<th>문의 매장</th>
			<th>답변 여부</th>
			<th>문의 날짜</th>
		</tr>
	</thead>
	<tbody>
    	<c:forEach var="qdto" items="${qlist}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
				<td>${slist[qdto.snum-1].name}</td>
				<td>
					<c:if test="${qdto.qnastate==1}">답변 없음</c:if>
					<c:if test="${qdto.qnastate==2}">답변 완료</c:if>
				</td>
				<td><fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</c:forEach>
    </tbody>
</table>

<ul  class="pagination uk-pagination uk-flex-center" uk-margin>
	<c:if test="${startPage>1}">
		<li>
			<a href="list.do?pageNum=${startPage-1}"><span uk-pagination-previous></span></a>
		</li>
	</c:if>
	<c:forEach var="pp" begin="${startPage}" end="${endPage}">
		<li>
		  <c:if test="${pp==currentPage}">
			<a href="list.do?pageNum=${pp}" class="uk-active">${pp}</a>
		  </c:if>
		  <c:if test="${pp!=currentPage}">
			<a href="list.do?pageNum=${pp}">${pp}</a>
		  </c:if>	
		</li>
	</c:forEach>
	<c:if test="${endPage<totalPage}">	
		<li>
			<a href="list.do?pageNum=${endPage+1}"><span uk-pagination-next></span></a>
		</li>
	</c:if>
</ul>