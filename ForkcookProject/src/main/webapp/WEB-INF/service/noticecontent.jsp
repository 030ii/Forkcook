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
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
	    <thead>
	        <tr>
				<th>제 목 : ${dto.subject}</th>
				<th><fmt:formatDate value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" /></th>
	        </tr>
	    </thead>
	    <tbody>	    	
			<tr>
				<td valign="middle">
					<c:if test="${dto.image!='noimage' }">
						<c:forTokens var="myimg" items="${dto.image }" delims=",">
							<a href="../../save/${myimg}" target="_new">
				  			<img src="../../save/${myimg}" style="width: 500px;">
							</a>
						</c:forTokens>
					</c:if><br>
					${dto.content}
				</td>
			</tr>
	    </tbody>
	</table>
	<div>
		<button type="button" style="width: 80px;"
			onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>
	</div>
</body>
</html>
