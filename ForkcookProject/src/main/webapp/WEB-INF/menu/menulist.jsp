<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="<%=request.getContextPath() %>" />

<!-- TODO : CSS는 추후에 UI kit에 맞게 다시 재배열 -->
<!-- TODO : 메뉴에 마우스 오버시 장바구니/상세보기 나오게 하기 -->

<div class="fk-center">
	<hr class="uk-divider-small vertical">
	<div class="fk-heading">메뉴 소개</div>
	<p class="fk-mini-heading">차별화된 신선함과 풍성한 맛을 느낄 수 있는 포크쿡 메뉴들 </p>
	<hr class="uk-divider-icon">
</div>

<ul class="uk-subnav uk-subnav-pill" uk-switcher="animation: uk-animation-fade">
    <li><a href="#">전체</a></li>
    <li><a href="#">피자</a></li>
    <li><a href="#">파스타</a></li>
    <li><a href="#">스테이크</a></li>
    <li><a href="#">샐러드</a></li>
    <li><a href="#">디저트</a></li>
    <li><a href="#">음료수</a></li>
</ul>

<ul class="uk-switcher uk-margin">
    <li>
    	<!-- 전체 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
			<div class="card" style="width: 20rem;">
				<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
				<div class="card-body">
					<h4 class="card-title">${mdto.name}</h4>
					<p class="card-text">${mdto.shortmsg}</p>
					<a href="${root}/main/menu/detail.do?num=${mdto.num}"
						class="btn btn-primary">자세히 보기&rarr;</a>
				</div>
			</div>
			<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
			<br>
		</c:forEach>
    </li>
    <li>
    	<!-- 피자 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '피자'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
    <li>
    	<!-- 파스타 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '파스타'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
    <li>
    	<!-- 스테이크 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '스테이크'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
    <li>
    	<!-- 샐러드 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '샐러드'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
    <li>
    	<!-- 디저트 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '디저트'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
    <li>
    	<!-- 음료 목록 출력 -->
    	<c:forEach var="mdto" items="${list}">
    		<c:if test="${mdto.category == '음료'}">
				<div class="card" style="width: 20rem;">
					<img class="card-img-top" src="../../save/${mdto.mainimage}" alt="Card image cap">
					<div class="card-body">
						<h4 class="card-title">${mdto.name}</h4>
						<p class="card-text">${mdto.shortmsg}</p>
						<a href="${root}/main/menu/detail.do?num=${mdto.num}"
							class="btn btn-primary">자세히 보기&rarr;</a>
					</div>
				</div>
				<c:choose>
					<c:when test="${not empty loginInfo}">
						<button type="button" class="intoCart-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
						<button type="button" class="goOrder-btn"
							onclick="location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="intoCart-btn" onclick="alert('먼저 로그인 해주세요')">장바구니담기</button>
						<button type="button" class="goOrder-btn" onclick="alert('먼저 로그인 해주세요')">바로주문하기</button>
					</c:otherwise>
				</c:choose>
				<br>
			</c:if>
		</c:forEach>
    </li>
</ul>