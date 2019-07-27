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
<div class="myPage-wrapper">
	<div class="mypageTitle_div">
		<img src="${root}/image/mypage.png">
	</div>
	<div uk-switcher="animation: uk-animation-fade; toggle: > *">
	    <button class="uk-button uk-button-default mypageTap_btn" type="button">내 정보</button>
	    <button class="uk-button uk-button-default mypageTap_btn" type="button" onclick="location.href='myreview.do?unum=${loginInfo.num}'">내가 쓴 리뷰</button>
	    <button class="uk-button uk-button-default mypageTap_btn" type="button" onclick="location.href='myqna.do?num=${loginInfo.num}'">문의내역</button>
	</div>
	
	<ul class="uk-switcher uk-margin">
	    <li>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<table class="uk-table uk-table-responsive uk-table-divider myinfo_table">
					<tr>
						<th>아이디</th>
						<td>${dto.id}</td>
					</tr>
					<tr>
						<th>이름(닉네임)</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th>핸드폰</th>
						<td>${dto.phone}</td>
					</tr>
				</table>
			</c:forEach>
			<button type="button" onclick="location.href='passconfirm.do?num=${loginInfo.num}'"
				 class="uk-button uk-button-default uk-width-1-1 uk-margin-small-bottom updateInfo_btn">정보수정하기</button>
	    </li>
	    
	    <li>
	    	내 리뷰 출력
	    </li>
	    <li>내 문의내역 출력</li>
	</ul>
</div>
</body>
</html>