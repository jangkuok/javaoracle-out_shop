<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${member.name} 가입 성공</title>
</head>
<script type="text/javascript">
//새로고침 뒤로가기 방지 javascript
document.onkeydown = function(e){
    key = (e) ? e.keyCode : event.keyCode;
    if(key==8 || key==116){
       if(e){
          e.preventDefault();
       }
       else{
          event.keyCode = 0;
          event.returnValue = false;
       }
    }
};
</script>
<body>
<div class="container" style="margin-top: 110px;margin-bottom: 110px;">
<div>
<h1>JOIN SUCCESS</h1><hr>
</div>
     <div class="row">
        <div class="col-lg-6 mb-6" style="margin:auto;text-align:center;">
          <div class="card h-100">
            <h4 class="card-header">OUTSHOP에 오신걸 환영합니다.</h4>
            <div class="card-body">
            	${member.name}님 회원가입을 환영합니다.
            </div>
            <div class="card-footer" style="text-align:center;">
            	<a style="color:white;" href="${pageContext.request.contextPath}/" class="btn btn-dark">홈으로</a>          	      	
            </div>
          </div>
        </div>
	</div>
</div>
</body>
</html>