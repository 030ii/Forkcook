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
<div class="uk-position-relative uk-visible-toggle uk-light mainBig_div" tabindex="-1" uk-slideshow>
   <ul class="uk-slideshow-items mainImg1">
	   <li>
		<img src="${root}/image/maindish.png" alt="" uk-cover uk-img="target: !.uk-slideshow-items" class="mainImg">
       </li>
       <li>
           <img src="${root}/image/main2.jpg" alt="" uk-cover uk-img="target: !.uk-slideshow-items" class="mainImg">
       </li>
       <li>
           <img src="${root}/image/main3.jpg" alt="" uk-cover uk-img="target: !.uk-slideshow-items" class="mainImg">
       </li>
   </ul>
  <div class="uk-position-bottom-center uk-position-small">
      <ul class="uk-dotnav">
         <li uk-slideshow-item="0"><a href="#">Item 1</a></li>
         <li uk-slideshow-item="1"><a href="#">Item 2</a></li>
         <li uk-slideshow-item="2"><a href="#">Item 3</a></li>
      </ul>
  </div>
   <a class="main-Atag uk-slidenav-large uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
   <a class="main-Atag uk-slidenav-large uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>
</div>

<div class="mainBig_div2">
    <img src="${root}/image/imsi1.png" class="mainImg2">
</div>

<div class="mainMenuList_wrapper uk-flex uk-flex-wrap uk-flex-wrap-around uk-background-muted uk-height-medium">
	<div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m1_pizza.png" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">피자</span>
    	</div>
	</div>
    <div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m2_pasta.png" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">파스타</span>
    	</div>
	</div>
	<div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m3_steak.png" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">스테이크</span>
    	</div>
	</div>
	<div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m4_salad.png" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">샐러드</span>
    	</div>
	</div>
	<div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m5_dessert.PNG" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">디저트</span>
    	</div>
	</div>
	<div class="mainMenuList_smallWrapper uk-width-1-3 uk-card uk-card-default uk-card-body uk-card-small">
		<div class="uk-text-center">
	        <div class="mainFood_div uk-inline-clip uk-transition-toggle" tabindex="0">
	            <img src="${root}/image/m6_drink.png" class="foodListImg uk-transition-scale-up uk-transition-opaque" alt="">
	        </div><br>
        	<span class="uk-label mainLabel">음료</span>
    	</div>
	</div>
</div>
</body>
</html>
