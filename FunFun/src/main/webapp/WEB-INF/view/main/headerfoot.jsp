<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>   
    
<!DOCTYPE html >
<html>

<head>
<style type="text/css">
.myinline{
display: inline;
}
#myNickName{
color: #0066FF;
font-weight: bold;
font-size: 15 px;
}
.login-after-btn{
margin-left: 10px;
margin-right: 0px;
}
#login-after-msg{
margin-right: 15px;
margin-left: 15px;
margin-bottom: 10px;
}
</style>
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

</style>
	

</head>
<body>
	<nav class="navbar" style="background-color: #C4FFB1; color: #FF9900;">
	
	<c:choose>
	<c:when test="${empty FunFunUser }">
	
		<div class="navbar" style="background-color: white; ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="<%=request.getContextPath() %>/main"><img src="<%=request.getContextPath() %>/img/funfun.PNG"
					 style="width: 100px; height: 100px;">
				</a>
			
			</div>


			
				<div class="form-inline " style="">
					<input type="text" style="width: 150px;" class="form-control" placeholder="Search">
				

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
				</div>
	
			<ul class="nav navbar-nav navbar-right myinline">
				<li><a class="a-button" href="<%=request.getContextPath() %>/agreement">회원가입</a></li>
				<li><a class="a-button" href="<%=request.getContextPath() %>/Login">로그인</a></li>
			</ul>
		</div>
		
		</c:when>
		<c:otherwise>
		  <div class="navbar navbar-default ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="<%=request.getContextPath() %>/main"><img src="<%=request.getContextPath()%>/img/funfun.PNG"
					style="width: 100px; height: 100px">
				</a>
			</div>


			<div class="navbar-form " >
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
			</div>
	
			<div align="right" class="userlogin" >
				<p id="login-after-msg"><span id="myNickName"> ${FunFunUser.nickname }</span>님 반갑습니다.</p>
			    <a class="btn btn-success login-after-btn" href="../Logout">로그아웃</a>
			    <a class="btn btn-info login-after-btn" href="../myinfo/info">회원정보</a>
			</div>	
			
		
		</div>
		</c:otherwise>
	 </c:choose>
<div class="container">
  <div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
  <li>
   <a href="<%=request.getContextPath() %>/FreeBoard">자유게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>/ContentBoard">자유연재게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>/FundingBoard">펀드게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>/QnABoard">QnA</a></li>
   </ul>

</div>
</div>     
</nav>
<hr>



</body>
</html>