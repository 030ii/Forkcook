<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="fk-section">
	<div class="fk-heading">공지사항 게시판</div>
	<p class="fk-desc">총 ${totalCount}개의 공지가 있습니다</p>
	<br><br>
	<div class="uk-margin fk-float-right">
	    <form class="uk-search uk-search-default">
	        <a href="" class="uk-search-icon-flip" uk-search-icon></a>
	        <input class="uk-search-input" type="search" placeholder="글 검색하기">
	    </form>
	</div>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
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
					<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd"/></td>
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
	
</div>