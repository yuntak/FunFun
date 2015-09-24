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
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- jQuery.validate 플러그인 삽입 -->
<script
	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.min.js"></script>

<script>
	$(function() {

		$.validator.addMethod("numcheck", function(value, element) {
			return this.optional(element)
					|| /^\d{3}-\d{3,4}-\d{4}$/.test(value);
		});

<<<<<<< HEAD
$.validator.addMethod("idcheck", function(value, element) {
	return this.optional(element)
			|| /[a-z|A-Z]/.test(value);
});
$.validator.addMethod("id_dupl_check",function(value,element){
	
	
	
	return false;
});
$(document).ready(function () {          
    //확장옵션
    $('#fregisterform').validate({
        // 테스트를 위하여 유효성 검사가 완료되어 submit을 처리하지 않음.(값이 true일경우)
        debug : true,
        //검사할 필드와 검사 항목의 나열
        rules: {
            mb_id:{
                required:true, 
                minlength:6,
                maxlength:20,
                idcheck:true
            } ,
            mb_pass: {
            	required:true,
            	minlength:8,
            },
            mb_pass_re: {
                required:true, 
                minlength:8,
                equalTo:'#mb_pass'
            },               
           
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
            mb_id: {
                 required:"아이디를 입력하시오.",
                 minlength: "아이디는 {0}자 이상 입력해주세요!",
                 maxlength:"아이디는 {0}자 이하 입력해주세요!",
                 idcheck:"영어만 입력가능합니다"
            },
            mb_pass: {
            	required:"암호를 입력하시오.",
            	minlength: "비밀번호는 {0}자 이상 입력해주세요!",             
            },
            mb_pass_re: {
                required: "암호확인를 입력하시오.",
                minlength: "비밀번호는 {0}자 이상 입력해주세요!",            
                equalTo:"암호를 다시 확인하세요" 
            },  
            mb_num : {
            	required:"번호를 입력하시오.",   
            	numcheck:"000-0000-0000 형태로 입력해주세요.",
            	
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
=======
		$.validator.addMethod("idcheck", function(value, element) {
			return this.optional(element) || /[a-z|A-Z|0-9]/.test(value);
		});
		/* $.validator.addMethod("id_dupl_check",function(value){
		 console.log(value);
		 var myid=value;
		 console.log(myid);
		 var url="./Id_dupl_ajax";
		 result=false;
		 $.ajax({
		 type:"post",
		 url:url,
		 data:{myid:id},
		 success:function(response){
		 if(response=="true"){
		 result=true;
		 }else{
		 result=false;
		 }
		
		 },
		 error:function(request,status,error){
		 console.log("ajax fail");
		 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		 }
		 });
		 return result;*/
		$.validator.addMethod("EMail_dupl_ajax", function(value) {
			console.log(value);
			var mb_mailling = value;
			console.log(mb_mailing);
			var url = "./EMail_dupl_ajax";
			result = false;
			$.ajax({
				type : "post",
				url : url,
				data : {
					mb_mailling : mb_mailling
				},
				success : function(response) {
					if (response == "true") {
						console.log("not dupl");
						result = true;
>>>>>>> branch 'master' of https://github.com/yuntak/FunFun.git

					} else {

						console.log("dupl");
						result = false;

					}

				},
				error : function(request, status, error) {
					console.log("ajax fail");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
			return result;
		});

		$(document).ready(function() {
			//확장옵션
			$('#fregisterform').validate({
				// 테스트를 위하여 유효성 검사가 완료되어 submit을 처리하지 않음.(값이 true일경우)
				debug : true,
				//검사할 필드와 검사 항목의 나열
				rules : {
					mb_id : {
						required : true,
						minlength : 4,
						maxlength : 20,
						idcheck : true,
					/*  id_dupl_check:true */
					},
					mb_pass : {
						required : true,
						minlength : 8,
					},
					mb_pass_re : {
						required : true,
						minlength : 8,
						equalTo : '#mb_pass'
					},

					mb_num : {
						required : true,
						numcheck : true
					},
					mb_adress2 : {
						required : true,
					},
					mb_nick : {
						required : true,
						minlength : 6,
					},

					mb_email : {
						required : true,
						email : true,
						EMail_dupl_ajax : true
					},

				},
				// 검사를 충족하지 못할 경우 표시될 메시지의 나열
				messages : {
					mb_id : {
						required : "아이디를 입력하시오.",
						minlength : "아이디는 {0}자 이상 입력해주세요!",
						idcheck : "영어만 입력가능합니다",
					//id_dupl_check:"아이디가 중복 되었습니다."

					},
					mb_pass : {
						required : "암호를 입력하시오.",
						minlength : "비밀번호는 {0}자 이상 입력해주세요!",
					},
					mb_pass_re : {
						required : "암호확인를 입력하시오.",
						minlength : "비밀번호는 {0}자 이상 입력해주세요!",
						equalTo : "암호를 다시 확인하세요"
					},
					mb_num : {
						required : "번호를 입력하시오.",
						numcheck : "올바른 연락처를 입력해주십시오.",
					},
					mb_adress2 : {
						required : "주소를 입력하시오."
					},
					mb_nick : {
						required : "닉네임을 입력하시오."

					},
					mb_email : {
						required : "이메일을 입력하시오.",
						email : "올바른 이메일을 입력하시오.",
						EMail_dupl_ajax : "이메일이 중복 되었습니다"
					},
				},

			});
		}); //end ready()
	});
</script>

</head>

<body>
	<form class="form-horizontal" name=fregisterform id=fregisterform
		method=post onsubmit="return user(this);"
		enctype="multipart/form-data" autocomplete="off">

		<div class="panel panel-info">
			<div class="panel-heading">
				<h4>
					<strong>회원가입</strong>
				</h4>
			</div>

			<div class="panel-body">

				<div class="form-group">
					<label for="mb_id" class="col-sm-2 control-label">아이디</label>
					<div class="col-sm-6">
						<input class="form-control" placeholder="User id" size=20
							id='mb_id' name="mb_id" required value="">
						<p class="help-block">아아디는 최소6자 이상 20자 이하입니다.</p>

						<p class="help-block">
							<span id="msg_mb_id"></span>
						</p>
					</div>
				</div>

				<div class="form-group">
					<label for="mb_password" class="col-sm-2 control-label">패스워드</label>
					<div class="col-sm-6">
						<INPUT class="form-control" type="password" name="mb_pass"
							id="mb_pass" size=20 maxlength=20 required placeholder="Password">
					</div>
				</div>

				<div class="form-group">
					<label for="mb_password_re" class="col-sm-2 control-label">패스워드확인</label>
					<div class="col-xs-5">
						<INPUT class="form-control" type="password" id="mb_pass_re"
							name="mb_pass_re" size=20 maxlength=20 required
							placeholder="Password를 한번 더 입력">
						<p class="help-block">비밀번호는 8자 이상으로 입력하세요.</p>
					</div>
				</div>


				<div class="form-group">
					<label for="mb_num" class="col-sm-2 control-label">연락처</label>
					<div class="col-xs-5">
						<input class="form-control" type="text" id='mb_num' name='mb_num'
							required maxlength=13 placeholder="번호입력" value="">

					</div>

				</div>

				<div class="form-group">
					<label for="sample4_postcode" class="col-sm-2 control-label">주소</label>


					<div class="col-xs-3">

						<input class="form-control" type="text" id="sample4_postcode"
							placeholder="우편번호">
					</div>

					<input class="btn btn-info" type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				</div>

				<div class="form-inline">
					<label for="sample4_roadAddress" class="col-sm-1 control-label">
					</label>
					<div class="form-group">
						<label for="sample4_roadAddress" class="col-sm-7 control-label">
						</label>
						<div class="col-xs-3">
							<input class="form-control" type="text" id="sample4_roadAddress"
								placeholder="도로명주소">
						</div>
					</div>

					<div class="form-group">
						<label for="sample4_jibunAddress" class="col-sm-6 control-label"></label>
						<div class="col-xs-3">
							<input class="form-control" type="text" id="sample4_jibunAddress"
								placeholder="지번주소">
						</div>
					</div>

				</div>

				<span id="guide" style="color: #999"></span> <br>
				<div class="form-group">
					<label for="mb_adress2" class="col-sm-2 control-label"> </label>
					<div class="col-sm-5">
						<input class="form-control" type="text" id='mb_adress2'
							name='mb_adress2' required maxlength=30 value=''
							placeholder="상세주소">
					</div>
				</div>
			</div>


			<div class="form-group">
				<label for="mb_nick" class="col-sm-2 control-label">닉네임</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" id='mb_nick' name='mb_nick'
						required maxlength=20 value='' placeholder="Nick name">
					<p class="help-block"></p>
					<p class="help-block">
						<span id="msg_mb_nick"></span>
					</p>
				</div>
			</div>


			<div class="form-group" id="form">
				<label for="mb_email" class="col-sm-2 control-label">E-mail</label>
				<div class="col-sm-6">
					<input class="form-control" type="text" id='mb_email'
						name='mb_email' required style="ime-mode: disabled" size=38
						maxlength=100 value='' placeholder="E-mail"
						onblur="reg_mb_email_check()">
					<p class="help-block">
						아이디, 비밀번호 분실 시 본인확인용으로 사용되므로<br>유효한 이메일 계정으로 입력하시기 바랍니다.
					</p>
					<p class="help-block">
						<span id="msg_mb_email"></span>
					</p>
				</div>
			</div>


			<div class="form-group">
				<label for="mb_mailling" class="col-sm-2 control-label">메일링서비스</label>
				<div class="col-sm-6">
					<div class="checkbox">
						<label> <input type="checkbox" name="mb_mailing"
							id="mb_mailing" value='1' checked> 정보 메일을 받겠습니다.
						</label>
					</div>
				</div>
			</div>


			<input type=hidden name=mb_open_default value=''>

			<div class="form-group">
				<label for="wr_key" class="col-sm-2 control-label"> <script
						type="text/javascript" src="../zmSpamFree/zmspamfree.js"></script>
					<img id="zsfImg">
				</label>

			</div>



		</div>
		<div class="panel-footer">
			<button class="btn btn-success">가 입</button>
			<a href="javascript:" class="btn btn-danger"
				onClick="history.go(-1);">취소</a>

		</div>



	</form>



</body>

</html>