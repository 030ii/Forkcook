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

<div class="order_Allwrapper">
	<br>
	 <hr class="orderHr">
	  <h2 style="font-size: 30pt;">&nbsp;&nbsp;&nbsp;&nbsp;결제페이지</h2>
	 <hr class="orderHr"><br>
  
	<div class="orderInfo_div uk-card uk-card-default uk-card-hover uk-card-body">
       <h3 class="uk-card-title">결제정보</h3>
       
		<div uk-grid class="orderForm_div">
			<div class="uk-width-small@m">
		        <ul class="uk-nav uk-nav-default" uk-switcher="connect: #component-nav; animation: uk-animation-fade">
		            <li class="orderForm_li"><a href="#">현장주문</a></li>
		            <li class="orderForm_li"><a href="#">예약주문</a></li>
		        </ul>
		    </div>
			<div class="uk-width-expand@m">
				<br><br>
		        <ul id="component-nav" class="uk-switcher">
		        	<!-- 현장주문 -->
		            <li>
						<div class="orderSelect_div uk-margin">
						        <div uk-form-custom="target: > * > span:first-child">
						            <select>
						                <option value="">매장선택</option>
						                <option value="1">Option 01</option>
						                <option value="2">Option 02</option>
						                <option value="3">Option 03</option>
						                <option value="4">Option 04</option>
						            </select>
						            <button class="uk-button uk-button-default" type="button" tabindex="-1">
						                <span></span>
						                <span uk-icon="icon: chevron-down"></span>
						            </button>
						        </div>
						    </div>
		            </li>
		            <!-- 예약주문 -->
		            <li>
						<form action="" method="get">
							
							<div class="orderSelect_div uk-margin">
						        <div uk-form-custom="target: > * > span:first-child">
						            <select>
						                <option value="">매장선택</option>
						                <option value="1">Option 01</option>
						                <option value="2">Option 02</option>
						                <option value="3">Option 03</option>
						                <option value="4">Option 04</option>
						            </select>
						            <button class="uk-button uk-button-default" type="button" tabindex="-1">
						                <span></span>
						                <span uk-icon="icon: chevron-down"></span>
						            </button>
						        </div>
						    
		    
							방문날짜 <input type="text" name="date" size="25" placeholder="나중에 날짜선택 select로 변경"><br>
							방문시간 <input type="text" name="time" size="25"><br>
							</div>
						</form>
					</li>
		        </ul>
		    </div>
		</div>
       
       
	       ---------------------------------<br>
			주문할메뉴(db에서 불러오기)<br>
			메뉴 : <br>
			수량 : <br>
			가격 :<br>
			총가격 : <br>
			---------------------------------
			
			<form action="" method="get">
		       	---결제정보---<br>
				카드사 : <select></select><br>
				카드번호 : <input type="text" name="pay" size="25">
				<input type="submit" value="결제하기">
			</form>
    </div>
    
	<!-- 일단 페이지만 이동되도록 넣어놓은 버튼 -->
	<button type="button" onclick="location.href='${root}/main/order/ordersuccess.do'">결제 완료</button>
</div>
</body>
</html>