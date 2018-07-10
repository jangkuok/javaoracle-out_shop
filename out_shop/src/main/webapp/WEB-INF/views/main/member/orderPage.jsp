<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>상품 주문</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- daum 우편번호 서비스 외장 JS(Javascript) 파일 링크 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var price = 0;
	
	var productListCount = $('#productListTable tbody tr').length;
	
	//상품금액
	$('input[name="price"]').each(function(){
		var no = $(this).val();  
		price = parseInt(price) + parseInt(no);
		//상품가격
		$("input[name='productPrice']").val(price);
	});
	
	//배송비 가격
	var productPrice = $('#productPrice').val();

	if(parseInt(productPrice) >= parseInt("50000")){
		$('#deliveryPrice').val("0");
	}
	if(parseInt(productPrice) < parseInt("50000")){
		$('#deliveryPrice').val("2500");
	}
	
	
	//총가격
	var deliveryPrice = $('#deliveryPrice').val();
	
	var total = parseInt(productPrice) + parseInt(deliveryPrice);
	
	$("#totalPrice1").val(total);
	$("#totalPrice2").val(total);
	
	//상품 삭제
	$("#removeProduct").click(function() {
		$("input[name='checkBox']:checked").each(function(){
			 var no = $(this).val();		
			 
			 var price = $('#productPrice'+no).val();
			 
			 //총 상품 가격
			 var productPrice = $('#productPrice').val();
			 
			 $('#productPrice').val(parseInt(productPrice) - parseInt(price));

			 
			 //배송비 가격
			 var cpp = $('#productPrice').val();
			 
			 if(cpp == parseInt("0") || cpp >= parseInt("50000")){
				 $('#deliveryPrice').val("0");
			 }
			 
			 if(cpp < parseInt("50000") && cpp > parseInt("0")){
				 $('#deliveryPrice').val("2500");
			 }
			 //상품 + 배송비 가격
			 var deliveryPrice = $('#deliveryPrice').val();
			 
			 var total = parseInt(cpp) - parseInt(deliveryPrice);
			 
			 $("#totalPrice1").val(total);
			 $("#totalPrice2").val(total);
			 
			 //해당 상품 삭제
			 $("#trProduct"+no).remove();
			 productListCount--;
		}) ;	
	});

	//배송지 선택
	if($('input[name="orderCheck"]:checked').val() == '새로운'){
		alert('sdfsdfsdf');

	}

	//상품 주문
	$('#buyB').on('click',function(){
		//상품정보 배열에 넣기
		var productArr = []; 

		$("input[name='cartProduct']").each(function(i){
			productArr.push($(this).val());
	    });
		
		//주문 정보 배열에 넣기
		var deliveryInfoArr = []; 
		
		$("input[name='deliveryInfo']").each(function(){
			var arr = $(this).val();
			deliveryInfoArr.push(arr);
		});	
		
		//메시지값 배열에 넣기
		deliveryInfoArr.push($('#message').val());
		
		
		var $form = $('<form></form>');
		$form.attr('action', '${pageContext.request.contextPath}/member/orderProduct.do');
		$form.attr('method', 'post');
		$form.appendTo('body');
		
		var index = 1;
		
		//주문자 아이디
		var memberId = '<input value="'+$('#memberId').val()+'" name="memberId" type="hidden">';
		$form.append(memberId);
			     
		//상품
		for (var i = 0; i < productArr.length; i++) {
			var input = '<input value="'+productArr[i]+'" name="productInfo'+index+'" type="hidden">';
			$form.append(input);
			index++;
		}
		   
		//상품 개수
		var productCount = '<input value="'+productListCount+'" name="productCount" type="hidden">';
		$form.append(productCount);
		
		//상품 input 개수
		var count = '<input value="'+index+'" name="count" type="hidden">';
		$form.append(count);
				
		var index2 = 1;
		
		//회원정보
		for (var i = 0; i < deliveryInfoArr.length; i++) {
			var input = '<input value="'+deliveryInfoArr[i]+'" name="deliveryInfoArr'+index2+'" type="hidden">';
			$form.append(input);
			index2++;
		}
		   
		$('input[name="deliveryInfo"]').each(function(){
			var input = $(this).val();
			if(input == ""){
				alert("정보를 입력하시오");
				return;		
			}
		});
		
		if(productListCount == '0'){
			alert("상품이 없습니다.");
			return;
		}else{
			$form.submit();	
		}
		
	});
	
});
// 도로명 주소 검색
function getPostcodeAddress(i) {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
           
           // 주소 정보 전체 필드 및 내용 확인 : javateacher
           /*  var output = '';
            for (var key in data) {
                output += key + ":" +  data[key]+"\n";
            }
           
            alert(output); */

            // 3단계 : 해당 필드들에 정보 입력
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode'+i).value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('address'+i).value = fullAddr;

            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('address2'+i).focus();
            

            if(i == '1'){
            	 document.getElementById('zipcode2').value = data.zonecode;
                 document.getElementById('address2').value = fullAddr;
                 document.getElementById('address21').value = "";
                 document.getElementById('address22').value = "";
            }
        }
    }).open();
    
    $('#address21').blur(function(){
	   	 if(confirm('변경사항된 주소을 저장 하겠습니까?')) { 
	         $.ajax
	 		({		
	 			"url":"${pageContext.request.contextPath}/member/modifyAddress.do", 
	 			"type":"POST",
	 			"data":{"memberId":$('#memberId').val(),"zipcode":$("#zipcode1").val(),"address":$("#address1").val(),"address2":$("#address21").val()},
	 			"dataType":"json",
	 			"success":function(data)
	 			{
	 				document.getElementById('address22').value = document.getElementById('address21').value;
	 				if(data = "변경완료"){
	 					alert("주소가 변경 되었습니다.");	
	 				}
	 			}			
	 		});
	     }else { 
	     	return;
	     }
    });
}
</script> 
<style>
.textTran{
	background-color:transparent;
	border:0 solid black;
	text-align:right;
}

#addressMagin > div , #addressMagin2 > div{
    	margin: 15px 0;
    }
</style>
   
</head>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>주문내역</h1><hr>
</div>
	<div>
		<table id="productListTable" class="table table-hover">
			<thead>
			<tr>
				<th></th>
				<th>번호</th>
				<th>이미지</th>
				<th>이름</th>
				<th>사이즈</th>
				<th>색상</th>
				<th>가격</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="orderList" items="${orderList}" varStatus="st">
					<tr id="trProduct${orderList.cartNo}">
						<td>
							<input type="checkBox" id="checkBox" name="checkBox" value="${st.count}">
						</td>
						<td>
							<input class="textTrans" type="text" id="cartNo" name="cartProduct" size="2" value="${st.count}" readOnly="readOnly">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${orderList.productNo}">
								<img src="<c:url value='/image/thumbnail/${orderList.thumbnailName}'/>"/>
							</a>
							<input type="hidden" id="productNo" name="cartProduct" value="${orderList.productNo}">
							<input type="hidden" id="thumbnailName" name="cartProduct" value="${orderList.thumbnailName}">
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/outer/outerView.do?outerNo=${orderList.productNo}">
								${orderList.productName}
							</a>
							<input type="hidden" id="productName" name="cartProduct" value="${orderList.productName}">
						</td>
						<td>
							<input class="textTrans" type="text" id="productColor" name="cartProduct" value="${orderList.productColor}" readOnly="readOnly">
						</td>
						<td>
							<input class="textTrans" type="text" id="productSize" name="cartProduct" value="${orderList.productSize}" readOnly="readOnly">
						</td>
						<td>
							<input class="textTrans" type="text" id="productPrice${st.count}" name="cartProduct" value="${orderList.productPrice}" readOnly="readOnly">
							<input type="hidden" id="price" name="price" value="${orderList.productPrice}" readOnly="readOnly">
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<table class="table table-hover">
				<tr>
					<td colspan="7" >
								상품금액<input class="textTran" type="text" id="productPrice" name="productPrice" size="6" value="0">
								배송비<input class="textTran" type="text" id="deliveryPrice" name="deliveryPrice" size="6" value="0"> 
								합계 : <input class="textTran" type="text" id="totalPrice1" name="totalPrice" size="8" value="0"><br>
					</td>
				</tr>
			</table>
		</div>
	</div>
<input type="button" class="btn btn-dark" id="removeProduct" name="removeProduct" value="상품삭제">
<hr>	
	<div>
		주문정보
		<table class="table table-hover">
			<tr>
				<th width="20%">주문자*</th>
				<td width="80%">
					<div class="col-sm-5">
						<input class="form-control" type="text" id="" name="" value="${memberVo.name}">
					</div>
				</td>
			</tr>
			<tr>
				<th>주소*</th>
				<td id="addressMagin">
					<div class="row">
						<div class="col-sm-2" style="float:left;">
							<input type="text" class="form-control" id="zipcode1" name="" value="${memberVo.zipcode}" readOnly="readOnly">
						</div>
						<c:if test="${memberVo.zipcode == null}">
							<div class="col-sm-3" style="float:left;">
								<input class="btn btn-dark" type="button" value="주소 검색" onClick="getPostcodeAddress('1')">
							</div>
						</c:if>
						<c:if test="${memberVo.zipcode != null }">
							<div class="col-sm-3" style="float:left;">
								<input class="btn btn-dark" type="button" value="주소 변경" onClick="getPostcodeAddress('1')">
							</div>
						</c:if>
					</div>
					<div class="col-sm-8" style="float:left;">
						<input type="text" class="form-control" id="address1" name="" value="${memberVo.address}" readOnly="readOnly"> 
					</div>
					<div class="col-sm-2" style="float:left;">
						기본주소
					</div>
					<div class="col-sm-8" style="float:left;">
						<input type="text" class="form-control" id="address21" name="" value="${memberVo.address2}"> 
					</div>
					<div class="col-sm-2" style="float:left;">
						나머지주소
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화*</th>
				<td>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="" name="" value="${memberVo.phoneNum}">
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일*</th>
				<td>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="" name="" value="${memberVo.email}">
					</div>
				</td>
			</tr>
		</table>
	</div>
<hr>	
	<div>
		배송정보
		<input type="hidden" id="memberId" name="memberId" value="${memberVo.id}">
		<table class="table table-hover">
			<tr>
				<th width="20%">배송지 선택</th>
				<td width="80%">
					<input type="radio" id="existSelect" name="orderCheck" checked="checked" value="주문자" /> 주문자 정보와 동일
					<input type="radio" id="newSelect" name="orderCheck" value="새로운" /> 새로운 배송지
				</td>
			</tr>
			<tr>
				<th>주문자*</th>
				<td>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="name" name="deliveryInfo" value="${memberVo.name}">
					</div>
				</td>
			</tr>
			<tr>
				<th>주소*</th>
				<td id="addressMagin2">
					<div class="col-sm-2" style="float:left;">
						<input type="text" class="form-control" id="zipcode2" name="deliveryInfo" value="${memberVo.zipcode}" readOnly="readOnly">
					</div>
					<div class="col-sm-3" style="float:left;">
						<input class="btn btn-dark" type="button" value="주소 검색" onClick="getPostcodeAddress('2')">
					</div>
					<div class="col-sm-8" style="float:left;">
						<input type="text" class="form-control" id="address2" name="deliveryInfo" value="${memberVo.address}" readOnly="readOnly"> 
					</div>
					<div class="col-sm-2" style="float:left;">
						기본주소
					</div>
					<div class="col-sm-8" style="float:left;">
						<input type="text" class="form-control" id="address22" name="deliveryInfo" value="${memberVo.address2}"> 
					</div>
					<div class="col-sm-2" style="float:left;">
						나머지주소
					</div>
				</td>
			</tr>
			<tr>
				<th>휴대전화*</th>
				<td>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="phoneNum" name="deliveryInfo" value="${memberVo.phoneNum}">
					</div>
				</td>
			</tr>
			<tr>
				<th>이메일*</th>
				<td>
					<div class="col-sm-4">
						<input type="text" class="form-control" id="email" name="deliveryInfo" value="${memberVo.email}">
					</div>
				</td>
			</tr>
			<tr>
				<th>배송메세지</th>
				<td>
					<div class="col-sm-10">
						<textarea class="form-control" id="message" name="message"></textarea>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<div>
		<table class="table table-hover">
			<tr>
				<th width="20%">결제 예정 금액</th>
				<td width="80%">
					<div class="col-sm-4">
						<input class="textTrans" style="text-align:left;" type="text" id="totalPrice2" name="deliveryInfo" value="0">
					</div>
				</td>
			</tr>
		</table>
	</div>
<hr>	
결제 수단<br>
<input type="radio" name="" value="" /> 카드 결제
<input type="radio" name="" value="" /> 무통장 입금
<input type="radio" name="" value="" /> 핸드폰 결제<br>
<input class="btn btn-dark" type="button" id="buyB" value="결제하기">
</div>
</body>
</html>