<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
.textTrans{
	background-color:transparent;
	border:0 solid black;
}
</style>
<script type="text/javascript">
//상품 선택하기
$(document).ready(function() {
	
	$("#outerViewInfo").hide();
	
	//색상 보여주기
	$("#sizeSelect").change(function() {		
		$("#colorSelect").find("option").remove();
		$("#colorSelect").append($("<option value"+'[필수]색상 선택'+">[필수]색상 선택</option>"));
		$.ajax
		({		
			"url":"${pageContext.request.contextPath}/outer/outerSizeCheck.do", 
			"type":"POST",
			"data":{"outerNo":$("#outerNo").val(),"type":$("#sizeSelect").val()},
			"dataType":"json",
			"success":function(data)
			{
				if(data.length == 0){
					alert("상품이 없습니다.");
				}
				$.each(data, function(){
					$("#colorSelect").append($("<option value"+this.color+">"+this.color+"</option>"));
					$("#sizeType").val(this.type);
					
				});
			}			
		});
	});
	
	var count = 1;
	
	//선택한 상품 보여주기
	$(document).on('change','#colorSelect',function() {		
		var size = $("#sizeSelect").val();
		var color = $("#colorSelect").val();
		var no = $("#outerNo").val();
		var name = $("#outerName").val();
		var price = $("#outerPrice").val();
		var selectPrice = $("#totalPrice").val();
		var thumbnailName = $("#thumbnailName").val();
		
		
		//선택한 상품 추가
		var product = '<tr name="trProduct"><td id="selectProductItems'+count+'" name="selectProductItems">'+
		'<h7><input class="textTrans" type="hidden" id="cartNo'+count+'" name="product" value="'+ count +'" readonly="">'+
		'<input class="textTrans" type="hidden" id="productNo'+count+'" name="product" value="'+ no +'" readonly="">'+
		'<input class="textTrans" type="hidden" id="thumbnailName'+count+'" name="product" value="'+ thumbnailName +'" readonly="">'+
		'<input class="textTrans" type="text" id="productName'+count+'" name="product" size="15" value="'+ name +'" readonly="">'+
		'<input class="textTrans" type="text" id="productSize'+count+'" name="product" size="4" value="'+ size +'" readonly="">'+
		'<input class="textTrans" type="text" id="productColor'+count+'" name="product" size="5" value="'+ color +'" readonly="">'+
		'<input class="textTrans" type="text" id="productPrice'+count+'" name="product" size="7" value="'+ price +'" readonly="">'+
		'<input class="textTrans" type="button" id="close'+count+'" name="close" value="X"></h7>'+
		'</td></tr>';
		
		var error = "[필수]색상 선택";
		
		if(color != error){
			$("#outerViewInfo").show();	
			$('#productTbody').append(product);
			count++;
			selectPrice = parseInt(selectPrice) +  parseInt(price);
			$("#totalPrice").val(selectPrice);
		}
	});

/* 	
	$(document).on('click','input[name="minus"]',function(){
	
    	var num = $(this).closest('li').find('#count[1]');
        var count = parseInt(num.val());
        count--;
        
        $('#count[1]').val(count);
        
    	if(num.val() < 2){
    		alert('더이상 줄일 수 없습니다.');
    		$('input[id="count[]"]').val('1'); 
    	}
	});
	
	$(document).on('click','input[id="plus[]"]',function(){
    	var num = $(this).closest('li').find('input[id="count[]"]');
        var count = parseInt(num.val());
        count++;
        
        $('input[id="count[]"]').val(count);
	}); 
*/	
	//관심상품 등록
	$("#wishB").click(function() {
		
		$.ajax
		({		
			"url":"${pageContext.request.contextPath}/outer/createWishList.do", 
			"type":"POST",
			"data":{"outerNo":$("#outerNo").val(),"id":$("#id").val()},
			"dataType":"json",
			"success":function(data)
			{
				if(data == "존재"){
					alert("이미 등록한 상품입니다.");
				}
				
				if(data == "등록완료" ){
					alert("관심상품이 등록 되었습니다.");	
				}
			}			
		});
	});
	
	//선택상품 삭제	
	$(document).on('click','input[id^=close]',function(e) {
		var selectPrice = $("#totalPrice").val();
		var price = $("#outerPrice").val();
		
		var no = e.target.id.substring(5);
		
		$("#selectProductItems"+no).remove();
		count--;
		
		if(index == 1){
			$("#outerViewInfo").hide();
		}
		
		selectPrice = parseInt(selectPrice) - parseInt(price);
		$("#totalPrice").val(selectPrice);
	});

	//상품 주문 
	$("#buyB").on('click',function(e) {
		var loginId = $('#id').val();
		
		if(count == '1'){
			alert("선택한 상품이 없습니다.");
			return;
		}
		else if(loginId == null){
			if(confirm('로그인 하시겠습니까?')) { 
				location.href="${pageContext.request.contextPath}/member/orderPage.do"
		    }else { 
		    	return;
		   	}		
		}else{
			var productArr = []; 

		    $("input[name='product']").each(function(i){
		    	productArr.push($(this).val());
		    });
		    
		    
 		    var $form = $('<form></form>');
		    $form.attr('action', '${pageContext.request.contextPath}/member/orderPage.do');
		    $form.attr('method', 'post');
		    $form.appendTo('body');
		    
		    var index = 1;
		    
		    var input = '<input value="'+$('#memberId').val()+'" name="memberId" type="hidden">';
		    $form.append(input);
		    
		    for (var i = 0; i < productArr.length; i++) {
		    	var input = '<input value="'+productArr[i]+'" name="productInfo'+index+'" type="hidden">';
		    	$form.append(input);
		    	index++;
			}
		    
		    $form.submit();
		}
	});
	
	
	//카트 등록 
	$("#cartB").on('click',function(e) {
		if(count == '1'){
			alert("선택한 상품이 없습니다.");
			return;
		}else{
			var productArr = []; 
	
			$("input[name='product']").each(function(i){
		    	productArr.push($(this).val());
		    });
		    
		    var $form = $('<form></form>');
		    $form.attr('action', '${pageContext.request.contextPath}/outer/addCart.do');
		    $form.attr('method', 'post');
		    $form.appendTo('body');
		    
		    var index = 1;
		    
		    var input = '<input value="'+$('#outerNo').val()+'" name="outerNo" type="hidden">';
		    $form.append(input);
		    
		    for (var i = 0; i < productArr.length; i++) {
		    	var input = '<input value="'+productArr[i]+'" name="productInfo'+index+'" type="hidden">';
		    	$form.append(input);
		    	index++;
			}
		    
		    $form.submit();
		    
		}
	});
	
});
</script>
</head>
<body>
	<!-- 장바구니에 상품이 있을 경우 -->
	<c:if test="${not empty param.addNo}">
		<script>
			alert("이미 추가한 상품입니다.");
		</script>
	</c:if>	
	<!-- 관리자 로그인 할 경우 -->
	<sec:authorize access="hasRole('ROLE_ADMIN')">   
		<form id="updateProductForm" name="updateProductForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
			<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
			<input type="hidden" id="modify" name="modify" value="상품">	
			<input type="submit" id="updateProduct" name="updateProduct" value="상품 수정">
		</form>
		<form id="updateSizeForm" name="updateSizeForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
			<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
			<input type="hidden" id="modify" name="modify" value="사이즈">		
			<input type="submit" id="updateSize" name="updateSize" value="사이즈 수정">
		</form>
		<form id="updateImagesForm" name="updateImagesForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
			<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">	
			<input type="hidden" id="modify" name="modify" value="이미지">	
			<input type="submit" id="updateImages" name="updateImages" value="이미지 수정">
		</form>
	</sec:authorize>
	
	<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
		<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
		<input type="hidden" id="thumbnailName" name="thumbnailName" value="${outer.thumbnailName}">
		<div class="row" style="margin-bottom:100px;">
			<div class="col-lg-5" style="margin-right:50px;">
				<div style="margin-right:100px;">
					<img class="img-rounded" src="<c:url value='/image/${outer.imageName}'/>" width="400" height="400"/>
				</div>
			</div>	
			<div class="col-lg-6 mb-7">
	          <div class="card h-100">
	            <div class="card-body">
	            	<div class="col-sm-5">
	     				<h4><input class="textTrans" type="text" id="outerName" value="${outer.name}" readOnly="readOnly"></h4>
	     			</div>
	     			<div class="col-sm-12">
	     				<h6>${outer.content}</h6>
	     			</div>
	     			<div class="col-sm-12">
	     				<h6><input class="textTrans" type="text" id="outerPrice" value="${outer.price}" size="4" readOnly="readOnly">won<br></h6>			
	     			</div>
	     			<div class="col-sm-6">
	     				<input type="hidden" id="sizeNo" value="">
	     			</div>	     			
	     			<div class="col-sm-5" style="margin-bottom:2px;">
					<select class="form-control" id ="sizeSelect" name="sizeSelect">
						<option value="[필수]사이즈 선택">[필수]사이즈 선택</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
						<option value="FREE">FREE</option>
					</select><br>
					</div>
					<div class="col-sm-5" style="margin-bottom:2px;">
						<select class="form-control" id ="colorSelect" name="colorSelect">
						<option value="[필수]색상 선택">[필수]색상 선택</option>
						</select>
					</div>
					<div class="col-sm-12">
						<table class="table table-hover" id="outerViewInfo">
							<tbody id="productTbody"></tbody>		
						</table>
					</div>
	            </div>
		            <div class="card-footer" style="text-align:right;">
		            	
		            	TOTAL &nbsp; <input class="textTrans" type="text" id="totalPrice" value="0" size="4" readOnly="readOnly"> won
		            	<sec:authorize access="hasRole('ROLE_USER')">
							<input type="hidden" id="memberId" name="memberId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
							<input class="form-control" type="button" id="wishB" name="wishB" value="Wish List">
						</sec:authorize>	
		            	<input class="form-control btn btn-dark" type="button" id="buyB" name="buyB" value="Buy Now">		
						<input class="form-control" type="button" id="cartB" name="cartB" value="Add To Cart">
		           	</div>
	          	</div>
	        </div>
		</div>	
		<div class="row">		
			<div class="col-lg-12" style="text-align:center;">
				<h2>PRODUCT INFO</h2><hr>
				<c:forEach var="imageList" items="${outer.imageList}" varStatus="st">
					<img src="<c:url value='/image/${imageList.pictureName}'/>" width="650"/><br>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
