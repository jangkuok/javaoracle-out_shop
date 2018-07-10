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
			${reviewList.reviewNo}
		</c:forEach>
	</c:if>
</div>
</body>
</html>