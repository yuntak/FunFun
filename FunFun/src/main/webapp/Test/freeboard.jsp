<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<style type="text/css">
p {
	font-size: 30px;
}

<style> 

#name:link {color:#A8A88E;font-size:10pt;text-decoration:none;} 
#name:visited {color:#B4FF6A;font-size:10pt;text-decoration:none;} 
#name:active {color:#A8A88E;font-size:10pt;text-decoration:none;} 
#name:hover {color:#A8A88E;font-size:10pt;text-decoration:underline;} 
 .title{
 	width:300px;
 	height:37px;
 	text-align: center;
 }
 .ttr{
 	width:30px;
 	height:37px;
 }
</style>  
</head>

<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/view/freeboard/freeboard.jsp"></jsp:include>
	<br>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>