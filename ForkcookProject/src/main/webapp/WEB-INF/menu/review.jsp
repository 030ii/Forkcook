<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href="style.css"> -->
<!-- <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"> -->
<!-- bar-rating -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<!-- <link rel="stylesheet" href="/ratingstar/fontawesome-stars.css"> -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		$(".updatebtn").click(function(){
			var updateform = $(this).parents('.updatetr').find('.updateform');
			var updatespan = $(this).parents('.updatetr').find('.updatespan');
			updateform.css("display","block");
			updatespan.css("display","none");
		});
		
		$(".cancle").click(function(){
			var updateform = $(this).parents('.updatetr').find('.updateform');
			var updatespan = $(this).parents('.updatetr').find('.updatespan');
			updateform.css("display","none");
			updatespan.css("display","block");
		});
	});
</script>
<style type="text/css">
/* Rating Star Widgets Style */
.rating-stars ul {
  list-style-type:none;
  padding:0;
  
  -moz-user-select:none;
  -webkit-user-select:none;
}
.rating-stars ul > li.star {
  display:inline-block;
  
}

/* Idle State of the stars */
.rating-stars ul > li.star > i.fa {
  font-size:2.5em; /* Change the size of the stars */
  color:#ccc; /* Color on idle state */
}

/* Hover state of the stars */
.rating-stars ul > li.star.hover > i.fa {
  color:#FFCC36;
}

/* Selected state of the stars */
.rating-stars ul > li.star.selected > i.fa {
  color:#FF912C;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	  // hover 색상 바뀌기
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // 현재 커서올라간 별
	   
	    // hovere되지 않은 별에 효과 없애기
	    $(this).parent().children('li.star').each(function(e){
	      if (e < onStar) {
	        $(this).addClass('hover');
	      }
	      else {
	        $(this).removeClass('hover');
	      }
	    });
	    
	  }).on('mouseout', function(){
	    $(this).parent().children('li.star').each(function(e){
	      $(this).removeClass('hover');
	    });
	  });
	  
	  // 클릭 이벤트
	  $('#stars li').on('click', function(){
	    var onStar = parseInt($(this).data('value'), 10); // 현재 선택된 별
	    var stars = $(this).parent().children('li.star');
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
	    
	    for (i = 0; i < stars.length; i++) {
	      $(stars[i]).removeClass('selected');
	    }
	    
	    for (i = 0; i < onStar; i++) {
	      $(stars[i]).addClass('selected');
	      
	      //=>ratingValue가 1,2,3,4,5 값 중에 하나
	      //얘의 값을 form 값으로 보내야함
	    }
	  });
	});
</script>
</head>
<body>
<c:set var="root" value="<%=request.getContextPath() %>" />
리뷰보기페이지입니다
<div>총 ${totalCount}개의 리뷰가 있습니다</div>
<hr>
등록폼<br>
<form action="insert.do" method="post" class="form-inline" enctype="multipart/form-data">
	<div class="addReview">
		평점 : 
			<section class='rating-widget'>
			  <div class='rating-stars text-center'>
			    <ul id='stars'>
			      <li class='star' title='Poor' data-value='1'>
			        <i class='fa fa-star fa-fw'></i>
			      </li>
			      <li class='star' title='Fair' data-value='2'>
			        <i class='fa fa-star fa-fw'></i>
			      </li>
			      <li class='star' title='Good' data-value='3'>
			        <i class='fa fa-star fa-fw'></i>
			      </li>
			      <li class='star' title='Excellent' data-value='4'>
			        <i class='fa fa-star fa-fw'></i>
			      </li>
			      <li class='star' title='WOW!!!' data-value='5'>
			        <i class='fa fa-star fa-fw'></i>
			      </li>
			    </ul>
			  </div>
			</section>
			<br>
		내용 : <input type="text" name="content" size="30"><br>
		사진 : <input type="file" name="upfile"><br><br>
		<input type="hidden" name="unum" value="2">
		<input type="hidden" name="mnum" value="${mnum}">
		<input type="submit" value="리뷰등록" id="add-btn">
	</div>
</form>
<hr>
<div id="reviewTable">
</div>
  <div id="reviewTable">
	<table border=1 id="listTable">
		<tr>
			<th>No.</th>
			<th>num</th>
			<th>unum</th>
			<th>mnum</th>
			<th>사진</th>
			<th>사진보기</th>
			<th>내용</th>
			<th>평점</th>
			<th>작성일</th>
			<th>관리</th>
		</tr>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<tr class="updatetr">
				<td>${status.count}</td>
				<td>${dto.num}</td>
				<td>${dto.unum}</td>
				<td>${dto.mnum}</td>
				<td>${dto.image }</td>
				
				<td>
					<c:if test="${dto.image!='noimage' }">
						<c:forTokens var="myimg" items="${dto.image }" delims=",">
							<a href="../../save/${myimg }" target="_new">
							  <img src="../../save/${myimg }" style="width: 100px;">
							</a>
						</c:forTokens>
					</c:if>
				</td>
				<td>
               		<span style="display: block;" class="updatespan">${dto.content}</span>
               		<form style="display: none;" action="update.do" method="post" class="updateform">
               			<input type="hidden" name="num" value="${dto.num}"/>
                  		<input type="hidden" name="unum" value="${dto.unum}"/>
                 		<input type="hidden" name="mnum" value="${dto.mnum}"/>
                  		<input type="text" name="rate" value="${dto.rate }"/>
                  		<input type="file" name="upfile" value="${dto.image }">
                  		<textarea rows="" cols="" name="content">${dto.content}</textarea>
                  		<button type="submit">수정</button>
                  		<button type="button" class="cancle">취소</button>
              	 	</form>
            	</td>
				<td> <span class="star-prototype">${dto.rate}</span></td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
					<!-- 해야될것 ------
						c:if -> 로그인 세션의 user num랑 dto.unum이 같으면 수정 버튼 보여지고, 다르면 안보여짐
                  		-> 삭제버튼도 같음 -->
					<button type="button" class="updatebtn">수정</button>
					<button type="button" onclick="location.href='delete.do?num=${dto.num}&mnum=${dto.mnum }'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</body>
</html>