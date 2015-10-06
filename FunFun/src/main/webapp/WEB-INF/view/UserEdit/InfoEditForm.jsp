<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
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
<style type="text/css">


#infoedit {
	background: white;
}

#passedit {
	
}

#deledit {
	
}
#head_line{
font-size: 35px;
}
</style>


</head>
<body>
<nav>

	<form class="form-horizontal" onsubmit="return onSubmit(this)"
		method="post"><div class="panel panel-info">
			<div class="panel-heading">
				<div class="nav nav-pills">
					<ul class="nav nav-justified">
						<li ><a id="infoedit" href="">회원정보수정</a></li>
						<li id="passedit"><a href="">비밀번호수정</a></li>
						<li id="deledit"><a href="">회원탈퇴</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="panel panel-info">
		<div class="panel-heading">
					<strong id="head_line">정보수정</strong>
				</div></div>	
				<div class="panel-body">

					<br>
					<br>
					<br>
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-4">
						<input class="form-control" id="id" name="id" readonly="readonly" value="hong" ><br>
						</div>
					</div>

					<div class="form-group">
						<label for="nick" class="col-sm-2 control-label">닉네임</label> 
						<div class="col-sm-4">
						<input class="form-control" type="text" value=""
							 name="nick" id="nick"><br>
					</div>
					</div>

					
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">연락처</label> 
						<div class="col-sm-4">
						<input type="text" value=""
							name="phone" id="phone" class="form-control"><br>
					</div>
					</div>

					<!-- <div class="form-group">
						<label for="address" class="col-sm-2 control-label">주소</label> 
						<div class="col-sm-6">
						<input type="text" value=""
							name="address" id="address" class="form-control"><br>
					</div>
					</div> -->
					<div class="form-group">
        <label for="sample4_postcode" class="col-sm-2 control-label">주소</label>
        
        
        <div class="col-xs-3">
        
        <input class="form-control"type="text" id="sample4_postcode" name="sample4_postcode" placeholder="우편번호">
		</div>
		
		<input class="btn btn-info" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
		</div>
		
		<div class="form-inline">
		<label for="sample4_roadAddress" class="col-sm-2 control-label">  </label>
		<div class="form-group">
		
		<div class="col-xs-6">
		<input class="form-control"type="text" id="sample4_roadAddress" placeholder="도로명주소">
		</div>
		</div>
		
		<div class="form-group">
		<label for="sample4_jibunAddress" class="col-sm-1 control-label"></label>
		<div class="col-xs-5">
		<input class="form-control"type="text" id="sample4_jibunAddress" placeholder="지번주소">
		</div>
		</div>
	
		</div>

		<br>
        <div class="form-group">    
        	<label for="mb_adress2" class="col-sm-2 control-label">  </label>
            <div class="col-sm-5"> 
            <input class="form-control" type="text" id='mb_adress2' name='mb_adress2' required  maxlength=30 value='' placeholder="상세주소">              
      	</div>
  	</div>
					

					<div class="form-group">
						<label for="email" class="col-sm-2 control-label">이메일</label> 
						<div class="col-sm-4">
						<input type="text" value=""
							name="email" id="email" class="form-control"><br>
					</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">추가1</label> 
						<div class="col-sm-4">
						<input class="form-control"><br>
					</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label">추가2</label> 
						<div class="col-sm-4">
						<input class="form-control"><br>
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">추가3</label> 
						<div class="col-sm-4">
						<input class="form-control"><br>
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
</nav>		

</body>

<script type="text/javascript">
	function onSubmit(f) {
		console.log("수정1");

		var nick = document.getElementById("nick").value;
		// f.[name].focuse();
		// name 기반
		if (nick == "" || typeof nick == undefined) {
			alert("닉네임 입력이 잘못되었습니다.")
			f.nick.focus();
			return false;
		}
		var phone = document.getElementById("phone").value;
		console.log(phone);
		if (phone == "") {
			alert("연락처 입력이 잘못되었습니다. ");
			f.phone.focus();
			return false;
		}
		var address = document.getElementById("address").value;
		if (address == "") {
			alert("주소 입력이 잘못되었습니다.");
			f.address.focus();
			return false;
		}

		var email = document.getElementById("email").value;
		if (email == "") {
			alert("이메일 입력 잘못되었습니다.");
			f.email.focus();
			return false;
		}

		alert("수정");
		f.action ='./main';
		//return true;
		return false;

	}
</script>
</html>