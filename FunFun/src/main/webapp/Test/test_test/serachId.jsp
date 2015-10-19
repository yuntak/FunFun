<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>
<body>
	<form method = "post" action = "main.jsp">
<%
            
            {
%>
                  <%= %>님에 아이디는 <b><%=  %></b> 입니다.
                  <input type = "submit" value = "메인으로..">
<%
            }
           

            {
%>
                  비밀번호 또는 이메일 틀렸습니다.
                  <input type = "button" value = "다시 입력하기" onclick = "newDoc()">
<%
            }
%>
</form>


	
</body>
<script>
	function newDoc() {
    window.location.assign("<%=request.getContextPath()%>/searchIdform.jsp");
}
</script>
</html>