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

<table style="width: 400px;" class="table table-bordered">
    <caption><b>메뉴 상세보기</b></caption>
    <tr>
		num : ${mdto.num}<br>
		name : ${mdto.name}<br>
		category : ${mdto.category}<br>  
		persons : ${mdto.persons}<br>
		price : ${mdto.price}<br>
		mainimage : ${mdto.mainimage}<br>
		rate : ${mdto.rate}<br>
		shortmsg : ${mdto.shortmsg}<br>
		longimage : ${mdto.longimage}<br>
		<br><br><hr><br><br>
    </tr>
    
    <tr>
      <td colspan="2">
      
      <div style="width: 380px; height: 130px;" name="content" class="form-control"></div>
      </td>
    </tr>   
    
    <tr>
      <td colspan="2" align="right">     
      	<button type="button" style="width: 100px;" class="btn btn-basic btn-sm" onclick="location.href='${root}/main/review/review.do?mnum=${mdto.num}'">리뷰보기</button>	
        <button type="button" style="width: 100px; margin-left: 175px;" class="btn btn-basic btn-sm" onclick="history.back()">닫 기</button>		
      </td>
    </tr> 

    </table>
    
    <div class="count">
		수량:<br>
		<button type="button" id="minus">-</button>
		<!-- <input type="text" value=0 id="count"> -->
		<span class="count-span">1</span>
		<button type="button" id="plus">+</button>
		가격:<span class="price">${mdto.price}</span>
	</div>
	<div class="intocart">
		<button type="button" class="intocart-btn">장바구니담기</button>
	</div>
		
<script type="text/javascript">
//수량 증가, 감소
	var clicks = 1;
	$("#plus").click(function() {
		clicks++;
		$('.count-span').html(clicks);
		$('.price').html(clicks*${mdto.price});
	});
	$("#minus").click(function() {
		clicks--;
		if (clicks < 1) {
			clicks=1;
			$('.count-span').html(clicks);
			$('.price').html(1*${mdto.price});
		} else {
			$('.count-span').html(clicks);
			$('.price').html(clicks*${mdto.price});
		}
	});
	
	$(".intocart-btn").click(function() {
		var mnum =${mdto.num}
		var mcount =clicks;
		var mtotalprice =${mdto.price}*clicks;
		var unum = ${loginInfo.num};
		console.log("mnum:"+mnum);
		console.log("mcount:"+mcount);
		console.log("mtotalprice:"+mtotalprice);
		window.location.href="insertdetail.do?unum="+unum+"&mnum="+mnum+"&mcount="+mcount+"&mtotalprice="+mtotalprice;
	});
	
	
</script>

</body>
</html>