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
	<div class="fk-heading">관리자 메뉴 관리 페이지</div>
	<p class="fk-desc">총 ${totalCount}개의 메뉴가 있습니다</p>
	<button type="button" class="fk-float-right uk-button uk-button-default" onclick="location.href='writeform.do'">새로운 메뉴 추가하기</button>
	<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
	    <thead>
	        <tr>
	            <th>No.</th>
				<th>메뉴 이름</th>
				<th>카테고리</th>
				<th>인분</th>
				<th>가격</th>
				<th>메인사진</th>
				<th>평점</th>
				<th>요약</th>
				<th>수정/삭제</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach var="dto" items="${list}" varStatus="status">
		        <tr>
		            <td>${status.count}</td>
					<td>${dto.name}</td>
					<td>${dto.category}</td>
					<td>${dto.persons}</td>
					<td>${dto.price}</td>
					<td>${dto.mainimage}</td>
					<td>${dto.rate}</td>
					<td>${dto.shortmsg}</td>
					<td>
						<button type="button" class="fk-btn" onclick="location.href='updateform.do?num=${dto.num}'"><span uk-icon="icon: file-edit"></span> 수정</button>
						<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}'"><span uk-icon="icon: trash"></span> 삭제</button>
					</td>
		        </tr>     
			</c:forEach>
	    </tbody>
	</table>
</body>
</html>