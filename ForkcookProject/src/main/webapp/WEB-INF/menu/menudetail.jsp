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
		<img src="${root}/image/menu-minus.png" class="minus_btn" style="width: 35px;">
			<input type="hidden" name="num" value="${dto.num}"/>
			<span class="count-span" data-num="${dto.num}" style="font-size: 20pt;">1</span>
		<img src="${root}/image/menu-plus.png" class="plus_btn" style="width: 35px; border: 1px red solid;">
			가격 : <span class="price">${mdto.price}</span>
	  </div>
	  
	<div class="intocart">
		<button type="button" id="intocart-btn" style="border: 1px red solid;">장바구니담기</button>
	</div>
		
<script type="text/javascript">
//수량 증가, 감소
	var clicks = 1;
	$(".plus_btn").click(function() {
		clicks++;
		console.log(clicks);
		$('.count-span').html(clicks);
		$('.price').html(clicks*${mdto.price});
	});

	$(".minus_btn").click(function() {
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
	
	/* $("#intocart-btn").click(function() {
		var mnum =${mdto.num}
		var mcount =clicks;
		var mtotalprice =${mdto.price}*clicks;
		var unum = ${loginInfo.num};
		//console.log("mnum:"+mnum);
		//console.log("mcount:"+mcount);
		//console.log("mtotalprice:"+mtotalprice);
		console.log(unum);
		window.location.href="insertdetail.do?unum="+unum+"&mnum="+mnum+"&mcount="+mcount+"&mtotalprice="+mtotalprice;
	}); */
	
	
</script>

</body>
</html>