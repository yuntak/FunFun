<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<label for="agree1">동의1</label>
<input type="checkbox" name="agree1" id="agree1" value="1">

<label for="agree2">동의2</label>
<input type="checkbox" name="agree2" id="agree2" value="1">

<button id="reg">동의합니다</button>
</body>
<script type="text/javascript">
function agree(){
	alert("agree function call");
	var agree1 = document.getElementsByName("agree1");
	if(agree1.checked){
		alert("hello");
	}
};

</script>
</html>