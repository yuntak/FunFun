<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
.panel-heading{
	font-size: 40px;
}

.body{
	font-size: 20px;
}

</style>
</head>
<body>

<form class="form-horizontal">
  <div class="container">
  
		
<c:set value="df" var="id"></c:set>

<c:choose>
	
	
	
	<c:when test="${!empty id }">	
	

	<div class="panel panel-success">
			<div class="panel-heading">
				
					<strong>회원가입 성공.</strong>
								
			</div>
	
	</div>
	<div class="body">
	ID : ${id }<br>
	회원가입 하셨습니다.
	</div>
	</c:when>
	
	<c:otherwise>
	<div class="panel panel-success">
			<div class="panel-heading">
					<div class="body">
					<strong>회원가입 실패.</strong>
					</div>			
			</div>
	
	</div>
	회원가입 실패.
	</c:otherwise>
	
</c:choose>

<br>
<br>
<br>

<div class="panel-footer">
<div>
	<button class="btn btn-info">확인</button>
	
</div>

</div>

</div>
</form>
</body>
</html>