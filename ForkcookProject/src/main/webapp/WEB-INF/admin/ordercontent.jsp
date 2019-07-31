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
		            window.location.href = "list.do"; // 해당 페이지로 이동
		        },
		        error: function (error) {
		            alert('주문 취소에 실패했습니다. 관리자에게 문의해주세요.');
		        }
		    });
	    }
	}
</script>

<div class="adminOrder_wrapper">
  <div class="adminOrder-card uk-card uk-card-default uk-card-body uk-width-1-2@m">
	<h3 class="uk-card-title">주문 기본 정보</h3>
	<table class="adminOrderUserInfo uk-table uk-table-responsive uk-table-divider">
		<tr>
			<th>주문번호</th>
			<td>${ld.ordernum}</td>
		</tr>
		<tr>
			<th>주문자</th>
			<td>${ld.uname}</td>
		</tr>
		<tr>
			<th>주문자 연락처</th>
			<td>${ld.uphone}</td>
		</tr>
		<tr>
			<th>매장명</th>
			<td>${ld.sname}</td>
		</tr>
		<tr>
			<th>주문타입</th>
			<td>
				<c:choose>
				    <c:when test="${ld.ordertype eq 'A'}">현장 주문</c:when>
				    <c:when test="${ld.ordertype eq 'B'}">예약 주문</c:when>
				    <c:otherwise>잘못된 주문</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>주문날짜</th>
			<td>${ld.orderdate}</td>
		</tr>
		<tr>
			<th>주문상태</th>
			<td>
				<c:choose>
				    <c:when test="${ld.orderstate eq 1}">접수 완료</c:when>
				    <c:when test="${ld.orderstate eq 2}">조리중</c:when>
				    <c:when test="${ld.orderstate eq 3}">조리 완료</c:when>
				    <c:when test="${ld.orderstate eq 4}">전달 완료</c:when>
				    <c:when test="${ld.orderstate eq 7}">사용자 취소</c:when>
				    <c:when test="${ld.orderstate eq 8}">가맹점 취소</c:when>
				    <c:otherwise>잘못된 상태</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr>
			<th>총 갯수</th>
			<td>${ld.totalcount}개</td>
		</tr>
		<tr>
			<th>총 금액</th>
			<td><fmt:formatNumber value="${ld.totalprice}" pattern="#,###" />원</td>
		</tr>
	</table>
  </div>
	<hr style="border: 0.5px black solid;">
	
  <div>
    <h3>주문 메뉴 목록</h3>
    <table class="adminOrder-Table uk-table uk-table-hover uk-table-divider">
	    <thead>
	        <tr>
	            <th style="text-align: right;">메뉴명</th>
	            <th style="text-align: right;">수량</th>
	            <th style="text-align: right;">가격</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="md" items="${md}">
		        <tr>
		            <td>${md.mname}</td>
		            <td>${md.mcount}개</td>
		            <td><fmt:formatNumber value="${md.mtotalprice}" pattern="#,###" />원</td>
		        </tr>
	        </c:forEach>
        </tbody>
        <tr style="background-color: #f8f8f8;">
        	<td></td>
        	<td>총 수량 : ${ld.totalcount}개</td>
        	<td>총 금액 : <fmt:formatNumber value="${ld.totalprice}" pattern="#,###" />원</td>
     </table>
  </div>
  <div class="adminOrderBtn_div">
	<button type="button" onclick="deleteOrder(${ld.ordernum})" class="uk-button uk-button-default"><span uk-icon="icon: trash"></span>해당 주문 삭제</button><!-- TODO : 관리자만 해당 버튼 보이도록 하기 -->
	<button type="button" onclick="history.back()" class="uk-button uk-button-default"><span uk-icon="icon: menu"></span>목록</button>
  </div>
</div>
