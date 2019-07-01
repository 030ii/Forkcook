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
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
결제페이지
<form action="" method="get">
-----------주문정보(현장,방문 탭으로 선택)부분-----------<br>
	방문날짜 : <input type="text" name="date" size="25" placeholder="나중에 날짜선택 템플릿으로"><br>
	방문시간 : <input type="text" name="time" size="25"><br>
	결제정보 : <input type="text" name="pay" size="25"><br>
</form>
	---------------------------------<br>
	주문할메뉴(db에서 불러오기)
	메뉴 : 수량 : 가격 :
	총가격 : 
	
	<!-- <input type="submit" value="결제하기"> -->


<button type="button" onclick="location.href='${root}/order/ordersuccess.do'">결제 완료</button>
</body>
</html>