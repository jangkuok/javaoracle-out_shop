<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>REVIEW</h1><hr>
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
            	<img class="card-img-top" src="<c:url value='/image/1530592840356.jpg'/>" alt="">
           	  </a>
	        </div>	              
	        <div class="col-lg-9">
	          <h2>★★★★★</h2>
	          <p>${reviewList.reviewDate}</p>
	          <p>${reviewList.content}</p>
	          <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${reviewList.outerNo}" class="btn btn-primary" >상품 상세보기</a>
	          <a href="${pageContext.request.contextPath}/member/modifyReviewPage.do?reviewNo=${reviewList.reviewNo}" class="btn btn-primary">수정하기</a>
	        </div>
	        <div class="col-lg-2">
	          <p>아이디 : ${reviewList.memberId}</p>
	          <img class="card-img-top" src="<c:url value='/image/1530592840356.jpg'/>" alt="">
	        </div>
	      </div>
	      <hr>
		</c:forEach>
	</c:if>
</div>
</body>
</html>