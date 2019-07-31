<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script type="text/javascript">
// 주문 삭제
function deleteOrder(ordernum){
	var result = confirm('해당 주문을 DB에서도 지웁니다. 정말 삭제하시겠습니까?'); 
	if(result) { //yes 
	    $.ajax({
	        url: 'delete.do?ordernum='+ordernum,
	        method: 'DELETE',
	        success: function () {
	            location.reload(); // 새로고침
	        },
	        error: function (error) {
	            alert('주문 취소에 실패했습니다. 관리자에게 문의해주세요.');
	        }
	    });
    }
}
</script>

<div class="fk-heading">관리자 주문 페이지</div>
<p class="fk-desc">총 ${totalCount}개의 주문이 있습니다.</p>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
            <th>No.</th>
			<th>주문번호</th>
			<th>주문자명</th>
			<th>매장명</th>
			<th>총 결제 금액</th>
			<th>주문 유형</th>
			<th>주문 날짜</th>
			<th>주문 상태</th>
			<th>관리</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="dto" items="${list}" varStatus="status">
	        <tr>
	        	<td>${totalCount}</td>
				<c:set var="totalCount" value="${totalCount-1}"/>
				<td>${dto.ordernum}</td>
				<td>${dto.uname}</td>
				<!-- <td>${dto.uphone}</td> -->
				<td>${dto.sname}</td>
				<td>${dto.totalprice}</td>
				<td>
					<c:choose>
					    <c:when test="${dto.ordertype eq 'A'}">현장 주문</c:when>
					    <c:when test="${dto.ordertype eq 'B'}">예약 주문</c:when>
					    <c:otherwise>잘못된 주문</c:otherwise>
					</c:choose>
				</td>
				<td>
					<fmt:formatDate var="orderDate" value="${dto.orderdate}" pattern="yyyy-MM-dd"/>
					${orderDate}
				</td>
				<td>
					<c:choose>
					    <c:when test="${dto.orderstate eq 1}">접수 완료</c:when>
					    <c:when test="${dto.orderstate eq 2}">조리중</c:when>
					    <c:when test="${dto.orderstate eq 3}">조리 완료</c:when>
					    <c:when test="${dto.orderstate eq 4}">전달 완료</c:when>
					    <c:when test="${dto.orderstate eq 7}">사용자 취소</c:when>
					    <c:when test="${dto.orderstate eq 8}">가맹점 취소</c:when>
					    <c:otherwise>잘못된 상태</c:otherwise>
					</c:choose>
				</td>
				<td>
					<button type="button" class="fk-btn" onclick="location.href='content.do?ordernum=${dto.ordernum}'"><span uk-icon="icon: file-text"></span> 상세보기</button>
					<button type="button" class="fk-btn" onclick="deleteOrder(${dto.ordernum})"><span uk-icon="icon: trash"></span> 주문 삭제</button>
				</td>
	        </tr>     
		</c:forEach>
    </tbody>
</table>