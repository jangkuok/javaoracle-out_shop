<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>        
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
	 
	 	var size = $('#imageTbody tr').length;
	 	$('#trSize').val(size);
	 	
	 	var index = 0;
	 	$('#trFile').val(index);

	 	var file = '<tr><td><input type="file" id="imageFile['+index+']" name="imageFiles['+index+']" value="사진등록" accept=".jpg, .jpeg, .png"/></tr></td>';
	 	
	 	//이미지가 없을 경우
		if(size == 0){
			$('#imageTbody').append(file);
			index++;
			$('#trFile').val(index);
		}
		
		//이미지 추가
		$("#imagePlusButton").click(function() {
			$('#imageTbody').append(file);
			index++;
			$('#trFile').val(index);
			$('#imageMinusButton').show();
		});
		
		//이미지 삭제
		$("#imageMinusButton").on('click',function() {	
			if(index == 0){
				$('#imageMinusButton').hide();
			}else{
				$("#imageTbody tr:last").remove();	
				index--;
				$('#trFile').val(index);
				//이미지 등록 칸에 없을 경우
				if(index == 0){
					$("#imageMinusButton").hide();
				}
			}
		});
		
		//이미지 등록 칸에 없을 경우
		if(index == 0){
			$("#imageMinusButton").hide();
		}
		
		
		//등록한 이미지 삭제
		$('input[id^=delImage]').on('click',function(e) {
			
			var no = e.target.id.substring(8);
			
			var pictureNo = $('#pictureNo'+no).val();
			
			if(confirm('정말로 이미지를 삭제 하시겠습니까?')){
 			$.ajax
			({		
				"url":"${pageContext.request.contextPath}/admin/removeOuterPicture.do", 
				"type":"POST",
				"data":{"pictureNo" : pictureNo},
				"dataType":"text",
				"success":function(data)
				{				
					size--;
					$('#trSize').val(size);
					$('#imageTr'+ no).remove();
					if($("#imageTbody tr").length == 0){
						$('#imageTbody').append(file);
						index++;
						$('#trFile').val(index);
					}
				}			
			});} else{
				return;
			}
		});
		
		
		//이미지 수정
		$("#addPicture").on('click',function(e) {
			
			$('input[name="imageFiles"]').each(function(){   	
				if($(this).val() == '' || $(this).val() == null){
					alert("상품이미지를 등록하시오");
					return false;
				}
			});	
			if(confirm('등록 하시겠습니까?')) { 
				$('#outerPictureVo').submit();
		    }else { 
		    	return;
		   	}
		});	 
 });
 </script>
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>상품 상세 이미지 수정</h1><hr class="hrStyle">
</div>
	<form:form modelAttribute="outerPictureVo" id="outerPictureVo" name="outerPictureVo" 
				action="${pageContext.request.contextPath}/admin/addOuterPicture.do" method="post" enctype="multipart/form-data">
				<form:hidden path="outerNo" name="outerNo" value="${outerVo.outerNo}"/>
		<%-- <form:hidden name="pictureUrl" path="pictureUrl" value=""/>
		<form:hidden name="pictureName" path="pictureName" value=""/> --%>
				<input type="hidden" name="trSize" id="trSize" value=""/>
				<input type="hidden" name="trFile" id="trFile" value=""/>
			<div>
				<input class="btn" type="button" id="imagePlusButton" value="+">
				<input class="btn" type="button" id="imageMinusButton" value="-">
			</div>	
			<table id="imageTable" class="table table-hover">
				<tbody id="imageTbody">
				<c:if test="${not empty outerVo.imageList}">
					<c:forEach var="imageList" items="${outerVo.imageList}" varStatus="st">
					<c:if test="${imageList.pictureNo != ''}">
						<tr id="imageTr${st.count}">
							<td id="imageTd${st.count}">
								<input type="hidden" name="pictureNo${st.count}" id="pictureNo${st.count}" value="${imageList.pictureNo}"/>
								<input type="hidden" name="pictureUrl${st.count}" id="pictureUrl${st.count}" value="${imageList.pictureUrl}"/>
								
								<div class="row col-sm-11"  id="imageDiv">
									<div class="col-sm-5">
										<input class="form-control" type="text" name="pictureName${st.count}" id="pictureName${st.count}" value="${imageList.pictureName}" readonly="readonly"/>
									</div>
									<div class="col-sm-5">
										<input class="btn btn-dark" type="button" name="delImage" id="delImage${st.count}"  value="이미지 삭제">
									</div>
								</div>
								
								
							</td>
						</tr>
					</c:if>
					</c:forEach>
				</c:if>
				</tbody>
			</table>
			<input class="btn btn-dark" type="button" id="addPicture" name="addPicture" value="등록">
	</form:form>
</div>
</body>
</html>