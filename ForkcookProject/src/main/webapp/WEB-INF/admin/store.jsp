<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">관리자 매장 관리 페이지</div>
<p class="fk-desc">총 ${totalCount}개의 매장이 있습니다</p>
<button type="button" class="fk-float-right uk-button uk-button-default" onclick="location.href='writeform.do'">새로운 매장 추가하기</button>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
            <th>No.</th>
			<th>매장명</th>
			<th>지역</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>메인 사진</th>
			<th width="150">운영 시간</th>
			<th>관리</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="dto" items="${list}" varStatus="status">
	        <tr>
	        	<td>${status.count}</td>
				<td>${dto.name}</td>
				<td>${dto.area}</td>
				<td>${dto.addr}</td>
				<td>${dto.phone}</td>
				<td>${dto.mainimage}</td>
				<td>${dto.opertime}</td>
				<td>
					<button type="button" class="fk-btn" onclick="location.href='updateform.do?num=${dto.num}'"><span uk-icon="icon: file-edit"></span> 수정</button>
					<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}'"><span uk-icon="icon: trash"></span> 삭제</button>
				</td>
	        </tr>     
		</c:forEach>
    </tbody>
</table>