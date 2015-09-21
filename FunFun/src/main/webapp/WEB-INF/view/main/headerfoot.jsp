<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
    
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

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar navbar-default ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="http://localhost:9090/funding/main/main.jsp"><img src="<%=request.getContextPath()%>/img/Koala.jpg"
					style="width: 100px; height: 100px">
				</a>
			</div>


			<div class="navbar-form" align="center">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
			</div>
	
			<ul class="nav navbar-nav navbar-right">
				<li><a href="<%=request.getContextPath() %>/agreement">회원가입</a></li>
				<li><a href="<%=request.getContextPath() %>/login">로그인</a></li>
			</ul>
		
		</div>
	 
<div class="container">
  <div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
   <a href="<%=request.getContextPath() %>/freeboard">자유게시판</a>
   <a href="#">자유연재게시판</a>
   <a href="<%=request.getContextPath() %>/fundboard">펀드게시판</a>
   <a href="#">QnA</a>
   </ul>

</div>
</div>     
</nav>
<nav class="navbar navbar-inverse navbar-fixed-bottom">

<form class="form-inline">
  <div class="panel-body">     
    <p style="color:white">회사이름</p>
    <p style="color:white">주소</p>
    <p style="color:white">e-mail</p>
    <p style="color:white">연락처</p>
    </div>
    </form>
</nav>


</body>
</html>