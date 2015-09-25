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
<title>Insert title here</title>

<style>
p{
	font-size: 20px;
}
#infoedit{

}
#passedit{
background: white;
}
#deledit{

}
</style>

</head>
<body>

	<form class="form-horizontal" id="editForm" name="editForm" >

		<div class="panel panel-success">
			<div class="panel-heading">
				<div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
  <li id="infoedit">
   <a href="">회원정보수정</a></li>
   <li id="passedit">
   <a href="">비밀번호수정</a></li>
   <li id="deledit">
   <a href="">회원탈퇴</a></li>
   </ul>

</div>
			</div>
		</div>
		
			<div class="panel-body">
			
			
			
				<div class="form-group">
					<label for="id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-4">
						<input type="text" class="form-control" value="${User_id }"
							 id="id" readonly="readonly">
					</div>
				</div>

				<div class="form-group">
					<label for="pass" class="col-sm-2 control-label">비밀번호</label>
					<div class="col-sm-4">
						<input type="password" class="form-control" name="pass"
							id="pass">
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

					<a href=".main" class="btn btn-danger">취소</a>
				</div>
			</div>
	</form>
</body>
</html>