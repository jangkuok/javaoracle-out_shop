<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	//리뷰 삭제	
	$('input[name="reviewNo"]').each(function(){
		
		var no = $(this).val();
		
		$("#removeButton_"+no).click(function() {
			if(confirm('게시물을 삭제 하시겠습니까?')) { 
				
		    }else { 
		    	return false;
		   	}	
		});
	});
});
</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>MY REVIEW</h1><hr class="hrStyle">
</div>
	<c:if test="${empty list}">
	<center>
		<div>
			작성된 리뷰가 없습니다.
		</div>
	</center>
	</c:if>	
	<c:if test="${not empty list}">
		<c:forEach var="reviewList" items="${list}" varStatus="st" >
		  <div class="row">
		  	<div class="col-lg-1">
	          <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${reviewList.outerNo}">
            	<img class="card-img-top" src="<c:url value='/image/${reviewList.outer.imageName}'/>" alt="">
           	  </a>
	        </div>	              
	        <div class="col-lg-9">
	        	<c:if test="${reviewList.star == 1}">
	        		<h2>★☆☆☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 2}">
	        		<h2>★★☆☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 3}">
	        		<h2>★★★☆☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 4}">
	        		<h2>★★★★☆</h2>
	        	</c:if>
	        	<c:if test="${reviewList.star == 5}">
	        		<h2>★★★★★</h2>
	        	</c:if>          
	          <h5>${reviewList.subject} (${reviewList.reviewDate})</h5>
	          <p>${reviewList.content}</p>
	          <input type="hidden" id="reviewNo_${reviewList.reviewNo}" name="reviewNo" value="${reviewList.reviewNo}">
	          <a style="color:white;" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${reviewList.outerNo}" class="btn btn-primary" >상품 상세보기</a>
	          <a style="color:white;" href="${pageContext.request.contextPath}/member/modifyReviewPage.do?reviewNo=${reviewList.reviewNo}" class="btn btn-primary">수정하기</a>
	          <a style="color:white;" id="removeButton_${reviewList.reviewNo}" href="${pageContext.request.contextPath}/member/removeMemberReview.do?reviewNo=${reviewList.reviewNo}" class="btn btn-primary">삭제하기</a>
	        </div>
	        <div class="col-lg-2">
	          <p>아이디 : ${reviewList.memberId}</p>
	          <img class="card-img-top" src="<c:url value='/image/${reviewList.pictureName}'/>" alt="">
	        </div>
	      </div>
	      <hr>
		</c:forEach>
	</c:if>
</div>
</body>
</html>