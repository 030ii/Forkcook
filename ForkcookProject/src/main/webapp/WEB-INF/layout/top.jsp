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
<c:set var="root" value="<%=request.getContextPath() %>"/>
<body>
	<a href="${root}/main.do">
		<img src="${root}/image/08.png" width="50" align="center">Spring5+Tiles3+Mybatis3+Oracle
	</a>
</body>
</html>
