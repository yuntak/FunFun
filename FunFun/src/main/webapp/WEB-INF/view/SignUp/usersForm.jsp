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
		/*  $.validator.addMethod("EMail_dupl_ajax", function(value,element) {
			console.log(value);
			//var mb_mailing = value;
			console.log(mb_mailing);
			var url = "./EMail_dupl_ajax";
			result = false;
			$.ajax({
				type : "post",
				url : url,
				data : {
					mb_mailing : value
				},
				success : function(response) {
					if (response == "true") {
						console.log("not dupl");
						result = true;
						console.log(result);

					} else {

						console.log("dupl");
						result = false;
						console.log(result);
					}

				},
				error : function(request, status, error) {
					console.log("ajax fail");
					alert("code:" + request.status + "\n" + "message:"
							+ request.responseText + "\n" + "error:" + error);
				}
			});
			return this.optional(element)|| true;
		}, "이메일이 중복 되었습니다." );
 */
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
						remote:{type:"post",url:"./Id_dupl_ajax"}
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
						minlength : 4,
						maxlength : 10,
						remote:{type:"post",url:"./Nick_dupl_ajax"}
					},

					mb_email : {
						required : true,
						email : true,
						remote:{type:"post",url:"./EMail_dupl_ajax"}
					 
					},

				},
				// 검사를 충족하지 못할 경우 표시될 메시지의 나열
				messages : {
					mb_id : {
						required : "아이디를 입력하시오.",
						minlength : "아이디 {0}자 이상 입력해주세요!",
						maxlength :"아이디 {0}자 이하로 입력해주세요 ",
						idcheck : "영어만 입력가능합니다",
						remote : "ID가 중복 되었습니다." 

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
						
						required : "닉네임을 입력하시오.",
						minlength : "닉네임 {0}자 이상 입력해주세요!",
						maxlength : "닉네임 {0}자 이하로 입력해주세요 ",
						remote:"닉네임이 중복 되었습니다."

					},
					mb_email : {
						required : "이메일을 입력하시오.",
						email : "올바른 이메일을 입력하시오.",
					 remote : "이메일이 중복 되었습니다" 
					},
				},

			});
		}); //end ready()
	});
</script>

</head>

<body>
	<form class="form-horizontal" name=fregisterform id=fregisterform
		method=post 
		onsubmit="SignUpTry(this);"
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
						<p class="help-block">아아디는 최소4자 이상 20자 이하입니다.</p>

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
<p class="help-block">ex)010-1234-5678</p>
					</div>

				</div>

				<div class="form-group">
					<label for="sample4_postcode" class="col-sm-2 control-label">주소</label>


					<div class="col-xs-3">

						<input class="form-control" type="text" id="sample4_postcode"
							placeholder="우편번호">
					</div>

					<input  class="btn btn-info" type="button"
						onclick="sample4_execDaumPostcode()" value="우편번호 찾기" ><br>
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
			<button class="btn btn-success" >가 입</button>
			<a href="javascript:" class="btn btn-danger"
				onClick="history.go(-1);">취소</a>

		</div>



	</form>



</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script >

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}

</script>
<script type="text/javascript">
function SignUpTry(f){
	f.action='SignUpResult';
	};

</script>

</html>