<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<c:set var="root" value="<%=request.getContextPath() %>" />
<script type="text/javascript">
$(function() {   
   $(document).on("change","select[name='sarea']",function(){
		 var sarea = $(this).val();
		 console.log(sarea);
		 $.ajax({
			type:'get',
			url:'${root}/admin/storeuser/getSname.do',
			data:{'sarea':sarea},
			dataType:"json",
			success : function(data){
				$("select[name='snum']").html("<option value=''>지점 선택</option>");
				for(var i=0; i<data.result.length; i++){
					$("select[name='snum']").append("<option value='"+data.result[i].num+"'>"+data.result[i].name+"</option>");
				}
			},
			error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		    }
		});
  });
});
</script>
<div class="order_Allwrapper">
	<br><h5></h5>
 	<h2 style="font-size: 30pt;">&nbsp;&nbsp;&nbsp;&nbsp;결제페이지</h2>
	<div class="orderInfo_div uk-card uk-card-default uk-card-hover uk-card-body">
       <h3 class="uk-card-title">주문 정보</h3>
       <br>
		<div class="orderForm_div">	
			<ul uk-tab>
			    <li class="orderForm_li"><a href="#">현장 주문</a></li>
			    <li class="orderForm_li"><a href="#">예약 주문</a></li>
			</ul>
			<ul class="uk-switcher uk-margin">
			    <!-- 현장주문 -->
	            <li>
		            <form class="uk-form-stacked" action="ordersuccess.do" method="post">
		            	<div class="uk-margin fk-49">
					        <label class="uk-form-label" for="form-stacked-select">가맹점 지역</label>
					        <div class="uk-form-controls">
					            <select class="uk-select" name="sarea" required>
					                <option value="">지역 선택</option>
									<option value="강원">강원</option>
									<option value="경기">경기</option>
									<option value="경남">경남</option>
									<option value="경북">경북</option>
									<option value="광주">광주</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="부산">부산</option>
									<option value="서울">서울</option>
									<option value="세종">세종</option>
									<option value="울산">울산</option>
									<option value="인천">인천</option>
									<option value="전남">전남</option>
									<option value="전북">전북</option>
									<option value="제주">제주</option>
									<option value="충북">충북</option>
									<option value="충청">충청</option>
					            </select>
					    	</div>
					    </div>
						<div class="uk-margin fk-49">
					        <label class="uk-form-label" for="form-stacked-select">가맹점 지점</label>
					        <div class="uk-form-controls">
								<select class="uk-select" name="snum" required>
					                <option value="">지점 선택</option>
					            </select>
				        	</div>
					    </div>
					    <h3 class="uk-card-title fk-margin-40">결제 정보</h3>
				        <br>
						<div class="">
							<div class="uk-margin fk-20">
						        <label class="uk-form-label" for="form-stacked-text">카드 선택</label>
						        <div class="uk-form-controls">
						            <select class="uk-select" required>
						                <option value="">카드 선택</option>
										<option value="KB카드">KB카드</option>
										<option value="BC카드">BC카드</option>
										<option value="삼성카드">삼성카드</option>
										<option value="신한카드">신한카드</option>
										<option value="외환카드">외환카드</option>
										<option value="하나카드">하나카드</option>
										<option value="롯데카드">롯데카드</option>
										<option value="씨티카드">씨티카드</option>
										<option value="NH카드">NH카드</option>
										<option value="현대카드">현대카드</option>
										<option value="우리카드">우리카드</option>
									</select>
						        </div>
						    </div>
						    &nbsp;&nbsp;
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">카드 번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						        </div>
						    </div>
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">CVC 번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input" type="text" placeholder="카드 뒷면 숫자 3자리" required>
						        </div>
						    </div>
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">카드 비밀번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input" type="password" placeholder="카드 비밀번호 앞 2자리" required>
						        </div>
						    </div>
						    <br><br>
						    <input type="hidden" name="ordertype" value="A"/>
						    <button type="submit" class="uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom">결제 완료하기</button>
						</div>
					</form>
	            </li>
	            <!-- 예약주문 -->
	            <li>
					<form class="uk-form-stacked" action="ordersuccess.do" method="post">
		            	<div class="uk-margin fk-49">
					        <label class="uk-form-label" for="form-stacked-select">가맹점 지역</label>
					        <div class="uk-form-controls">
					            <select class="uk-select" name="sarea" required>
					                <option value="">지역 선택</option>
									<option value="강원">강원</option>
									<option value="경기">경기</option>
									<option value="경남">경남</option>
									<option value="경북">경북</option>
									<option value="광주">광주</option>
									<option value="대구">대구</option>
									<option value="대전">대전</option>
									<option value="부산">부산</option>
									<option value="서울">서울</option>
									<option value="세종">세종</option>
									<option value="울산">울산</option>
									<option value="인천">인천</option>
									<option value="전남">전남</option>
									<option value="전북">전북</option>
									<option value="제주">제주</option>
									<option value="충북">충북</option>
									<option value="충청">충청</option>
					            </select>
					    	</div>
					    </div>
						<div class="uk-margin fk-49">
					        <label class="uk-form-label" for="form-stacked-select">가맹점 지점</label>
					        <div class="uk-form-controls">
								<select class="uk-select" name="snum" required>
					                <option value="">지점 선택</option>
					            </select>
				        	</div>
					    </div>
					   <div class="uk-margin">
					        <label class="uk-form-label" for="form-stacked-text">방문 예정 일시</label>
					        <div class="uk-form-controls">
					            <input class="uk-input" type="datetime-local" required>
					        </div>
					    </div>
					    <h3 class="uk-card-title fk-margin-40">결제 정보</h3>
				        <br>
						<div>
							<div class="uk-margin fk-20">
						        <label class="uk-form-label" for="form-stacked-text">카드 선택</label>
						        <div class="uk-form-controls">
						            <select class="uk-select" required>
						                <option value="">카드 선택</option>
										<option value="KB카드">KB카드</option>
										<option value="BC카드">BC카드</option>
										<option value="삼성카드">삼성카드</option>
										<option value="신한카드">신한카드</option>
										<option value="외환카드">외환카드</option>
										<option value="하나카드">하나카드</option>
										<option value="롯데카드">롯데카드</option>
										<option value="씨티카드">씨티카드</option>
										<option value="NH카드">NH카드</option>
										<option value="현대카드">현대카드</option>
										<option value="우리카드">우리카드</option>
									</select>
						        </div>
						    </div>
						    &nbsp;&nbsp;
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">카드 번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						            -
						            <input class="uk-input fk-form-width-63" type="text" required>
						        </div>
						    </div>
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">CVC 번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input" type="text" placeholder="카드 뒷면 숫자 3자리" required>
						        </div>
						    </div>
						    <div class="uk-margin fk-49">
						        <label class="uk-form-label" for="form-stacked-text">카드 비밀번호</label>
						        <div class="uk-form-controls">
						            <input class="uk-input" type="password" placeholder="카드 비밀번호 앞 2자리" required>
						        </div>
						    </div>
						    <br><br>
						    <input type="hidden" name="ordertype" value="B"/>
						    <button type="submit" class="uk-button uk-button-primary uk-width-1-1 uk-margin-small-bottom">결제 완료하기</button>
						</div>
					</form>
				</li>
	        </ul>	
	    </div>
	    <div class="totalBox_wrapper uk-flex">
		    <div class="totalBoxBack uk-card uk-card-default uk-card-body">
				<h3 style="color: white;font-size: 20pt; margin-left:130px; border: 0px white solid;">계산 영수증</h3>
				<p>
					<c:forEach var="dto" items="${list}" varStatus="status">
						${dto.menuname} <b class="cartBtag">${dto.mcount}개 / ${dto.mtotalprice}원</b><br>
					</c:forEach>
					--------------------------------------------<br>
		        	장바구니 총 상품갯수 : <b class="cartBtag">${mytotalCount}개</b><br>
		        	장바구니 총 금액 : <b class="cartBtag">￦<fmt:formatNumber value="${mytotalPrice}" pattern="#,###" /></b>
		        </p>
				<div class="cartBtn_div">
					<button type="button" class="cartBtn uk-button uk-button-primary"
						onclick="location.href='${root}/main/menu/list.do'">메뉴 추가하기</button>
					<button type="button" class="cartBtn uk-button uk-button-primary"
						onclick="history.back()">결제취소하기</button>
				</div>
			</div>
		</div> 
	</div>
</div>