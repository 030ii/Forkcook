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
$(function(){
	$("#delBtn").click(function(){
		//체크박스 갯수
		chkcnt=$(".chkBox");
		
		console.log("체크박스 갯수:"+chkcnt.length);
		selcnt=$(".chkBox:checked");
		console.log("선택된 체크박스 갯수:"+selcnt.length);
		
		//선택된 체크박스가 없을경우 경고
		if(selcnt.length==0){
			alert("삭제할 글을 선택해주세요");
			return false;
		}
		
		var nums="";//선택한 글에서 num을 얻어서 , 로 연결
		for(i=0;i<chkcnt.length;i++){
			if(chkcnt[i].checked){
				var n=$(".chkBox").eq(i).data("num");
				nums+=n+",";
			}
		}
		console.log(nums);
		nums=nums.substring(0,nums.length-1);//컴마제거
		console.log("ㅜㅕㅡ"+nums);
		
		//컨트롤러 호출
		location.href="chkdelete.do?nums="+nums;
	});
});
</script>
<script type="text/javascript">
/* $(function(){
	$(".chkBox").click(function(){
		TODO: 체크박스 클릭하면 그때 선택삭제 버튼 활성화
	});
}); */
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
<!-- 로그인 안했을 시에 장바구니 누르면 '먼저로그인하세요' 창 뜨게 해야함  -->

	총 ${totalCount}개의 장바구니 내역이 있습니다.<br>
	<div class="chkAll">
  		<input type="checkbox" name="allCheck" id="allCheck">모두선택
	</div>
  	  	
	<div class="selDel" style="display: block;">
		<button type="button" id="delBtn">선택삭제</button>
	</div>
<div class="cartlist">
	<table border=1>
		<caption>장바구니 목록</caption>
		<tr>
			<th>메뉴</th>
			<th>수량</th>
			<th>가격</th>
			<th>해당 메뉴 총 가격</th>
			<th>삭제</th>
		</tr>
		
		<c:forEach var="dto" items="${list}" varStatus="status">
		<tr class="cartitem">
			<td>
				<div class="checkBox">
  	  				<input type="checkbox" name="chkBox" class="chkBox" data-num="${dto.num}">
  	  			</div>
  	  			${dto.menuname}
  	  		</td>
			<td>
			  <div class="count">
				<button type="button" class="minus">-</button>
				<input type="hidden" name="num" value="${dto.num}"/>
				<span class="mcount" data-num="${dto.num}">${dto.mcount }</span>
				<button type="button" class="plus">+</button>
			  </div>
			</td>
			<td class="price">${dto.mprice}</td>
			<td class="mtotalprice" data-mnum="${dto.mnum}">${dto.mtotalprice}</td>
			<td>
				<button type="button" onclick="location.href='delete.do?num=${dto.num}'">삭제</button>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
<button type="button" onclick="location.href='${root}/main/menu/list.do'">메뉴추가하기</button>
<button type="button" onclick="location.href='${root}/main/order/orderform.do'">결제하러가기</button>

<script type="text/javascript">
//갯수 조절 버튼
$(function(){
	$(".plus").click(function(){
		var mcount = $(this).parent('div.count').children('span.mcount');
		var mtotalprice = $(this).parents('tr.cartitem').find('td.mtotalprice');
		var num = mcount.data("num");
		var mnum = mtotalprice.data("mnum");
		console.log(mnum);
		
		$.ajax({
			type:'get',
			url:"updatemplus.aj",
			data:{"num":num,"mnum":mnum},
			dataType:"text",
			success:function(redata){
				var result = JSON.parse(redata);
				//console.log(result.mcount);
				//console.log(result.mtotalprice);
				
				mcount.text(result.mcount);
				mtotalprice.text(result.mtotalprice);
			},
			error:function(err){
				alert("errorcode:"+err.status+"message:"+err.responseText);
			}
		});
	});
	$(".minus").click(function(){
		var mcount = $(this).parent('div.count').children('span.mcount');
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


</script>
</body>
</html>