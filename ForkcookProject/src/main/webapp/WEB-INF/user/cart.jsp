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
<!-- 로그인 안했을 시에 장바구니 누르면 '먼저로그인하세요' 창 뜨게 해야함  -->

	총 ${totalCount}개의 장바구니 내역이 있습니다.<br>
	<div class="chkAll">
  		<input type="checkbox" name="allCheck" id="allCheck">모두선택
	</div>
  	  	
	<div class="selDel">
		<button type="button" class="btn btn-sm btn-default" id="delBtn">선택삭제</button>
	</div>
<div class="cartlist">
	<table border=1>
		<caption>장바구니 목록</caption>
		<tr>
			<th>메뉴</th>
			<th>수량</th>
			<th>가격</th>
		</tr>
		
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr>
			<td>
				<div class="checkBox">
  	  			<input type="checkbox" name="chkBox" class="chkBox">
  	  			</div>${dto.menuname}
  	  		</td>
			<td>
			  <div class="count">
				<button type="button" class="minus">-</button>
				<span class="mcount">${dto.mcount }</span>
				<button type="button" class="plus" onclick="location.href='${root}/main/cart/update.do'">+</button>
			  </div>
			</td>
			<td>${dto.mtotalprice}</td>
		</tr>
		</c:forEach>
	</table>
</div>
	<c:set var="root" value="<%=request.getContextPath() %>" />
<button type="button" onclick="location.href='${root}/main/menu/list.do'">메뉴추가하기</button>
<button type="button" onclick="location.href='${root}/main/order/orderform.do'">결제하러가기</button>

<script type="text/javascript">
//갯수 조절 버튼
$(function(){
	$(".plus").click(function(){
		var mcount = $(this).parent('.count').children('.mcount');
		var mcountnum = parseInt(mcount.text());
		mcountnum++;
		mcount.text(mcountnum);
	});
	$(".minus").click(function(){
		var mcount = $(this).parent('.count').children('.mcount');
		console.log(mcount);
		var mcountnum = parseInt(mcount.text());
		mcountnum--;
		if(mcountnum<1){
		mcount.text(1);
		}else{
			mcount.text(mcountnum);
		}
	});
});

//전체선택체크하면 모두 선택되는거
$("#allCheck").click(function(){
	var chk=$("#allCheck").prop("checked");
	if(chk){
		$(".chkBox").prop("checked",true);
	}else{
		$(".chkBox").prop("checked",false);
	}
});
//개별체크를 하나라도 해제하면 전체선택이 체크해제됨
$(".chkBox").click(function(){
	$("#allCheck").prop("checked",false);
});

//장바구니 목록 삭제
$("#delBtn").click(function(){
	alert("삭제하시겠습니까?");
	
	$.ajax({
		type:'get',
		url:"delet.do",
		data:{"num":num},
		dataType:"xml",
		success:function(redata){
		},
		error:function(err){
			alert("errorcode:"+err.status);
		}
	});
});
</script>
</body>
</html>