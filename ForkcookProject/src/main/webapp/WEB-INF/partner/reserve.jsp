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
<script type="text/javascript">
	// 주문 삭제
	function updateOrderstate(state,ordernum){
		var result = confirm('상태를 변경하시겠습니까?'); 
		if(result) { //yes 
		    $.ajax({
		        url: 'update/'+state+'.do?ordernum='+ordernum,
		        method: 'POST',
		        success: function () {
		            location.reload(); // 새로고침
		        },
		        error: function (error) {
		            alert('문제가 발생하여 주문 상태가 변경되지 않았습니다. 관리자에게 문의해주세요.');
		        }
		    });
	    }
	}
</script>
</head>
<body>
	가맹점용 예약주문 관리 페이지<br>
	
	총 ${reserveTotalCount}개의 주문이 있습니다.<br>
	
	<table border=1>
		<tr>
			<th>No.</th>
			<th>주문번호</th>
			<th>주문자명</th>
			<!-- <th>주문자 연락처</th> -->
			<!-- <th>매장명</th> -->
			<th>총 결제 금액</th>
			<th>주문 날짜</th>
			<th>주문 상태</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:if test="${dto.snum == '3' && dto.ordertype=='B' && dto.orderstate != 4}">
				<tr>
					<td>${reserveTotalCount}</td>
					<c:set var="reserveTotalCount" value="${reserveTotalCount-1}"/>
					<td>${dto.ordernum}</td>
					<td>${dto.uname}</td>
					<td>${dto.totalprice}</td>
					<td>${dto.orderdate}</td>
					<td>
						<c:choose>
						    <c:when test="${dto.orderstate eq 1}">접수 완료</c:when>
						    <c:when test="${dto.orderstate eq 2}">조리중</c:when>
						    <c:when test="${dto.orderstate eq 3}">조리 완료</c:when>
						    <c:when test="${dto.orderstate eq 4}">전달 완료</c:when>
						    <c:when test="${dto.orderstate eq 7}">사용자 취소</c:when>
						    <c:when test="${dto.orderstate eq 8}">가맹점 취소</c:when>
						    <c:otherwise>잘못된 상태</c:otherwise>
						</c:choose><br>
						<button type="button" onclick="updateOrderstate('state2',${dto.ordernum})">조리시작</button><br>
						<button type="button" onclick="updateOrderstate('state3',${dto.ordernum})">조리완료</button><br>
						<button type="button" onclick="updateOrderstate('state4',${dto.ordernum})">전달완료</button>
						
					</td>
					<td>
						<button type="button" onclick="location.href='content.do?ordernum=${dto.ordernum}'">상세보기</button><br>
						<button type="button" onclick="updateOrderstate('state8',${dto.ordernum})">주문취소</button>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
</body>
</html>