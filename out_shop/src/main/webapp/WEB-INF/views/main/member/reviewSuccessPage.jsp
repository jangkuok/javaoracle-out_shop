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
<h1>REVIEW WRTIE</h1><hr>
</div>
<%-- 	<div class="row">
  	   <div class="col-lg-1">
         <a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${param.review.outerNo}">
          	<img class="card-img-top" src="<c:url value='/image/${param.review.outer.imageName}.jpg'/>" alt="">
         	  </a>
       </div>	              
       <div class="col-lg-9">
         <h2>★★★★★</h2>
         <p>${param.review.reviewDate}</p>
         <p>${param.review.content}</p>
         <a class="btn" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${param.review.outerNo}">상품 상세보기</a>
       </div>
       <div class="col-lg-2">
         <p>아이디 : ${param.review.memberId}</p>
         <c:if test="${param.review.pictureName != ''}">
         	<img class="card-img-top" src="<c:url value='/image/${param.review.pictureName}.jpg'/>" alt="">
         </c:if>
       </div>
	 </div>
 --%>
</div>
</body>
</html>