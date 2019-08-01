<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="fk-section">
	<div class="fk-heading">문의/답변 게시판</div>
	<p class="fk-desc">총 ${totalCount}개의 문의가 있습니다</p>
	<br><br>
	<div class="uk-margin fk-float-right">
	    <form class="uk-search uk-search-default">
	        <a href="" class="uk-search-icon-flip" uk-search-icon></a>
	        <input class="uk-search-input" type="search" placeholder="글 검색하기">
	    </form>
	    <c:choose>
			<c:when test="${not empty loginInfo}">
				<button type="button" class="fk-btn" onclick="location.href='${root}/main/qna/form.do'"><span uk-icon="icon: file-edit"></span> 문의 작성</button>
			</c:when>
		</c:choose>		    
	</div>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
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
					<c:choose>
						<c:when test="${not empty loginInfo}">
							<td><a href="content.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
						</c:when>
						<c:otherwise>
							<c:set var="root" value="<%=request.getContextPath() %>" />
							<td><a href="${root}/main/user/login.do">${qdto.subject}</a></td>
						</c:otherwise>
					</c:choose>
					<td>${slist[qdto.snum-1].name}</td>
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