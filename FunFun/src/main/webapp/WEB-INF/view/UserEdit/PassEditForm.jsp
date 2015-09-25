<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>

<form class="form-horizontal" onsubmit="return editSubmit(this)">
<div class="panel panel-success">
		<div class="panel-heading"><h3>비번수정</h3></div>

<div class="panel-body">
<div class="form-group">
<label for="id" class="col-sm-2 control-label">아이디</label>
<div class="col-sm-4">
<input type="text" class="form-control" value="${User_id }" readonly="readonly" id="id">
</div>
</div>

<div class="form-group">
<label for="pass" class="col-sm-2 control-label">비밀번호</label>
<div class="col-sm-4">
<input type="password" class="form-control" name="password" id="pass">
</div>
</div>

<div class="form-group">
<label for="pass_check" class="col-sm-2 control-label">비밀번호 확인</label>
<div class="col-sm-4">
<input type="password" class="form-control" name="password_check" id="pass_check">
</div>
</div>
</div>
<div class="panel-footer">
				<div class="form-group">
					<button class="btn btn-success">수정</button>

					<a href="main" class="btn btn-danger">취소</a>
				</div>
			</div>
</form>

</body>
<script type="text/javascript">
function editSubmit(f){
	var pass=document.getElementsByName("passwrd");
	var pass_check=document.getElementsBuName("password_check");
	console.log(pass[0].value+"  "+pass_check[0].value);
	if(pass[0].value!=pass_check[0].value){
		alert("비밀번호가 같지 않습니다.")
		f.pass_check.focus();
		return false;
	}
	
	alert("비밀번호 수정 성공");
	f.action='#';
	return true;
}
</script>
</html>