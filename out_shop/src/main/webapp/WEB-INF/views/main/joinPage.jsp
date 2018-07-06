<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>회원가입</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

//중복체크 확인
var idck = 1;

//에러 존재 확인
//var id = $('#error').val();

//중복체크 jquery
$(document).ready(function(){
	$("#joinIdCheck").click(function(){

		$.ajax
		({		
			url:"${pageContext.request.contextPath}/checkMember.do", 
			type:"POST",
			data:{"joinId" : $('input[name="id"]').val()},
			dataType:"text",
			beforeSend:function()
			{
				if(!$("#id").val())
				{
					alert("아이디를 입력하세요");
					return false;
				}
			},
			success:function(data)
			{
				if(data == "3")
				{
					alert("아이디는 8~15자입니다.");
					$("#id").focus();
					return false;
				}
				
				
				if(data == "1")
				{
					alert("존재하는 아이디 입니다.");
					$("#id").focus().val("");
					return false;
				}

				if(data == "0")
				{
					alert("사용가능한 아이디 입니다.");
					$("#pw").focus();
					idck = 0; 
				}
			}
		});
	});
});

//submit 
function join_button(){
	if(confirm('회원가입을 하시겠습니까?')){
        if(idck==1){
            alert('아이디 중복체크를 해주세요');
            return false;
        }else{
        	$("#join").submit();
        	if(error == null){
        		alert("회원가입을 축하합니다");	
        	}else{
        		idck = 0;
        		return false;
        	}
        }
    }else{
    	return;
    }
};


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
<h1>JOIN</h1><hr>
</div>
<input type="hidden" id="error" name="error" value="${error}">	
	<form:form commandName="memberVo" id="join" name="join" method="post" action="${pageContext.request.contextPath}/joinCheck.do">
		<table class="table table-bordered">
		  <thead>
		  </thead>
		  <tbody>
		    <tr>
		      <th scope="row">아이디</th>
		      <td>
			      	<div class="row">
			      	  <div class="col-sm-5">
			      		<form:input class="form-control" name="id" path="id" size="25" value="${memberForm.id}"/>
			      	  </div>
			      	  <div class="col-sm-3">
						<input class="btn btn-dark" type="button" id="joinIdCheck" name="joinIdCheck" value="중복확인">
					  </div>
					</div> 	 
					<form:errors path="id" cssClass="errMsg" />
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">패스워드</th>
		      <td>
		      	  <div class="row">
			      	<div class="col-sm-5">
		    			<form:password class="form-control" name="pw" path="pw" size="25" maxlength="20"/>
		    	    </div>
		    	   </div>
				   <form:errors path="pw" cssClass="errMsg" />
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">이름</th>
		      <td>	
		      	  <div class="row">
			      	<div class="col-sm-5">		      
		      			<form:input class="form-control" name="name" path="name" size="25" maxlength="15"/>	
					</div>
				  </div> 		      		
				  <form:errors path="name" cssClass="errMsg" value="${memberForm.name}"/>					
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">핸드폰 번호</th>
		      <td>
		      	  <div class="row">
			      	<div class="col-sm-5">		      
		      			<form:input class="form-control" name="phoneNum" path="phoneNum" size="25" maxlength="11"/>
					</div>
				  </div> 		      		
				  <form:errors path="phoneNum" cssClass="errMsg"/>					
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">이메일</th>
		      <td>
		      	  <div class="row">
			      	<div class="col-sm-5">		      
		      			<form:input class="form-control" name="email" path="email" size="25"/>
					</div>
				  </div> 	      		
				  <form:errors name="email" path="email" cssClass="errMsg" value="${memberForm.email}"/>
					
		      </td>
		    </tr>
		    <tr>
		      <th scope="row">성별</th>
		      <td>
		      	 <div class="radio">
		     	 	 <form:radiobutton name="sex" path="sex" value="남자" label="남자"/>
		     	 </div>
		     	 <div class="radio">
		     	  	<form:radiobutton name="sex" path="sex" value="여자" label="여자"/>
		     	 </div>	     		
			 </td>
		    </tr>		    		    
		  </tbody>
		</table>
		<form:hidden name="zipcode" path="zipcode" value=""/>	
			<form:hidden name="address" path="address" value=""/>
			<form:hidden name="address2" path="address2" value=""/>				
			<form:hidden name="grade" path="grade" value="브론즈"/>	
			<form:hidden name="enabled" path="enabled" value="1"/>	
		<input type="button" class="btn btn-dark" id="joinButton" name="joinButton" value="가입" onclick="join_button();">
		<input type="reset" class="btn" id="reset" name="reset" value="초기화">	
		</form:form>	
			
			
			
			
			
			
			
			
			
			
<%-- 			아이디 : 	<form:input name="id" path="id" size="25" value="${memberForm.id}"/>
						<input type="button" id="joinIdCheck" name="joinIdCheck" value="중복확인">
						<form:errors path="id" cssClass="errMsg" /><br>
			비밀번호 :  <form:password name="pw" path="pw" size="25" maxlength="20"/>
						<form:errors path="pw" cssClass="errMsg" /><br>
			이름 : 		<form:input name="name" path="name" size="25" maxlength="15"/>	
						<form:errors path="name" cssClass="errMsg" value="${memberForm.name}"/><br>
			핸드폰번호 : <form:input name="phoneNum" path="phoneNum" size="25" maxlength="11"/>
						<form:errors path="phoneNum" cssClass="errMsg"/><br>
			이메일 : 	<form:input name="email" path="email" size="25"/>
						<form:errors name="email" path="email" cssClass="errMsg" value="${memberForm.email}"/><br>
			성별 :		<form:radiobutton name="sex" path="sex" value="남자" label="남자"/>
						<form:radiobutton name="sex" path="sex" value="여자" label="여자"/><br>
			<form:hidden name="zipcode" path="zipcode" value=""/>	
			<form:hidden name="address" path="address" value=""/>
			<form:hidden name="address2" path="address2" value=""/>				
			<form:hidden name="grade" path="grade" value="브론즈"/>	
			<form:hidden name="enabled" path="enabled" value="1"/>	
		<input type="button" id="joinButton" name="joinButton" value="가입" onclick="join_button();">
		<input type="reset" id="reset" name="reset" value="초기화"> 
--%>
	
</div>
</body>
</html>
