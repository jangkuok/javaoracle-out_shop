<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<h1>SALES RATE</h1><hr>
</div>
	<p style="text-align: center;">
		<img class="img-rounded" src="<c:url value='/image/graph/${graph}'/>"/>
	</p>
</div>

</body>
</html>