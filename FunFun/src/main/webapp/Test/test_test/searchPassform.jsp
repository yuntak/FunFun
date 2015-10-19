<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<div class="panel-body" >
		<form class="form-horizontal" method="post" action="serachPass.jsp">
			<div class="form-group">
				<sform:label for="mb_id" class="col-sm-2 control-label" path="id">아이디</sform:label>
				<div class="col-sm-6">
					<sform:input class="form-control" placeholder="User id" size="20"
						id="mb_id" name="mb_id"   path="id" />
					<p class="help-block">아아디는 최소4자 이상 20자 이하입니다.</p>
					
					<p class="help-block">
						<span id="msg_mb_id"></span>
					</p>
				</div>
			</div>
			
			<div class="form-group" id="form">
			<label for="mb_email" class="col-sm-2 control-label" path="email">E-mail</label>
			<div class="col-sm-6">
				<input class="form-control" type="text" id='mb_email'
					name='mb_email'  style="ime-mode: disabled" size="38"
					maxlength="50" value='' placeholder="E-mail" onblur="" path="email" />
				<p class="help-block">
					아이디, 비밀번호 분실 시 본인확인용으로 사용되므로<br>유효한 이메일 계정으로 입력하시기 바랍니다.
				</p>
				
			</div>
		</div>

		<div style="margin-left: 20%;">
		 <input class="btn btn-info" onclick="newDoc()" value="메인" style="width: 60px;"> 
         <input type = "submit" class="btn btn-info" value = "찾기">
	    </div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
<script>
	function newDoc() {
    window.location.assign("<%=request.getContextPath()%>/main");
}
</script>
</html>