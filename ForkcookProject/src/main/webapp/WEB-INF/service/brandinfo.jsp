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
<img src="${root}/image/brandinfo.png">
<div>
	<button type="button" onclick="location.href='${root}/main/store/list.do'" class="uk-button uk-button-default">매장 보러가기</button>
	<button type="button" onclick="location.href='${root}/main/menu/list.do'" class="uk-button uk-button-default">메뉴 구경하기</button>
</div>
</body>
</html>
