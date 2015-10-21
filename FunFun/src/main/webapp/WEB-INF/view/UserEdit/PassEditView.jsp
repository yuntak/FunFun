<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<title>Insert title here</title>
<script>
$('#editForm').validate({
	// 테스트를 위하여 유효성 검사가 완료되어 submit을 처리하지 않음.(값이 true일경우)
	debug : true,
	//검사할 필드와 검사 항목의 나열
	rules : {

		pass : {
			required : true,
			minlength : 8,
		},
	

	},
	// 검사를 충족하지 못할 경우 표시될 메시지의 나열
	messages : {

		pass : {
			required : "암호를 입력하시오.",
			minlength : "비밀번호는 {0}자 이상 입력해주세요!",
		},
		
	}, submitHandler: function(form) {
	    form.submit();
	  }

});






	
</script>

<style>
p {
	font-size: 20px;
}

#infoedit {
	
}

#passedit {
	background: white;
}

#deledit {
	
}
</style>

</head>
<body>

	<form class="form-horizontal" id="editForm" name="editForm" action="SignUpResult">
		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="nav nav-pills">
					<ul class="nav nav-justified">
						<li id="infoedit"><a href="">회원정보수정</a></li>
						<li id="passedit"><a href="">비밀번호수정</a></li>
						<li id="deledit"><a href="">회원탈퇴</a></li>
					</ul>

				</div>
			</div>
		</div>
		<div class="panel-body">
			<div class="form-group">
				<label for="id" class="col-sm-2 control-label">아이디</label>
				<div class="col-sm-4" style="width: 300px;">
					<input type="text" class="form-control" value="${FunFunUser.id }" id="id"
						readonly="readonly">
				</div>
			</div>

			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-4" style="width: 300px;">
					<input type="password" class="form-control" name="pass" id="pass">
				</div>
			</div>
			<div class="form-group" id="msg_box" style="display: block">
				<label for="log" class="control-label col-sm-3"></label>
				<div class="col-sm-8">
					<div id="wrap">
						<span id="result"
							style="font-size: 15px; font-weight: bold; color: #FF3030;">비밀번호가
							틀립니다.</span>
					</div>
				</div>
			</div>
		</div>
		<div class="panel-footer">
			<div class="form-group">
				<button class="btn btn-success">확인</button>
				<a href=".main" class="btn btn-danger">취소</a>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript" src="./js/PassEditPassCheck.js"></script>
<script type="text/javascript" src"<%=request.getContextPath() %>"></script>
</html>