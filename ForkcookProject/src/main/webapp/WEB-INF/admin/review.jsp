<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">관리자 메뉴리뷰 관리 페이지</div>
<p class="fk-desc">총 ${totalCount}개의 리뷰가 있습니다</p>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
            <th>No.</th>
			<th>작성자</th>
			<th>메뉴 이름</th>
			<th>리뷰 사진</th>
			<th width="300">내용</th>
			<th>평점</th>
			<th>작성일</th>
			<th>관리</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="dto" items="${list}" varStatus="status">
	        <tr>
	            <td>${totalCount}</td>
				<c:set var="totalCount" value="${totalCount-1}"/>
				<td>${dto.uname}</td>
				<td>${dto.mname}</td>
				<td><img src="../../save/${dto.image}"></td>
				<td>${dto.content}</td>
				<td>${dto.rate}</td>
				<td>
					<fmt:formatDate var="writeDate" value="${dto.writeday}" pattern="yyyy-MM-dd"/>
					${writeDate}
				</td>
				<td>
					<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}&mnum=${dto.mnum}'"><span uk-icon="icon: trash"></span> 삭제</button>
				</td>
	        </tr>     
		</c:forEach>
    </tbody>
</table>