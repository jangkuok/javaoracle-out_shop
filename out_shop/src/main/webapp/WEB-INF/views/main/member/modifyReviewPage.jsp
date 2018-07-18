<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>       
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {
	//이미지 삭제
	$('#delImage').click(function() {		
		var file = '<input type="file" id="imageFile" name="imageFile" value="사진등록" accept=".jpg, .jpeg, .png"/>';
		
		$('#pictureName').remove();
		$('#delImage').remove();
		$('#thumbnailName').val('');
		$('#imageTd').append(file);
		$('#reviewVo').attr("enctype","multipart/form-data");
	});
	
/* 	$("#modifyButton").on('click',function() {
		
		if($('#name').val() == '' || $('#name').val() == null){
			alert("상품이름을 입력하시오");
			return false;
		}
		if($('#price').val() == '' || $('#price').val() == null || $('#price').val() == '0'){
			alert("상품가격을 입력하시오");
			return false;
		}
		
		if($('#imageName').val() == '' || $('#imageName').val() == null){
			if($('#imageFile').val() == '' || $('#imageFile').val() == null){
				alert("상품이미지를 등록하시오");
				return false;
			}
		}
		if($('#content').val() == '' || $('#content').val() == null){
			alert("상품설명을 입력하시오");
			return false;
		}
		$('#outerVo').submit();
		
	}); */
});
</script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>REVIEW MODIFY</h1><hr class="hrStyle">
</div>
	<form:form modelAttribute="reviewVo" id="reviewVo" name="reviewVo"
		action="${pageContext.request.contextPath}/member/modifyMemberReview.do" method="post">	
		<input type="text" name="reviewNo" id="reviewNo" value="${reviewVo.reviewNo}"/>
		<input type="text" name="memberId" id="memberId" value="${reviewVo.memberId}"/>
		<input type="text" name="reviewDate" id="reviewDate" value="${reviewVo.reviewDate}"/>
		<input type="text" name="thumbnailName" id="thumbnailName" value="${reviewVo.thumbnailName}"/>
		
		<table id="outerAdd" class="table table-bordered">
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
			      	 		<input class="form-control" size="25" value="${reviewVo.outer.name}" readonly="readonly" disabled="disabled"/>
			      		<input type="hidden" class="form-control" name="outerNo" value="${reviewVo.outerNo}"/>
			      	 </div>
		      	 </div>
		      </td> 
			</tr>
			<tr>
				<th>사진</th>
				<td id="imageTd">
					<input type="text" name="pictureName" id="pictureName" value="${reviewVo.pictureName}" readonly="readonly"/>
					<input type="button" id="delImage" name="delImage" value="이미지 삭제">
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
		</table>
		<input type="submit" id="modifyButton" name="modifyButton" value="수정하기">
	</form:form>
</div>
</body>
</html>