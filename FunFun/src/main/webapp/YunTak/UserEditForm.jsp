<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form onsubmit="return onSubmit(this)" method="post">
<label for="id">아이디</label>
<input type="text" readonly="readonly" value="hong"><br>
<label for="nick">닉네임</label>
<input type="text" value="" name="nick" id="nick"><br>
<label for="phone">연락처</label>
<input type="text" value="" name="phone" id="phone"><br>
<label for="address">주소</label>
<input type="text" value="" name="address" id="address"><br>
<label for="email">이메일</label>
<input type="text" value="" name="email" id="email"><br>
<label>추가1</label>
<input><br>
<label>추가2</label>
<input><br>
<label>추가3</label>
<input><br>
<button>수정</button> <a href="/main">취소</a>
</form>
</body>
<script type="text/javascript">
function onSubmit(f){
	console.log("수정1");	
	
	var nick=document.getElementById("nick").value;
	// f.[name].focuse();
	// name 기반
	if(nick==""||typeof nick==undefined){
		alert("닉네임 입력이 잘못되었습니다.")
		f.nick.focus();
		return false;
	}
	var phone=document.getElementById("phone").value;
	console.log(phone);
	if(phone==""){
		alert("연락처 입력이 잘못되었습니다. ");
		f.phone.focus();
		return false;
	}
	var address=document.getElementById("address").value;
	if(address==""){
		alert("주소 입력이 잘못되었습니다.");
		f.address.focus();
		return false;
	}

	var email=document.getElementById("email").value;
	if(email==""){
		alert("이메일 입력 잘못되었습니다.");
		f.email.focus();
		return false;
	}
	
	alert("수정");
	//f.action ='./';
	//return true;
	return false;
	

	
	
	
}
</script>
</html>