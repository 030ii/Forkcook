<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.storeDetail-card {
	margin-top: 30px;
    width: 706px;
    margin-left:0;
}
.storeDetail-card pre{
	border:0;
}
</style>

<c:set var="root" value="<%=request.getContextPath()%>" />
<div class="adminOrder_wrapper">
  <div class="storeDetail-card uk-card uk-card-default uk-card-body uk-width-1-2@m">
	<h3 class="uk-card-title">${dto.name}</h3>
	<table class="adminOrderUserInfo uk-table uk-table-responsive uk-table-divider">
		<tr>
			<td colspan="2"><img src="../../save/${dto.mainimage}" style="width: 100%;"><td>
		</tr>
		<tr>
			<th>매장명</th>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<th>매장 주소</th>
			<td>${dto.addr}</td>
		</tr>
		<tr>
			<th>매장 전화</th>
			<td>${dto.phone}</td>
		</tr>
		<tr>
			<th>운영시간</th>
			<td>${dto.opertime}</td>
		</tr>
		<tr>
			<th>매장 소개</th>
			<td>${dto.shortmsg}</td>
		</tr>
		<tr>
			<td colspan="2"><pre>${dto.longmsg}</pre></td>
		</tr>
		<tr>
			<td colspan="2"><img src="../../save/${dto.mapimage}" style="width: 100%;"><td>
		</tr>
	</table>
  </div>
  	<hr style="border: 0.5px black solid;">
	
  <div class="adminOrderBtn_div">
	<button type="button" class="fk-btn" onclick="history.back()"><span uk-icon="icon: menu"></span> 목록</button>
	<button type="button" class="fk-btn" onclick="location.href='${root}/main/partner/partnerqna.do'"><span uk-icon="icon: commenting"></span> 매장에 문의하기</button>
  	<button type="button" class="fk-btn" onclick="location.href='${root}/main/menu/list.do'"><span uk-icon="icon: cart"></span> 매장에 주문하기</button>
  </div>
</div>