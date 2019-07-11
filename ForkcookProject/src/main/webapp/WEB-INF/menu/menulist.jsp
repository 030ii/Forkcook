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
	<c:set var="root" value="<%=request.getContextPath() %>" />

<!-- TODO : 카테고리별 분류 -->
<!-- TODO : CSS는 추후에 UI kit에 맞게 다시 재배열 -->
<!-- TODO : 메뉴에 마우스 오버시 장바구니/상세보기 나오게 하기 -->

	<c:forEach var="dto" items="${list}">
		<div class="card" style="width: 20rem;">
			<img class="card-img-top" src="../../image/${dto.image}" alt="Card image cap">
			<div class="card-body">
				<h4 class="card-title">${dto.name}</h4>
				<p class="card-text">${dto.shortmsg}</p>
				<a href="${root}/main/menu/detail.do?num=${dto.num}" class="btn btn-primary">자세히 보기&rarr;</a>
			</div>
		</div>
	<!-- 아래는 장바구니 담는 코드(수량조절&카드담기버튼) -->
		<div class="count">
			수량:<br>
			<button type="button" class="minus">-</button>
			<!-- <input type="text" value=0 id="count"> -->
			<span class="count-span mcount">1</span>
			<button type="button" class="plus">+</button>
		</div>
		<div class="intocart">
			<button type="button" class="intocart-btn">장바구니담기</button>
		</div>
		<br>
	</c:forEach>
	
	
<div id="count2">
    <span class="figure"></span>
</div>
<button type="button" id="like">Like</button>

<script type="text/javascript">
$(function(){
	$(".plus").click(function(){
		var mcount = $(this).parent('.count').children('.mcount');
		var mcountnum = parseInt(mcount.text());
		mcountnum++;
		mcount.text(mcountnum);
	});
	$(".minus").click(function(){
		var mcount = $(this).parent('.count').children('.mcount');
		var mcountnum = parseInt(mcount.text());
		mcountnum--;
		if(mcountnum<1){
		mcount.text(1);
		}else{
			mcount.text(mcountnum);
		}
	});
});
</script>
</body>
</html>
