<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<!-- 가격 "," 처리 추가  -->
function commaNum(num) {  
    var len, point, str;  

    num = num + "";  
    point = num.length % 3  
    len = num.length;  

    str = num.substring(0, point);  
    while (point < len) {  
        if (str != "") str += ",";  
        str += num.substring(point, point + 3);  
        point += 3;  
    }  
    return str;  
} 

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
		'<input class="textTrans" type="text" id="commaProductPrice'+count+'" name="" size="7" value="'+ commaNum(price) +'" readonly="">'+
		'<input type="hidden" id="productPrice'+count+'" name="product" value="'+ price +'">'+		
		'<input class="textTrans" type="button" id="close'+count+'" name="close" value="X"></h7>'+
		'</td></tr>';
		
		var error = "[필수]색상 선택";
		
		if(color != error){
			$("#outerViewInfo").show();	
			$('#productTbody').append(product);
			count++;
			selectPrice = parseInt(selectPrice) +  parseInt(price);
			$("#totalPrice").val(selectPrice);
			$("#commaTotalPrice").val(commaNum($("#totalPrice").val()));
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
		
		if(count == 1){
			$("#outerViewInfo").hide();
		}
		
		selectPrice = parseInt(selectPrice) - parseInt(price);
		$("#totalPrice").val(selectPrice);
		$("#commaTotalPrice").val(commaNum($("#totalPrice").val()));
	});

	//상품 주문 
	$("#buyB").on('click',function(e) {
		var loginId = $('#id').val();
		
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
		
		if(count == '1'){
			alert("선택한 상품이 없습니다.");
			return;
		}
		else if(loginId == null){
			if(confirm('로그인 하시겠습니까?')) { 
				 $form.submit();
		    }else { 
		    	return;
		   	}		
		}else{
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
            	<div class="col-sm-12">
     				<h4><input class="textTrans form" type="text" id="outerName" value="${outer.name}" readOnly="readOnly"></h4>
     			</div>
     			<div class="col-sm-12">
     				<h6>${outer.content}</h6>
     			</div>
     			<div class="col-sm-12">
     				<h6>
     				<fmt:formatNumber value="${outer.price}" pattern="#,###.##"/>
     				<input class="textTrans" type="hidden" id="outerPrice" value="${outer.price}" size="4" readOnly="readOnly">
     				won<br>
     				</h6>			
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
	            	
	            	TOTAL &nbsp; <input class="textTrans" type="text" id="commaTotalPrice" value="0" size="5" readOnly="readOnly"> won
	            	<input type="hidden" id="totalPrice" value="0" size="4" readOnly="readOnly">
	            	<input type="hidden" id="memberId" name="memberId" value="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.id}">
	            	<sec:authorize access="hasRole('ROLE_USER')">
						<input class="form-control" type="button" id="wishB" name="wishB" value="Wish List">
					</sec:authorize>
					<sec:authorize access="!hasRole('ROLE_ADMIN')">	
		            	<input class="form-control btn btn-dark" type="button" id="buyB" name="buyB" value="Buy Now">		
						<input class="form-control" type="button" id="cartB" name="cartB" value="Add To Cart">
					</sec:authorize>
					
						<!-- 관리자 로그인 할 경우 -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">   
						<form id="updateProductForm" name="updateProductForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
							<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
							<input type="hidden" id="modify" name="modify" value="상품">	
							<input class="form-control" type="submit" id="updateProduct" name="updateProduct" value="상품 수정">
						</form>
						<form id="updateSizeForm" name="updateSizeForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
							<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">
							<input type="hidden" id="modify" name="modify" value="사이즈">		
							<input class="form-control btn btn-dark" type="submit" id="updateSize" name="updateSize" value="사이즈 수정">
						</form>
						<form id="updateImagesForm" name="updateImagesForm" action="${pageContext.request.contextPath}/admin/modifyOuterPage.do" method="post">
							<input type="hidden" id="outerNo" name="outerNo" value="${outer.outerNo}">	
							<input type="hidden" id="modify" name="modify" value="이미지">	
							<input class="form-control" type="submit" id="updateImages" name="updateImages" value="이미지 수정">
						</form>
					</sec:authorize>
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
	<div class="row">		
		<div class="col-lg-12">
			<h2 style="text-align:center;">REVIEW</h2><hr><br><br>
			<c:if test="${empty list}">
				<div style="text-align:center;">
					작성된 리뷰가 없습니다.
				</div>
			</c:if>	
			<c:if test="${not empty list}">
				<h4>평균 : ${starAvg} / 5.0</h4>
				<hr>
				<c:forEach var="outer" items="${list}" varStatus="st">
				<c:forEach var="reviewList" items="${outer.reviewList}" varStatus="st">
				  <div class="row">
				  	<div class="col-lg-1">
		            	<img class="card-img-top" src="<c:url value='/image/${outer.imageName}'/>" alt="">
			        </div>              
			        <div class="col-lg-9">
			        	<c:if test="${reviewList.star == 1}">
			        		<h2>★☆☆☆☆</h2>
			        	</c:if>
			        	<c:if test="${reviewList.star == 2}">
			        		<h2>★★☆☆☆</h2>
			        	</c:if>
			        	<c:if test="${reviewList.star == 3}">
			        		<h2>★★★☆☆</h2>
			        	</c:if>
			        	<c:if test="${reviewList.star == 4}">
			        		<h2>★★★★☆</h2>
			        	</c:if>
			        	<c:if test="${reviewList.star == 5}">
			        		<h2>★★★★★</h2>
			        	</c:if>          
			          <h5>${reviewList.subject} (${reviewList.reviewDate})</h5>
			          <p>${reviewList.content}</p>
			        </div>
			        <div class="col-lg-2">
			          <p>아이디 : ${reviewList.memberId}</p>
			          <img class="card-img-top" src="<c:url value='/image/${reviewList.pictureName}'/>" alt="">
			        </div>
			      </div>
			      <hr>
			    </c:forEach>
				</c:forEach>
				<%-- ######################################################
											페이징 처리
						###################################################### --%>		
				<nav aria-label="Page navigation example">
				  <ul class="pagination">    
					<!--
						이전 페이지 그룹 처리.
						만약에 이전페이지 그룹이 있으면 링크처리하고 없으면 화살표만 나오도록 처리.
					 -->
					<li class="page-item">
					<c:choose>
						<c:when test="${requestScope.pageBean.previousPageGroup}">
							<%-- 이전페이지 그룹이 있디면 : previousPageGroup()--%>
							<a class="page-link" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}&page=1" aria-label="Previous">
				       			<span aria-hidden="true">&laquo;</span>
				        		<span class="sr-only">Previous</span>
				      		</a>
						</c:when>
						<c:otherwise>
							<a class="page-link" aria-label="Previous">
				        		<span aria-hidden="true">&laquo;</span>
				       			<span class="sr-only">Previous</span>
				      		</a>
						</c:otherwise>
					</c:choose>
				    </li>
					<!-- 
						현재 page가 속한 page 그룹내의 페이지들 링크.
						현재 pageGroup의 시작page ~ 끝 page
					 -->
					 <!-- 만약에 page가 현재페이지면 링크처리를 하지 않고 page가 현재페이지가 아니라면 링크처리. -->
						<c:forEach begin="${requestScope.pageBean.beginPage}" end="${requestScope.pageBean.endPage}" var="page">
							<c:choose>
								<c:when test="${requestScope.pageBean.page != page}"> <%-- 현재패이지가 아니라면 --%>
									<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}&page=${page}">${page}</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link">${page}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					<!-- 
						다음페이지 그룹으로 이동
						만약에 다음페이지 그룹이 있으면 링크 처리 없으면 화살표만 나오도록 처리
					 -->
					<li class="page-item">
					<c:choose> 	
						<c:when test="${requestScope.pageBean.nextPageGroup}">
							<%-- 다음페이지 그룹이 있디면 : nextPageGroup()--%>
				    		<a class="page-link" href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${outer.outerNo}&page=${requestScope.pageBean.endPage + 1}" aria-label="Next">
				        		<span aria-hidden="true">&raquo;</span>
				        		<span class="sr-only">Next</span>
				      		</a>		
						</c:when>
						<c:otherwise>
							<a class="page-link" aria-label="Next">
				        		<span aria-hidden="true">&raquo;</span>
				       			<span class="sr-only">Next</span>
				      		</a>		
						</c:otherwise>
					</c:choose>
					</li>
				  </ul>
				</nav>				
			</c:if>
		</div>
	</div>	
</div>
</body>
</html>
