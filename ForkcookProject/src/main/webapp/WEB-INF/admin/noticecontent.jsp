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
				  			<img src="../../save/${myimg}" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if><br>
					${dto.content}
				</td>
			</tr>
	    </tbody>
	</table>
	<div>
		<button type="button" class="fk-btn"
			onclick="location.href='list.do?pageNum=${pageNum}'"><span uk-icon="icon: list"></span> 목록</button>

		<button type="button" class="fk-btn"
			onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: file-edit"></span> 수정</button>

		<button type="button" class="fk-btn"
			onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'"><span uk-icon="icon: trash"></span> 삭제</button>
	</div>
</body>
</html>
