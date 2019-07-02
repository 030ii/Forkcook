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
	<table style="width: 500px;" class="table table-bordered">
		<tr>
			<th>${dto.subject}<span style="margin-left: 200px;"> <fmt:formatDate
						value="${dto.writeday}" pattern="yyyy-MM-dd HH:mm" />
			</span>
			</th>
		</tr>
		<tr height="250">
			<td valign="top"><br> <pre>
					<span>${dto.content}</span>
				</pre></td>
		</tr>
	</table>
	<div>
		<button type="button" style="width: 80px;"
			onclick="location.href='list.do?pageNum=${pageNum}'">목록</button>

		<button type="button" style="width: 80px;"
			onclick="location.href='updateform.do?num=${dto.num}&pageNum=${pageNum}'">수정</button>

		<button type="button" style="width: 80px;"
			onclick="location.href='delete.do?num=${dto.num}&pageNum=${pageNum}'">삭제</button>
	</div>
</body>
</html>
