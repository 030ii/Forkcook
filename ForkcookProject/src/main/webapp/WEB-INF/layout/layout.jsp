<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script> 
<link href="https://fonts.googleapis.com/css?family=Cute+Font" rel="stylesheet">
<style type="text/css">
	div.layout{
		border: 0px solid gray; 
		position: absolute;
		font-family: 'Cute Font';
	}
	#top{
		text-align: center;
		font-size: 35pt;
		width: 100%;
	}
	
	#leftmenu{
		left: 20px;
		top: 100px;
		width:200px;
		height:450px;
		text-align: center;
		font-size: 20pt;
	}
	#main{
		left: 250px;
		top: 100px;
		width:1000px;
		height:450px;		
		font-size: 20pt;
	}
	#bottom{
		text-align: center;
		font-size: 35pt;
		width: 100%;
		top:570px;
	}
	
	a:link{color: black; text-decoration: none;}
	a:HOVER {
		color: gray; text-decoration: underline; 
		font-weight: bold; cursor: pointer;
	}	
</style>
</head>
<body>
<div id="top" class="layout">
	<tiles:insertAttribute name="top"/>
</div>
<div id="leftmenu" class="layout">
	<tiles:insertAttribute name="leftmenu"/>
</div>
<div id="main" class="layout">
	<tiles:insertAttribute name="main"/>
</div>
<div id="bottom" class="layout">
	<tiles:insertAttribute name="bottom"/>
</div>

</body>
</html>
