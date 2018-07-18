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
<!-- jQurey -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.textTrans{
	background-color:transparent;
	border:0 solid black;
}
.my-hr3 {
   border: 0;
   height: 3px;
   background: #ccc;
}
  
a:link { color: black; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { color: black; text-decoration: underline;}

.cardBox { box-shadow: 3px 3px 2px #aaaaaa; }

.ulCenter {
  width: 200px;
  margin-left: auto;
  margin-right: auto;
}

.hrStyle{
  border-top: 3px double #8c8b8b;
}
</style>
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