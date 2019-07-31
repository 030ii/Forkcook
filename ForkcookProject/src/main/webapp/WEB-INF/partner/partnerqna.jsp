<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">문의 관리 페이지</div>
<p class="fk-desc">총 ${storeTotalCount}개의 문의가 있습니다</p>
<br><br>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
	        <th>No.</th>
			<th>제목</th>
			<th>답변 여부</th>
			<th>문의 날짜</th>
		</tr>
	</thead>
	<tbody>
    	<c:forEach var="qdto" items="${qlist2}" varStatus="status">
    		<c:if test="${qdto.snum == adminLoginInfo.snum}">
	    		<tr>
					<td>${status.count}</td>
					<td><a href="pqcontent.do?qnum=${qdto.num}&pageNum=${currentPage}">${qdto.subject}</a></td>
					<td>
						<c:if test="${qdto.qnastate==1}">답변 없음</c:if>
						<c:if test="${qdto.qnastate==2}">답변 완료</c:if>
					</td>
					<td><fmt:formatDate value="${qdto.writeday}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:if>
		</c:forEach>
    </tbody>
</table>