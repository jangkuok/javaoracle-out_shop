<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>REVIEW 작성</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#addButton").click(function() {
		if(confirm('등록 하시겠습니까?')) { 
			$('#reviewForm').submit();
	    }else { 
	    	return;
	   	}
		
	});
});
</script>
<style>
.errMsg 
{ 
	font-size:1em; 
  	color:red;
}
</style>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>REVIEW WRTIE</h1><hr class="hrStyle">
</div>
	<form id="reviewForm" name="reviewForm" method="post" 
		action="${pageContext.request.contextPath}/member/addMemberReview.do" enctype="multipart/form-data">
		<table class="table table-bordered">
		  <thead>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">제목</th>
		      <td>
		       	 <div class="row">
			      	 <div class="col-sm-5">
			      		<input type="text" class="form-control" name="subject" size="25" value="${reviewVo.subject}"/>
			      	 </div>
		      	 </div>
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">상품</th>
		      <td>
		       	 <div class="row">
			      	 <div class="col-sm-5">
			      		<input class="form-control" size="25" value="${param.outerName}" readonly="readonly" disabled="disabled"/>
			      		<input type="hidden" class="form-control" name="outerNo" value="${param.outerNo}"/>
			      	 </div>
		      	 </div>
		      </td> 
		    </tr>		     
		    <tr>
		      <th scope="row">사진</th>
		      <td>	
		      	  <div class="row">
			      	<div class="col-sm-8">		      
		      			<input type="file" name="imageFile" value="사진등록" accept=".jpg, .jpeg, .png"/>
					</div>
				  </div> 		      							
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">별점</th>
		      <td>
		      	  <div class="row">
			      	<div class="col-sm-10">
			      		<c:forEach begin="1" end="5" step="1" varStatus="st">
				      		<div class="radio" style="float:left;margin-right:10px;">
					     	 	 <input type="radio" name="star" value="${st.count}"/> ${st.count}
					     	</div>
			      		</c:forEach> 
					</div>
				  </div> 		      					
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">내용</th>
		      <td>
		      	  <div class="row">
			      	<div class="col-sm-10">
			      		<textarea class="form-control" name="content" >${reviewVo.content}</textarea>
		    	    </div>
		    	   </div>
		      </td>
		    </tr>		    		    
		  </tbody>
		</table>
			<input type="hidden" name="memberId" id="memberId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}"/>				
		<input type="submit" class="btn btn-dark"  value="등록"> <!-- id="addButton" -->
		<input type="reset" class="btn" id="reset" value="초기화">	
	</form>	
</div>
</body>
</html>