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
<script type="text/javascript">
function deleteReview(num,unum,mnum){
    var result = confirm('삭제하시겠습니까?'); 
    if(result) { //yes 
        $.ajax({
            url: 'delete.do?num='+num+'&unum='+unum+'&mnum='+mnum,
            method: 'get',
            success: function () {
                location.reload(); // 새로고침
            },
            error: function (error) {
                alert('문제가 발생하였습니다. 관리자에게 문의해주세요.');
            }
        });
     }
 }
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
<div class="myPage-wrapper">
	<div class="mypageTitle_div">
		<img src="${root}/image/mypage.png">
	</div>
	<div class="mypageTap_div" uk-switcher="animation: uk-animation-fade; toggle: > *">
	    <button class="uk-button uk-button-default mypageTap_btn" type="button">내 정보</button>
	    <button class="uk-button uk-button-default mypageTap_btn" type="button">내가 쓴 리뷰</button>
	    <button class="uk-button uk-button-default mypageTap_btn" type="button" onclick="location.href='myqna.do?num=${loginInfo.num}'">문의내역</button>
	</div>
	<ul class="uk-switcher uk-margin">
	    <li class="mypageInfoLi">
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
	    
	    <li class="mypageReveLi">
				<table class="uk-table uk-table-responsive uk-table-divider myreview_table">
					<tr>
						<th style="width: 200px;">메뉴명</th>
						<th style="width: 800px;">내용</th>
						<th style="width: 200px;">별점</th>
						<th style="width: 200px;">사진</th>
					</tr>
	    		<c:forEach var="dto" items="${rlist}" varStatus="status">
					<tr style="height: 100px;">
						<td style="width: 200px;">${dto.mname}</td>
						<td style="width: 800px;">${dto.content}</td>
						<td style="width: 200px;">
							<span class="star-prototype" id="spanstar">
								<c:forEach var="i" begin="1" end="${dto.rate }">
									<img src='${root}/image/starrate1.png' style="width: 15px;">
								</c:forEach>
								(<fmt:formatNumber value="${dto.rate}" pattern="0"/>)
							</span>
						</td>
						<td style="width: 200px;">
							<c:if test="${dto.image!='noimage' }">
								<c:forTokens var="myimg" items="${dto.image }" delims=",">
									<a href="../../save/${myimg }" target="_new">
									  <img src="../../save/${myimg }" style="width: 100px; height: 100px;">
									</a>
								</c:forTokens>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
	    </li>
	    <li>내 문의내역 출력</li>
	</ul>
</div>
</body>
</html>