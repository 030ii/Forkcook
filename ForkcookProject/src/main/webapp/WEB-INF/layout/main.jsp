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
<div class="uk-position-relative uk-visible-toggle uk-light" tabindex="-1" uk-slideshow>

   <ul class="uk-slideshow-items">
       <li>
           <img src="${root}/image/maindish.png" alt="" uk-cover>
       </li>
       <li>
           <img src="${root}/image/main2.jpg" alt="" uk-cover>
       </li>
       <li>
           <img src="${root}/image/main3.jpg" alt="" uk-cover>
       </li>
   </ul>

   <a class="uk-slidenav-large uk-position-center-left uk-position-small uk-hidden-hover" href="#" uk-slidenav-previous uk-slideshow-item="previous"></a>
   <a class="uk-slidenav-large uk-position-center-right uk-position-small uk-hidden-hover" href="#" uk-slidenav-next uk-slideshow-item="next"></a>

</div>
</body>
</html>
