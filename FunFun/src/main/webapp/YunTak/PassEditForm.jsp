<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form onsubmit="return editSubmit(this)">
<label for="id">아이디</label><input type="text" value="${User_id }" readonly="readonly" id="id">
<label for="pass">비밀번호</label><input type="password" name="password" id="pass">
<label for="pass_check">비밀번호 확인</label><input type="password" name="password_check" id="pass_check">
<button>수정</button><a href="<%=request.getContextPath() %>/index">취소</a>
</form>
</body>
<script type="text/javascript">
function editSubmit(f){
	var pass=document.getElementsByName("passwrd");
	var pass_check=document.getElementsBuName("password_check");
	console.log(pass[0].value+"  "+pass_check[0].value);
	if(pass[0].value!=pass_check[0].value){
		alert("비밀번호가 같지 않습니다.")
		f.pass_check.focus();
		return false;
	}
	
	alert("비밀번호 수정 성공");
	f.action='#';
	return true;
}
</script>
</html>