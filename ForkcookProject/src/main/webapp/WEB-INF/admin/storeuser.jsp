<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     

<div class="fk-heading">관리자 가맹점 회원 관리 페이지</div>
<p class="fk-desc">총 ${totalCount-1}명의 가맹점 회원이 있습니다</p>
<button type="button" class="fk-float-right uk-button uk-button-default" onclick="location.href='insertform.do'">새로운 가맹점 회원 등록하기</button>
<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped fk-table">
    <thead>
        <tr>
            <th>No.</th>
			<th>아이디</th>
			<th>가맹점 지역</th>
			<th>가맹점명</th>
			<th>가입날짜</th>
			<th>관리</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="dto" items="${list}" varStatus="status">
   			<c:if test="${dto.usertype==2}">
		        <tr>
		        	<td>${status.count-1}</td>
					<td>${dto.id}</td>
					<td>${dto.sarea}</td>
					<td>${dto.sname}</td>
					<td>
						<fmt:formatDate var="gaipDate" value="${dto.gaipday}" pattern="yyyy-MM-dd"/>
						${gaipDate}
					</td>
					<td>
						<button type="button" class="fk-btn" onclick="location.href='updateform.do?num=${dto.num}'"><span uk-icon="icon: file-edit"></span> 수정</button>
						<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}'"><span uk-icon="icon: trash"></span> 삭제</button>
					</td>
		        </tr>   
	        </c:if>  
		</c:forEach>
    </tbody>
</table>