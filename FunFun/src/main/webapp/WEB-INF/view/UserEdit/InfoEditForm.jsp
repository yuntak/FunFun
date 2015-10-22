<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script	src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.14.0/jquery.validate.js"></script>

<script>
$(document).ready(function() {
 	
	  $.validator.addMethod("numcheck", function(value, element) {
		return this.optional(element)
				|| /^\d{3}-\d{3,4}-\d{4}$/.test(value);
	});  
	$('#fregisterform').validate({
		// 테스트를 위하여 유효성 검사가 완료되어 submit을 처리하지 않음.(값이 true일경우)
		debug : true,
		//검사할 필드와 검사 항목의 나열
		rules : {

			nickname : {
				required : true,
				minlength : 4,
				maxlength : 10,
				remote : {
					type : "post",
					url : "./Nick_dupl_ajax"
				}
			},

			cellphone : {
				required : true,
				numcheck : true
			},
			address : {
				required : true,
			},

			email : {
				required : true,
				email : true,
				remote : {
					type : "post",
					url : "./EMail_dupl_ajax"
				}

			},
			mail_no :{
				required : true
			},
			road_addr:{
				required : true
			},
			
			loca_addr:{
				required : true
			},
			

		},
		// 검사를 충족하지 못할 경우 표시될 메시지의 나열
		messages : {

			
			nickname : {

				required : "닉네임을 입력하시오.",
				minlength : "닉네임 {0}자 이상 입력해주세요!",
				maxlength : "닉네임 {0}자 이하로 입력해주세요 ",
				remote : "닉네임이 중복 되었습니다."

			},
			cellphone : {
				required : "번호를 입력하시오.",
				numcheck : "올바른 연락처를 입력해주십시오.",
			},
			address : {
				required : "주소를 입력하시오."
			},
			email : {
				required : "이메일을 입력하시오.",
				email : "올바른 이메일을 입력하시오.",
				remote : "이메일이 중복 되었습니다"
			},
			mail_no :{
				required : "우편번호를 입력하세요."
			},
			road_addr:{
				required : "도로명 주소를 입력하세요."
			},
			
			loca_addr:{
				required : "지번 주소를 입력하세요."
			},
			
		}, submitHandler: function(form) {
		    form.submit();
		  }

	});
	
});


function sample4_execDaumPostcode() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소 변수

					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample4_roadAddress').value = fullRoadAddr;
					document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

					// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
					if (data.autoRoadAddress) {
						//예상되는 도로명 주소에 조합형 주소를 추가한다.
						var expRoadAddr = data.autoRoadAddress
								+ extraRoadAddr;
						document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
								+ expRoadAddr + ')';

					} else if (data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;
						document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
								+ expJibunAddr + ')';

					} else {
						document.getElementById('guide').innerHTML = '';
					}
				}
			}).open();
}
</script>
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

<nav>

	<sform:form class="form-horizontal" name="fregisterform" id="fregisterform" onsubmit="return onSubmit(this)"
		action="" method="post" modelAttribute="userEdit"><div class="panel panel-info">
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
						<sform:label for="id" class="col-sm-2 control-label" path="id">아이디</sform:label>
						<div class="col-sm-4">
						<sform:input class="form-control" path="id" readonly="true" /><br>
						</div>
					</div>

					<div class="form-group">
						<sform:label for="nickname" class="col-sm-2 control-label"  path="nickname">닉네임</sform:label> 
						<div class="col-sm-4">
						<sform:input class="form-control" type="text" value=""
							path="nickname" name="nickname" id="nickname"/><br>
					</div>
					</div>

					
					<div class="form-group">
						<sform:label for="cellphone" class="col-sm-2 control-label" path="cellphone">연락처</sform:label> 
						<div class="col-sm-4">
						<sform:input type="text" value=""
						   path="cellphone" class="form-control"/><br>
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
        <div class="form-group">
				<sform:label for="sample4_postcode" class="col-sm-2 control-label" path="mail_no">주소</sform:label>


				<div class="col-xs-3">

					<sform:input class="form-control" type="text" id="sample4_postcode"
						name="sample4_postcode" placeholder="우편번호" path="mail_no" />
				</div>

				<input class="btn btn-info" type="button" id="post_serch"
					name="post_serch" onclick="sample4_execDaumPostcode()"
					value="우편번호 찾기"><br>
			</div>

			<div class="form-inline">
				<sform:label for="sample4_roadAddress" class="col-sm-1 control-label" path="road_addr">
				</sform:label>
				<div class="form-group">
					
					<sform:label for="sample4_roadAddress" class="col-sm-7 control-label" path="road_addr">
					</sform:label>
					<div class="col-xs-3">
						<sform:input class="form-control" type="text" id="sample4_roadAddress"
							name="sample4_roadAddress" placeholder="도로명주소" path="road_addr" />
					</div>
				</div>

				<div class="form-group">
					<sform:label for="sample4_jibunAddress" class="col-sm-6 control-label" path="loca_addr"></sform:label>
					<div class="col-xs-3">
						<sform:input class="form-control" type="text" id="sample4_jibunAddress"
							name="sample4_jibunAddress" placeholder="지번주소" path="loca_addr" />
					</div>
				</div>

			</div>

			<span id="guide" style="color: #999"></span> <br>
			<div class="form-group">
				<sform:label for="mb_adress2" class="col-sm-2 control-label" path="address"> </sform:label>
				<div class="col-sm-5">
					<sform:input class="form-control" type="text" id='mb_adress2'
						name='mb_adress2' maxlength="30" value=''
						placeholder="상세주소" path="address"/>
				</div>
			</div>
					

					<div class="form-group">
						<sform:label for="email" class="col-sm-2 control-label" path="email">이메일</sform:label> 
						<div class="col-sm-4">
						<sform:input type="text" value=""
							path="email" class="form-control"/><br>
					</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label" >추가1</label> 
						<div class="col-sm-4">
						<input class="form-control" name="plus1" id="plus1"/><br>
					</div>
					</div>
					
					
					<div class="form-group">
						<label class="col-sm-2 control-label" >추가2</label> 
						<div class="col-sm-4">
						<input class="form-control" /><br>
					</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label" >추가3</label> 
						<div class="col-sm-4">
						<input class="form-control" /><br>
					</div>
					</div>
				</div>
				</div>
				

					<div class="panel-footer">
				<div class="form-group">
					<button class="btn btn-success">수정</button>

					 <input class="btn btn-danger" onclick="newDoc()" value="취소" style="width: 60px;"/>
				</div>
			</div>
			
		
	</sform:form>
</nav>		



<script type="text/javascript">

function newDoc() {
window.location.assign("<%=request.getContextPath()%>/main");
}

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
