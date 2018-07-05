<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<title>OUTSHOP</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/bootstrap/css/modern-business.css" rel="stylesheet">
	

</head>
<body>
   <tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="content"/>

    <tiles:insertAttribute name="footer" />
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>