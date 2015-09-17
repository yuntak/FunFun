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

	
	<form class="form-horizontal" role="form" name=fregisterform id=fregisterform method=post onsubmit="return user(this);" enctype="multipart/form-data" autocomplete="off">

	<div class="panel panel-default">
    <div class="panel-heading"><h4><strong>회원가입</strong></h4>
    </div>
    <div class="panel-body">

        <div class="form-group">
            <label for="mb_id" class="col-sm-2 control-label">아이디</label>
            <div class="col-sm-6">
                <input class="form-control" placeholder="User id" maxlength=20 size=20 id='mb_id' name="mb_id" required style="ime-mode:disabled" value="" 
                                onblur='reg_mb_id_check()'>
                                    <p class="help-block"></p>
      	    				<p class="help-block"><span id="msg_mb_id"></span></p>
                            </div>
        </div>
    
        <div class="form-group">
            <label for="mb_password" class="col-sm-2 control-label">패스워드</label>
            <div class="col-sm-6">
                <INPUT class="form-control" type="password" name="mb_pass" id="mb_pass" 
                  style="ime-mode:disabled" size=20 minlength=8 maxlength=20 required itemname="패스워드" placeholder="Password">
            </div>
        </div>

        <div class="form-group">
            <label for="mb_password_re" class="col-sm-2 control-label">패스워드확인</label>
            <div class="col-sm-6">
                <INPUT class="form-control" type="password" id="mb_pass_re" name="mb_pass_re"
                 style="ime-mode:disabled" size=20 minlength=8 maxlength=20 required itemname="패스워드 확인" placeholder="Password를 한번 더 입력">
                <p class="help-block">비밀번호는 8자 이상으로 입력하세요.</p>
            </div>
        </div>


			<div class="form-inline">
            <label for="mb_num" class="col-sm-2 control-label">연락처</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" id='mb_num' name='mb_num' required  maxlength=3 value='' placeholder="번호입력">
                
            </div>
            <div class="col-sm-2">
                <input class="form-control" type="text" id='mb_num' name='mb_num' required  maxlength=4 value='' placeholder="번호입력">
                
            </div>
            <div class="col-sm-2">
                <input class="form-control" type="text" id='mb_num' name='mb_num' required  maxlength=4 value='' placeholder="번호입력">
                
            </div>
        </div>          
   
     
        <div class="form-group">
		    <label for="mb_adress" class="col-sm-5 control-label">주소</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id='mb_adress' name='mb_adress' required  maxlength=50 value='' placeholder="주소입력">              
            </div>
      	</div>
      	 <div class="form-group">
		    <label for="mb_adress2" class="col-sm-2 control-label"></label>
            <div class="col-sm-4">
                <input class="form-control" type="text" id='mb_adress2' name='mb_adress2' required  maxlength=30 value='' placeholder="상세주소">              
            </div>
      	</div>
        
        
        
                <input type=hidden name=mb_nick_default value=''>
        <div class="form-group">
            <label for="mb_nick" class="col-sm-2 control-label">닉네임</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id='mb_nick' name='mb_nick' required hangulalphanumeric maxlength=20 value='' placeholder="Nick name" onblur="reg_mb_nick_check();">
                    <p class="help-block">공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상)<br>
                    별명을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.</p>
      	    				<p class="help-block"><span id="msg_mb_nick"></span></p>
            </div>
        </div>
        
        
        
        <input type=hidden name='old_email' value=''>
        <div class="form-group">
            <label for="mb_email" class="col-sm-2 control-label">E-mail</label>
            <div class="col-sm-6">
                <input class="form-control" type="text" id='mb_email' name='mb_email' required style="ime-mode:disabled" size=38 maxlength=100 value='' placeholder="E-mail"
                    onblur="reg_mb_email_check()">
                                    <p class="help-block">아이디, 비밀번호 분실 시 본인확인용으로 사용되므로<br>유효한 이메일 계정으로 입력하시기 바랍니다.</p>
      	    				<p class="help-block"><span id="msg_mb_email"></span></p>
      	    		                                                            </div>
        </div>
     
        
        <div class="form-group">
            <label for="mb_mailling" class="col-sm-2 control-label">메일링서비스</label>
            <div class="col-sm-6">
            <div class="checkbox">
						<label>
                <input type="checkbox" name="mb_mailling" id="mb_mailling" value='1' checked>
                정보 메일을 받겠습니다.
						</label>
						</div>
            </div>
        </div>

        
                <input type=hidden name=mb_open_default value=''>
       
                <div class="form-group">
            <label for="wr_key" class="col-sm-2 control-label">
                <script type="text/javascript" src="../zmSpamFree/zmspamfree.js"></script>
                <img id="zsfImg">
            </label>
          
        </div>        
        
        
    </div>
    <div class="panel-footer">
            <button class="btn btn-success">가 입</button>
    		 <a href="javascript:" class="btn btn-danger" onClick="history.go(-1);">취소</a>
     
    </div>

    </div>

</form> 

	
</body>

<script>
function user(f)
{
    var pass1 = document.getElementsByName("mb_pass");
	var pass2 = document.getElementsByName("mb_pass_re");
	console.log(pass1[0]);
	
	console.log(pass2[0]);
	if(!(pass1[0].value == pass2[0].value)){
		alert("비밀번호가 같지않습니다.");
		return false;
	}
	 
	f.action ='main';
	return true;
}
</script>

</html>