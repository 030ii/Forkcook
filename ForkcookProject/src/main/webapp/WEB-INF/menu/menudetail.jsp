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
<form action="main/menudetail.do" method="post">
    <table style="width: 400px;" class="table table-bordered">
    <caption><b>메뉴 상세보기</b></caption>
    <tr>
		num : ${dto.num}<br>
		name : ${dto.name}<br>
		category : ${dto.category}<br>  
		persons : ${dto.persons}<br>
		price : ${dto.price}<br>
		image : ${dto.image}<br>
		rate : ${dto.rate}<br>
		shortmsg : ${dto.shortmsg}<br>
		longmsg : ${dto.longmsg}<br>
		<br><br><hr><br><br>
    </tr>
    
    <tr>
      <td colspan="2">
      
      <div style="width: 380px; height: 130px;"
      name="content" class="form-control"></div>
      </td>
    </tr>   
    
    <tr>
      <td colspan="2" align="right">     
      	<button type="button" style="width: 100px;" class="btn btn-basic btn-sm" onclick="location.href='${root}/main/review/review.do?mnum=${dto.num}'">리뷰보기</button>	
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
		가격:<span class="price">${dto.price}</span>
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
		$('.price').html(clicks*${dto.price});
	});

	$("#minus").click(function() {
		clicks--;
		if (clicks < 1) {
			clicks=1;
			$('.count-span').html(clicks);
			$('.price').html(1*${dto.price});
		} else {
			$('.count-span').html(clicks);
			$('.price').html(clicks*${dto.price});
		}
	});
</script>
</form>
</body>
</html>