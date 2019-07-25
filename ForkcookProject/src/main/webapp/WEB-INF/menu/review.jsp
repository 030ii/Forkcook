<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function(){
		$(".updatebtn").click(function(){
			var updateform = $(this).parents('.updatetr').find('.updateform');
			var updatespan = $(this).parents('.updatetr').find('.updatespan');
			var updateform2 = $(this).parents('.updatetr').find('.updateform');
			
			$('.updateform').css("display","none");
			updateform.css("display","block");
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
//등록폼의 별점
$(document).ready(function(){
	  $('#stars li').on('mouseover', function(){
	    var onStar = parseInt($(this).data('value'), 10); // 현재 커서올라간 별
	   
	    // hover 효과
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
	    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10); // 이전 선택된 별
	    
	    for (i = 0; i < stars.length; i++) { // 이전 선택한 별 css 제거
	      $(stars[i]).removeClass('selected');
	    }
	    for (i = 0; i < onStar; i++) { // 현재 선택한 별 css 추가
	      $(stars[i]).addClass('selected');
	    }
	    
	    $('#insertRate').val(onStar); // input hidden으로 선택한 별점 보내기
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

<a class="uk-button uk-button-default" href="#modal-sections" uk-toggle>리뷰작성하기</a>

<div id="modal-sections" uk-modal>
    <div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">리뷰 작성</h2>
        </div>
        <form action="insert.do" method="post" class="form-inline" name="insertForm" enctype="multipart/form-data">
	        <div class="uk-modal-body">
				<div class="addReview">
					평점 : 
					<section class='rating-widget'>
					  <div class='rating-stars text-center'>
					    <ul id='stars'>
					      <li class='star' title='1점' data-value='1'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star' title='2점' data-value='2'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star' title='3점' data-value='3'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star' title='4점' data-value='4'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					      <li class='star' title='5점' data-value='5'>
					        <i class='fa fa-star fa-fw'></i>
					      </li>
					    </ul>
					  </div>
					</section>
					<br>
					내용 : <input type="text" name="content" size="30"><br>
					사진 : <input type="file" name="upfile"><br><br>
					<input type="hidden" name="unum" value="${loginInfo.num }">
					<input type="hidden" name="mnum" value="${mnum}">
					<input type="hidden" name="rate" id="insertRate">
				</div>
			</div>
	        <div class="uk-modal-footer uk-text-right">
	            <button class="uk-button uk-button-default uk-modal-close" type="button">취소</button>
	            <input type="submit" value="리뷰등록" id="add-btn" class="uk-button uk-button-primary" type="button">
	        </div>
        </form>
    </div>
</div>



<hr>
	<a>이미지 모아보기>></a>(나중에 클릭하면 이미지들만 크게 보이도록)<br>
	
	<c:forEach var="dto" items="${list}" varStatus="status">
		<c:if test="${dto.image!='noimage' }">
			<c:forTokens var="myimg" items="${dto.image }" delims=",">
				<a href="../../save/${myimg }" target="_new">
				  <img src="../../save/${myimg }" style="width: 100px;">
				</a>
			</c:forTokens>
		</c:if>
	</c:forEach>
	
<hr>
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
					<!-- 수정폼(배치는 나중에 정리하기) -->
               		<span style="display: block;" class="updatespan">${dto.content}</span>
               		<form style="display: none;" action="update.do" method="post" class="updateform">
               			<input type="hidden" name="num" value="${dto.num}"/>
                  		<input type="hidden" name="unum" value="${dto.unum}"/>
                 		<input type="hidden" name="mnum" value="${dto.mnum}"/>
                 		<input type="text" name="rate" value="${dto.rate }">
                  		<input type="file" name="upfile" value="${dto.image }">
                  		<textarea rows="" cols="" name="content">${dto.content}</textarea>
                  		<button type="submit" class="update-cfm">수정</button>
                  		<button type="button" class="cancle">취소</button>
              	 	</form>
            	</td>
				<td>
					<span class="star-prototype" id="spanstar">
							<c:forEach var="i" begin="1" end="${dto.rate }">
								<img src='${root}/image/star10.png'>
							</c:forEach>
							(<fmt:formatNumber value="${dto.rate}" pattern="0"/>)
					</span>
				</td>
				<td><fmt:formatDate value="${dto.writeday }" pattern="MM-dd HH:mm"/></td>
				<td>
        			<c:if test="${not empty loginInfo && loginInfo.num == dto.unum}">
       					<button type="button" class="updatebtn">수정</button>
						<button type="button" onclick="location.href='delete.do?num=${dto.num}&unum=${loginInfo.num }&mnum=${dto.mnum }'">삭제</button>
       				</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</body>
</html>