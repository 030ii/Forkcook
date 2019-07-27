<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">공지사항 게시판</div>
	<br><br>
	<c:set var="root" value="<%=request.getContextPath() %>" />
매장별 보기 : <a href="${root}/admin/notice/list.do">전체</a> |
 			<a href="">강남점</a> |
 			<a href="">분당점</a> |
 			<a href="">부산점</a><br>
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
				<th>수정/삭제</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="dto" items="${list}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a href="content.do?num=${dto.num}&pageNum=${currentPage}">${dto.subject}</a></td>
				<td><fmt:formatDate value="${dto.writeday }"
				   pattern="yyyy-MM-dd"/></td>
				<td><button type="button" class="fk-btn" onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: file-edit"></span> 수정</button>
	       			<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: trash"></span> 삭제</button></td>
			</tr>
		</c:forEach>
	    </tbody>
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
<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" class="fk-btn" onclick="location.href='${root}/admin/notice/form.do'"><span uk-icon="icon: pencil"></span> 게시글 작성</button>
