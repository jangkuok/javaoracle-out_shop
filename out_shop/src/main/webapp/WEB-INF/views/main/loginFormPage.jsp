<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko-kr">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
//login submit 
function loginCheck(){
	var id = document.getElementById('loginId').value;
	var pw = document.getElementById('loginPw').value;

	if(id == ""){
        alert("아이디를 입력하세요.");
        $("#id").focus(); 
        return false; 
    }
    if(pw == ""){
        alert("비밀번호 입력하세요.");
        $("#id").focus();
        return false;
    }
    $("#loginForm").submit();    


};
</script>
<style>
    body {
        background: #f8f8f8;
        padding: 60px 0;
    }
    
    #loginForm > div {
        margin: 15px 0;
    }
    
    #otherButton > div {
    	margin: 15px 0;
    }
</style>
<body>
<c:if test="${!empty param.message}">
		<input type="hidden" id="message" value="${param.message}">
		<script> 
			var msg = $('#message').val();	
			alert(msg);
		</script>
</c:if>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>LOGIN</h1><hr class="hrStyle">
</div>
    <div class="col-md-4 col-md-offset-3 col-sm-8 col-sm-offset-2" style="margin:auto;">
        <div class="panel panel-success">         
            <div class="panel-body">
                <form id="loginForm" name="loginForm" action="${pageContext.request.contextPath}/loginForm.do" method="post">
                    <div>
                    	<input type="text" class="form-control" id="loginId" name="loginId" placeholder="아이디"  autofocus>
                    </div>
                    <div>
                    	<input type="password" class="form-control" id="loginPw" name="loginPw" placeholder="패스워드">
                    </div>
                    <div>
                    	<input type="button" class="form-control btn btn-primary" id="login" name="login" value="로그인" onclick="loginCheck();" >
                    </div>    
                </form>
               	<div id="otherButton">
	               	<div>
	                	<input type="button" class="form-control btn btn-success" value="회원가입" onclick="location='${pageContext.request.contextPath}/joinPage.do'">               
	                </div>
	                <div>
	                	<input type="button" class="form-control btn btn-dark" value="홈으로" onclick="location='${pageContext.request.contextPath}/.do'">
	            	</div>
            	</div>
            </div>          
        </div>
    </div>
</div>	

</body>
</html>