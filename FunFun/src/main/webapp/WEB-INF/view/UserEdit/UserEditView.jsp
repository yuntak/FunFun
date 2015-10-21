<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
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
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>
<style>
p{
	font-size: 20px;
}#infoedit {
	background: white;
}

#passedit {
	
}

#deledit {
	
}
.panel-body{
	
}
</style>

</head>
<body>

	<sform:form class="form-horizontal" id="editForm" name="editForm" modelAttribute="userEdit" action="../myinfo/info">

		<div class="panel panel-info">
			<div class="panel-heading">
				<div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
  <li>
   <a id="infoedit" href="../myinfo/info">회원정보수정</a></li>
   <li>
   <a href="../myinfo/pass">비밀번호수정</a></li>
   <li>
   <a href="../myinfo/delete">회원탈퇴</a></li>
   </ul>

</div>
			</div>
		</div>
		
			<div class="panel-body">
			
			
			
				<div class="form-group">
					<sform:label for="id" class="col-sm-2 control-label" path="id">아이디</sform:label>
					<div class="col-sm-4" style="width: 300px;"> 
						<sform:input type="text" class="form-control" value="${FunFunUser.id }"
							 id="id" readonly="true" path="id"/>
					</div>
				</div>

				<div class="form-group" >
					<sform:label for="pass" class="col-sm-2 control-label" path="pass">비밀번호</sform:label>
					<div class="col-sm-4" style="width: 300px;">
						<sform:input type="password" class="form-control" name="pass"
							id="pass" path="pass"/>
					</div>
				</div>
				<div class="form-group" id="msg_box" style="display: block">
											<label for="log" class="control-label col-sm-3"></label>
											<div class="col-sm-8">
												<div id="wrap"
											>
													<span id="result"
														style="font-size: 15px; font-weight: bold; color:#FF3030;">비밀번호가 틀립니다.</span>
												</div>
											</div>
										</div>
			</div>
			<div class="panel-footer">
				<div class="form-group">
					<button class="btn btn-success">확인</button>

					<a href="../main" class="btn btn-danger" style="margin-bottom: 5mm;">취소</a>
				</div>
			</div>
	</sform:form>
</body>
</html>