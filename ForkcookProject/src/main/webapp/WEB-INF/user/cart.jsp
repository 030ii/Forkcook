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
<script type="text/javascript">
	$(function() {
		$("#delBtn").click(function() {
			//체크박스 갯수
			chkcnt = $(".chkBox");

			console.log("체크박스 갯수:" + chkcnt.length);
			selcnt = $(".chkBox:checked");
			console.log("선택된 체크박스 갯수:" + selcnt.length);

			//선택된 체크박스가 없을경우 경고
			if (selcnt.length == 0) {
				alert("삭제할 항목을 선택해주세요");
				return false;
			}

			var nums = "";//선택한 글에서 num을 얻어서 , 로 연결
			for (i = 0; i < chkcnt.length; i++) {
				if (chkcnt[i].checked) {
					var n = $(".chkBox").eq(i).data("num");
					nums += n + ",";
				}
			}
			console.log(nums);
			nums = nums.substring(0, nums.length - 1);//컴마제거
			console.log("ㅜㅕㅡ" + nums);

			//컨트롤러 호출
			location.href = "chkdelete.do?nums=" + nums + "&unum=" + $
			{
				loginInfo.num
			}
			;
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
	<c:set var="root" value="<%=request.getContextPath()%>" />
	<!-- 로그인 안했을 시에 장바구니 누르면 '먼저로그인하세요' 창 뜨게 해야함  -->
	<div class="cartform-big uk-flex uk-flex-wrap uk-flex-wrap-around uk-background-muted uk-height-medium">
		<div class="cartlist">
			<c:choose>
				<c:when test="${totalCount ==0 }">장바구니가 비어있습니다.</c:when>
				<c:otherwise>
					<input
						class="uk-input uk-form-success uk-form-width-medium cartCount"
						type="text" placeholder="form-success"
						value="총 ${totalCount}개의 장바구니 항목이 있습니다">
					<div class="chkAll">
						<label> <input type="checkbox" name="allCheck"
							id="allCheck" class="uk-checkbox"> &nbsp;&nbsp;모두선택
						</label>
					</div>
					<div class="selDel">
						<button type="button" id="delBtn"
							class="uk-button uk-button-danger reviewDelete-btn">선택삭제</button>
					</div>

					<c:forEach var="dto" items="${list}" varStatus="status">
						<ul
							class="uk-grid-small uk-child-width-1-2 uk-child-width-1-4@s uk-text-center"
							uk-sortable="handle: .uk-card" uk-grid>
							<li>
								<div
									class="cartCard_wrapper uk-card uk-card-default uk-card-hover uk-card-body">
									<button class="cartClose_btn uk-close-large" type="button"
										uk-close
										onclick="location.href='delete.do?cnum=${dto.num}&unum=${loginInfo.num }'"></button>
									<label> <input type="checkbox" name="chkBox"
										class="uk-checkbox chkBox" data-num="${dto.num}"> <img
										src="../../save/${dto.mainimage}" class="cartImage">
										<p class="cartPtag uk-card-title">
											${dto.menuname}<br> ￦
											<fmt:formatNumber value="${dto.mprice }" pattern="#,###" />
										</p>
									</label>
									<table class="cartTable">
										<tr class="cartitem">
											<td class="countTd"
												style="border: 0px solid green; margin-top: 25px;">
												<div class="count">
													<!-- <span uk-icon="minus-circle" class="minus"></span> -->
													<img src="${root}/image/menu-minus.png" class="minus"
														style="width: 35px;"> <input type="hidden"
														name="num" value="${dto.num}" /> <span class="mcount"
														data-num="${dto.num}" style="font-size: 20pt;">${dto.mcount }</span>
													<!-- <span uk-icon="plus-circle" class="plus"></span> -->
													<img src="${root}/image/menu-plus.png" class="plus"
														style="width: 35px;">
												</div>
											</td>
										</tr>
										<tr>
											<td class="mtotalprice" data-mnum="${dto.mnum}">메뉴 개별 총
												가격 :￦<fmt:formatNumber value="${dto.mtotalprice}"
													pattern="#,###" />
											</td>
										</tr>
									</table>
								</div>
							</li>
						</ul>
					</c:forEach>

					<div class="totalBox_wrapper uk-flex">
						<div class="totalBoxBack uk-card uk-card-default uk-card-body">
							<h3
								style="color: white; font-size: 20pt; margin-left: 130px; border: 0px white solid;">계산
								영수증</h3>
							<p>
								장바구니 총 상품갯수 : <b class="cartBtag">${mytotalCount}개</b><br>
								장바구니 총 금액 : <b class="cartBtag">￦<fmt:formatNumber
										value="${mytotalPrice}" pattern="#,###" /></b>
							</p>

							<div class="cartBtn_div">
								<button type="button"
									class="cartBtn uk-button uk-button-primary"
									onclick="location.href='${root}/main/menu/list.do'">메뉴추가하기</button>
								<button type="button"
									class="cartBtn uk-button uk-button-primary"
									onclick="location.href='${root}/main/order/orderform.do'">결제하러가기</button>
							</div>
						</div>
					</div>


				</c:otherwise>
			</c:choose>
		</div>

	</div>
	<script type="text/javascript">
		//가격에 콤마찍어줌
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		//수량 조절
		$(function() {
			$(".plus")
					.click(
							function() {
								var mcount = $(this).parent('div.count')
										.children('span.mcount');
								var mtotalprice = $(this).parents(
										'table.cartTable').find(
										'td.mtotalprice');
								var num = mcount.data("num");
								var mnum = mtotalprice.data("mnum");
								//console.log(mnum);

								$
										.ajax({
											type : 'get',
											url : "updateplus.aj",
											data : {
												"num" : num,
												"mnum" : mnum
											},
											dataType : "text",
											success : function(redata) {
												var result = JSON.parse(redata);
												//console.log(result.mcount);
												//console.log(result.mtotalprice);

												mcount.text(result.mcount);
												mtotalprice
														.text("메뉴 개별 총 가격 : ￦"
																+ numberWithCommas(result.mtotalprice));
											},
											error : function(err) {
												alert("errorcode:" + err.status
														+ "message:"
														+ err.responseText);
											}
										});
							});
			$(".minus")
					.click(
							function() {
								var mcount = $(this).parent('div.count')
										.children('span.mcount');
								var mtotalprice = $(this).parents(
										'table.cartTable').find(
										'td.mtotalprice');
								var num = mcount.data("num");
								var mnum = mtotalprice.data("mnum");
								var mcountnum = parseInt(mcount.text());
								//console.log(mcountnum);

								if (mcountnum > 1) {
									$
											.ajax({
												type : 'get',
												url : "updateminus.aj",
												data : {
													"num" : num,
													"mnum" : mnum
												},
												dataType : "text",
												success : function(redata) {
													var result = JSON
															.parse(redata);

													mcount.text(result.mcount);
													//mtotalprice.text("메뉴 개별 총 가격 :￦"+result.mtotalprice);
													mtotalprice
															.text("메뉴 개별 총 가격 : ￦"
																	+ numberWithCommas(result.mtotalprice));
												},
												error : function(err) {
													alert("errorcode:"
															+ err.status
															+ "message:"
															+ err.responseText);
												}
											});
								} else {
									return;
								}

							});
		});

		//전체선택체크하면 모두 선택되는거
		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chkBox").prop("checked", true);
			} else {
				$(".chkBox").prop("checked", false);
			}
		});
		//개별체크를 하나라도 해제하면 전체선택이 체크해제됨
		$(".chkBox").click(function() {
			$("#allCheck").prop("checked", false);
		});
	</script>
</body>
</html>