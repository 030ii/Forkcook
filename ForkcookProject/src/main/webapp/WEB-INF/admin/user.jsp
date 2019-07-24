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
	<div class="fk-heading">관리자 회원 관리 페이지</div>
	<p class="fk-desc">총 ${usertype1TotalCount}명의 회원과 ${usertype2TotalCount}명의 비회원이 있습니다</p>
	<br><br>
	<ul uk-tab>
		<li><a href="#">회원</a></li>
		<li><a href="#">비회원</a></li>
	</ul>
	<ul class="uk-switcher uk-margin">
		<li>
			<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>아이디</th>
						<th>이름</th>
						<th>핸드폰</th>
						<th>가입날짜</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<c:if test="${dto.usertype==1}">
							<tr>
								<td>${usertype1TotalCount}</td>
								<c:set var="usertype1TotalCount" value="${usertype1TotalCount-1}"/>
								<td>${dto.id}</td>
								<td>${dto.name}</td>
								<td>${dto.phone}</td>
								<td>${dto.gaipday}</td>
								<td>
									<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}'">
										<span uk-icon="icon: trash"></span> 삭제
									</button>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</li>
		<li>
			<table class="uk-table uk-table-hover uk-table-divider uk-table-middle uk-table-striped">
				<thead>
					<tr>
						<th>No.</th>
						<th>이름</th>
						<th>핸드폰</th>
						<th>가입날짜</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${list}" varStatus="status">
						<c:if test="${dto.usertype==2}">
							<tr>
								<td>${usertype2TotalCount}</td>
								<c:set var="usertype2TotalCount" value="${usertype2TotalCount-1}"/>
								<td>${dto.name}</td>
								<td>${dto.phone}</td>
								<td>${dto.gaipday}</td>
								<td>
									<button type="button" class="fk-btn" onclick="location.href='delete.do?num=${dto.num}'">
										<span uk-icon="icon: trash"></span> 삭제
									</button>	
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</li>
	</ul>
</body>
</html>