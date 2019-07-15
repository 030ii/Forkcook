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
<script>
$(function() {
   $("#deleteBtn").click(function() {
	   var result = confirm('해당 주문을 DB에서도 지웁니다. 정말 삭제하시겠습니까?'); 
	   if(result) { //yes 
		   var ordernum = $('input:hidden[name=ordernum]').val();
		   location.href='delete.do?ordernum='+ordernum;
	   }
  });
});
</script>
</head>
<body>
주문 상세보기 페이지 
<div>
	<h3>주문 기본 정보(주문 목록에서 + 고객 연락처 정보가 추가된 거임)</h3>
	ordernum : ${ld.ordernum}<br> 
	uname : ${ld.uname}<br> 
	uphone : ${ld.uphone}<br> 
	sname : ${ld.sname}<br> 
	ordertype : 
		<c:choose>
		    <c:when test="${ld.ordertype eq 'A'}">현장 주문</c:when>
		    <c:when test="${ld.ordertype eq 'B'}">예약 주문</c:when>
		    <c:otherwise>잘못된 주문</c:otherwise>
		</c:choose><br>
	orderdate : ${ld.orderdate}<br> 
	orderstate : 
		<c:choose>
		    <c:when test="${ld.orderstate eq 1}">접수 완료</c:when>
		    <c:when test="${ld.orderstate eq 2}">조리중</c:when>
		    <c:when test="${ld.orderstate eq 3}">조리 완료</c:when>
		    <c:when test="${ld.orderstate eq 4}">전달 완료</c:when>
		    <c:when test="${ld.orderstate eq 7}">사용자 취소</c:when>
		    <c:when test="${ld.orderstate eq 8}">가맹점 취소</c:when>
		    <c:otherwise>잘못된 상태</c:otherwise>
		</c:choose><br>
	totalcount : ${ld.totalcount}개<br>
	totalprice : ${ld.totalprice}원<br>
	<hr>
	<h3>주문 메뉴 목록</h3>
	<c:forEach var="md" items="${md}">
		mname : ${md.mname}<br>
		mcount : ${md.mcount}개<br>
		mtotalprice : ${md.mtotalprice}원<br>
		<br>
	</c:forEach>
	<br>
	totalcount(총 수량) : ${ld.totalcount}개<br>
	totalprice(총 금액) : ${ld.totalprice}원<br>
</div>
<input type="hidden" name="ordernum" value="${ld.ordernum}"/>
<button type="button" onclick="location.href='list.do'">목록</button>
<button type="button" id="deleteBtn">해당 주문 취소(DB 삭제)</button>
</body>
</html>
