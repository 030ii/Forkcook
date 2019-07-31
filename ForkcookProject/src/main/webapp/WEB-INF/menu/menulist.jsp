<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="root" value="<%=request.getContextPath() %>" />

<div class="fk-center">
	<div class="menuHeading">포크쿡 메뉴 소개</div>
	<p class="menu-mini-heading">차별화된 신선함과 풍성한 맛을 느낄 수 있는 포크쿡 메뉴들 </p>
	<hr class="uk-divider-icon">
</div>

<ul class="menuList_ul uk-subnav uk-subnav-pill" uk-switcher="animation: uk-animation-fade">
    <li class="menulist_li"><a href="#" class="menulist_aTag">전체</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">피자</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">파스타</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">스테이크</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">샐러드</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">디저트</a></li>
    <li class="menulist_li"><a href="#" class="menulist_aTag">음료</a></li>
</ul>
<br>

<ul class="uk-switcher uk-margin">
  <!-- 전체 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<c:choose>
			            		<c:when test="${mdto.category == '피자' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #f0506e;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		<c:when test="${mdto.category == '파스타' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #faa05a;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		<c:when test="${mdto.category == '스테이크' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #F4D603;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		<c:when test="${mdto.category == '샐러드' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #32d296;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		<c:when test="${mdto.category == '디저트' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #1e87f0;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		<c:when test="${mdto.category == '음료' }">
				            		<span class="uk-label" style="font-size: 9pt;background-color: #DA27FF;">
				            		<b>${mdto.category}</b></span>
			            		</c:when>
			            		</c:choose>
			            	
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			</c:forEach>
		</div>
	</li>
  <!-- 피자 목록 출력 -->
 	<li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		   	 <c:if test="${mdto.category == '피자'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #f0506e;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			  </c:if>
			</c:forEach>
		</div>
	</li>
  <!-- 파스타 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		     <c:if test="${mdto.category == '파스타'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #faa05a;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			   </c:if>
			</c:forEach>
		</div>
	</li>
  <!-- 스테이크 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		     <c:if test="${mdto.category == '스테이크'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #F4D603;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			   </c:if>
			</c:forEach>
		</div>
	</li>
  <!-- 샐러드 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		   	  <c:if test="${mdto.category == '샐러드'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #32d296;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			  </c:if>
			</c:forEach>
		</div>
	</li>
  <!-- 디저트 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		     <c:if test="${mdto.category == '디저트'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #1e87f0;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			  </c:if>
			</c:forEach>
		</div>
	</li>
  <!-- 음료 목록 출력 -->
    <li>
	    <div class="uk-child-width-1-2@m" uk-grid>
		   <c:forEach var="mdto" items="${list}">
		     <c:if test="${mdto.category == '음료'}">
			    <div class="menulist_wrapper">
			        <div class="uk-card uk-card-default">
			            <div class="uk-card-header">
			            
				            <div class="uk-text-center">
						        <div class="uk-inline-clip uk-transition-toggle" tabindex="0">
						            <img src="../../save/${mdto.mainimage}" alt="" class="munulistImg">
						            <div class="uk-transition-slide-bottom uk-position-bottom uk-overlay uk-overlay-default">
						                <p class="uk-h4 uk-margin-remove">
											<c:choose>
												<c:when test="${not empty loginInfo}">
												<!-- 컨펌창으로 장바구니로갈지 계속 쇼핑할지 띄우기,. 에이젝스 -->
													<button type="button" class="intoCart-btn uk-button uk-button-default"
														onclick="location.href='${root}/main/cart/insertcart.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary"
														onclick="alert('상품을 장바구니에 담았습니다. 장바구니로 이동합니다.');location.href='${root}/main/cart/insert.do?unum=${loginInfo.num }&mnum=${mdto.num}&mtotalprice=${mdto.price }'">바로주문하기</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="intoCart-btn uk-button uk-button-default" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">장바구니담기</button>
													<button type="button" class="goOrder-btn uk-button uk-button-primary" onclick="alert('먼저 로그인 해주세요');location.href='${root}/main/user/login.do'">바로주문하기</button>
												</c:otherwise>
											</c:choose>
										</p>
						            </div>
						        </div>
						    </div>
					    
			            </div>
			            <div class="menulist_body uk-card-body">
			            	<span class="uk-label" style="font-size: 9pt;background-color: #DA27FF;">
			            		<b>${mdto.category }</b>
			            	</span>
			                <p style="font-size: 18pt;">${mdto.name}</p>
			                <p style="color: #999999;">
			                	<span uk-icon="icon: user"></span>${mdto.persons }
								<span uk-icon="icon: star"></span>${mdto.rate }
								<a onclick="location.href='${root}/main/menu/detail.do?num=${mdto.num}'" class="menuLink"
									style="float: right; color: #2D8BA8; font-size: 10pt;">상세보기<span uk-icon="arrow-right"></span></a>
							</p>
			            </div>
			        </div>
			    </div>
			  </c:if>
			</c:forEach>
		</div>
	</li>
</ul>