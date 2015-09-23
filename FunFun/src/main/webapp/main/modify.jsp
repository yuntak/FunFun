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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

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
		//f.action ='./';
		//return true;
		return false;

	}

	$(function() {
		
	$.validator.addMethod("numcheck", function(value, element) {
		return this.optional(element)
				|| /^\d{3}-\d{3,4}-\d{4}$/.test(value);

	}); 

	$.validator.addMethod("idcheck", function(value, element) {
		return this.optional(element)
				|| /[a-z|A-Z]/.test(value);

	});

	$(document).ready(function () {          
	    //확장옵션
	    $('#midifyform').validate({
	        // 테스트를 위하여 유효성 검사가 완료되어 submit을 처리하지 않음.(값이 true일경우)
	        debug : true,
	        //검사할 필드와 검사 항목의 나열
	        rules: {
				mb_num : {
					required:true,
					numcheck:true
				},
	            mb_adress2:{
	            	required:true,
	            },
				mb_nick:{
					required:true,
					minlength:6,
				},
				
	            mb_email: {
	                required:true, 
	                email:true
	            },
	            
	        },
	        // 검사를 충족하지 못할 경우 표시될 메시지의 나열
	        messages: {

	            mb_num : {
	            	required:"번호를 입력하시오.",   
	            	numcheck:"올바른 연락처를 입력해주십시오.",
	            },
	            mb_adress2 : {
	            	required:"주소를 입력하시오."
	            },
	            mb_nick:{
	            	required:"닉네임을 입력하시오."
	            	
				},
	            mb_email: {
	                required:"이메일을 입력하시오.",
	                email:"올바른 이메일을 입력하시오."
	            },
	        },
	              
	    });
	  }); //end ready()
	});
</script>	

</head>
<body>
	<%-- <jsp:include page="/headerfoot"></jsp:include> --%>
<nav>
	<form class="form-horizontal" onsubmit="return onSubmit(this)"
		method="post" id="midifyform">
		<div class="panel panel-success">
		<div class="panel-heading"><h2>
					<strong>정보수정</strong>
				</h2></div>	
				<div class="panel-body">

					<br>
					<br>
					<br>
					<div class="form-group">
						<label for="id" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-4">
						<input class="form-control" id="mb_id" name="mb_id" readonly="readonly" value="hong" ><br>
						</div>
					</div>

					<div class="form-group">
						<label for="nick" class="col-sm-2 control-label">닉네임</label> 
						<div class="col-sm-4">
						<input class="form-control" type="text" value=""
							 name="mb_nick" id="mb_nick"><br>
					</div>
					</div>

					
					<div class="form-group">
						<label for="phone" class="col-sm-2 control-label">연락처</label> 
						<div class="col-sm-4">
						<input type="text" value=""
							name="mb_num" id="mb_num" class="form-control"><br>
					</div>
					</div>

					<div class="form-group">
        <label for="sample4_postcode" class="col-sm-2 control-label">주소</label>
        
        
        <div class="col-xs-3">
        
        <input class="form-control"type="text" id="sample4_postcode" placeholder="우편번호">
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
							name="mb_email" id="mb_email" class="form-control"><br>
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

</html>