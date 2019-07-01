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
<form action="menudetail.do" method="post">
    <table style="width: 400px;" class="table table-bordered">
    <caption><b>메뉴 상세보기</b></caption>
    <tr>
		num : ${dto.num}<br>
		name : ${dto.name}<br>
		category : ${dto.category}<br>  
		persons : ${dto.persons}<br>
		price : ${dto.price}<br>
		image : ${dto.image}<br>
		rate : ${dto.rate}<br>
		shortmsg : ${dto.shortmsg}<br>
		longmsg : ${dto.longmsg}<br>
		<br><br><hr><br><br>
    </tr>
    
    <tr>
      <td colspan="2">
      <img src="/image/03.png" width="50px;">
      <div style="width: 380px; height: 130px;"
      name="content" class="form-control"></div>
      </td>
    </tr>   
    
    <tr>
      <td colspan="2" align="right">     
      <button type="button" style="width: 100px;"
        class="btn btn-basic btn-sm"
        onclick="location.href='${root}/menu/review.do'">리뷰보기</button>	
        <button type="button" style="width: 100px; margin-left: 175px;"
        class="btn btn-basic btn-sm"
        onclick="history.back()">닫 기</button>		
      </td>
    </tr> 
    
    
    </table>
</form>
</body>
</html>