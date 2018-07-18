<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>리뷰 등록 완료</title>
</head>
<script type="text/javascript">
//새로고침 뒤로가기 방지 javascript
document.onkeydown = function(e){
    key = (e) ? e.keyCode : event.keyCode;
    if(key==8 || key==116){
       if(e){
          e.preventDefault();
       }
       else{
          event.keyCode = 0;
          event.returnValue = false;
       }
    }
};
</script>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>REVIEW WRTIE</h1><hr class="hrStyle">
</div>
	<div class="row">
        <div class="col-lg-12 mb-6" style="margin:auto;">
          <div class="card h-100">
            <h4 class="card-header">리뷰 작성이 완료되었습니다.</h4>
            <div class="card-body">
			 	<div class="row">
			  	   <div class="col-lg-1">
			         <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${review.outerNo}">
			          	<img class="card-img-top" src="<c:url value='/image/${review.outer.imageName}'/>" alt="">
			         	  </a>
			       </div>	              
			       <div class="col-lg-9">
			       	 <c:if test="${review.star == 1}">
			       		<h2>★☆☆☆☆</h2>
			         </c:if>
			       	 <c:if test="${review.star == 2}">
			       		<h2>★★☆☆☆</h2>
			       	 </c:if>
			       	 <c:if test="${review.star == 3}">
			       		<h2>★★★☆☆</h2>
			       	 </c:if>
			       	 <c:if test="${review.star == 4}">
			       		<h2>★★★★☆</h2>
			       	 </c:if>
			       	 <c:if test="${review.star == 5}">
			       		<h2>★★★★★</h2>
			       	 </c:if> 
			         <p>${review.reviewDate}</p>
			         <p>${review.content}</p>
			         <a style="color:white;" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${review.outerNo}" class="btn btn-primary" >상품 상세보기</a>
			       </div>
			       <div class="col-lg-2">
			         <p>아이디 : ${review.memberId}</p>
			         <c:if test="${review.pictureName != ''}">
			         	<img class="card-img-top" src="<c:url value='/image/${review.pictureName}.jpg'/>" alt="">
			         </c:if>
			       </div>
				 </div>
            </div>
            <div class="card-footer" style="text-align:center;">
            	<a style="color:white;" href="${pageContext.request.contextPath}/" class="btn btn-dark">홈으로</a>          	      	
            </div>
          </div>
        </div>
	</div>
	

</div>
</body>
</html>