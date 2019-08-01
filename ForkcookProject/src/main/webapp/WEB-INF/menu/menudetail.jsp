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
<hr class="menuHr">
<div class="menuDetail_wrapper">
	<div class="menuDetail-msg">
		${mdto.name}
	</div>
	<span class="menuDetail_cate">${mdto.category}</span>
	
	<img src="../../save/${mdto.mainimage}" class="menuDetail-img">
	
	<div class="menuDetail-Info">
		<span uk-icon="icon: user"></span>&nbsp;&nbsp; ${mdto.persons}<br>
		<span uk-icon="icon: star"></span>&nbsp;&nbsp;&nbsp;${mdto.rate }<br>
	</div>
	
      <div class="count_div">
		<img src="${root}/image/menu-minus.png" class="minus_btn" style="width: 35px;">
			<input type="hidden" name="num" value="${dto.num}"/>
			<span class="count-span" data-num="${dto.num}" style="font-size: 20pt;">1</span>
		<img src="${root}/image/menu-plus.png" class="plus_btn" style="width: 35px;"><br>
			가격 : <span class="MD_price">￦&nbsp;<fmt:formatNumber value="${mdto.price}" pattern="#,###" /></span>
	  </div>
	
	<div class="intocart">
		<button type="button" class="menuD_cartbtn uk-button uk-button-default" id="intocart-btn">장바구니담기</button><br>
		<button type="button" class="menuD_backbtn uk-button uk-button-default" onclick="history.back()">목록으로</button><br>
	</div>
	<div>
		<img src="../../save/${mdto.longimage}" style="margin-top: 50px;">
	</div>
		<button type="button" class="goReview-btn uk-button uk-button-default" onclick="location.href='${root}/main/review/review.do?mnum=${mdto.num}'">리뷰보기</button>
	
  
</div>

<script type="text/javascript">
//수량 증가, 감소
	var clicks = 1;
	$(".plus_btn").click(function() {
		clicks++;
		console.log(clicks);
		$('.count-span').html(clicks);
		$('.MD_price').text("￦"+numberWithCommas(clicks*${mdto.price}));
	});

	$(".minus_btn").click(function() {
		clicks--;
		if (clicks < 1) {
			clicks=1;
			$('.count-span').html(clicks);
			$('.MD_price').text("￦"+numberWithCommas(clicks*${mdto.price}));
		} else {
			$('.count-span').html(clicks);
			$('.MD_price').text("￦"+numberWithCommas(clicks*${mdto.price}));
		}
	});
	
	$("#intocart-btn").click(function() {
		var mnum =${mdto.num}
		var mcount =clicks;
		var mtotalprice =${mdto.price}*clicks;
		var unum = ${loginInfo.num};
		
		/* console.log("mnum:"+mnum);
		console.log("mcount:"+mcount);
		console.log("mtotalprice:"+mtotalprice);
		console.log(unum); */
		
		window.location.href="insertdetail.do?unum="+unum+"&mnum="+mnum+"&mcount="+mcount+"&mtotalprice="+mtotalprice;
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>
</body>
</html>
