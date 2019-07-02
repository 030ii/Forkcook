<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<h2>매장 상세 페이지</h2>
	<div class="card">
		<div class="card-body">
			num : ${dto.num}<br> 
			name : ${dto.name}<br> 
			area : ${dto.area}<br> 
			addr : ${dto.addr}<br> 
			phone : ${dto.phone}<br>
			mainimage : ../image/${dto.mainimage}<br> 
			mapimage : ${dto.mapimage}<br> 
			opertime : ${dto.opertime}<br> 
			shortmsg : ${dto.shortmsg}<br> 
			longmsg : ${dto.longmsg}<br> 
		</div>
	</div>
	<br>
	<button type="button"
		onclick="location.href='${root}/main/partner/partnerqna.do'">매장문의</button>
	<button type="button" onclick="location.href='${root}/main/menu/list.do'">주문하기</button>
</body>
</html>