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
	<h2>매장 페이지</h2>
	<div>전국에 총 ${totalCount }개의 포크쿡 매장이 있습니다</div>
	<br>
	<c:forEach var="dto" items="${list}">
		<div class="card">
		  <div class="card-body">
		    num : ${dto.num}<br>
		    name : ${dto.name}<br>
			area : ${dto.area}<br>
			addr : ${dto.addr}<br>
			phone : ${dto.phone}<br>
			<!-- mainimage : ../image/${dto.mainimage}<br> 
			mapimage : ${dto.mapimage}<br> -->
			opertime : ${dto.opertime}<br> 
			<!-- shortmsg : ${dto.shortmsg}<br> 
			longmsg : ${dto.longmsg}<br> -->
			<a href="${root}/main/store/detail.do?num=${dto.num}" class="btn btn-primary">매장 상세보기&rarr;</a>
		  </div>
		</div>
		<br>
	</c:forEach>
</body>
</html>