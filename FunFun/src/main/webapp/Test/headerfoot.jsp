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

.userlogin{
	color: #00CFCF;
	font-size: 20px;
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


</head>
<body>
	
	<nav class="navbar navbar-default">
		<c:set value="sdf" var="id"></c:set>

		<c:choose>
		<c:when test="${!empty id }">
		   <div class="navbar navbar-default ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="./"><img src="<%=request.getContextPath()%>/rsc/img/logo.jpg"
					style="width: 100px; height: 100px">
				</a>
			</div>


			<div class="navbar-form " align="center">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
			</div>
	
			<div align="right" class="userlogin">
				${id }님 반갑습니다.<br><img src="<%=request.getContextPath()%>/img/smile.jpg"
					style="width: 30px; height: 30px">
			    <a class="btn btn-success" href="">로그아웃</a> <a class="btn btn-info" href="">회원정보</a>
			</div>	
			
		
		</div>
	 
<div class="container">
  <div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
  <li>
   <a href="<%=request.getContextPath() %>Board?Board=FreeBoard">자유게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=FreeContent">자유연재게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=Funding">펀드게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=FAQ">QnA</a></li>
   </ul>

</div>
</div>     
</c:when>
	<c:otherwise>
		<div class="navbar navbar-default ">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a href="./"><img src="<%=request.getContextPath()%>/rsc/img/logo.jpg"
					style="width: 100px; height: 100px">
				</a>
			</div>


			<div class="navbar-form " align="center">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>

				<button type="submit" class="btn btn-info">
					<span class="glyphicon glyphicon-search"></span> Search
				</button>
			</div>
	
			<ul class="nav navbar-nav navbar-right myinline">
				<li><a class="a-button" href="<%=request.getContextPath() %>/agreement">회원가입</a></li>
				<li><a class="a-button" href="<%=request.getContextPath() %>/Login">로그인</a></li>
				<li><a class="a-button" href="<%=request.getContextPath() %>/">아이디찾기</a></li>
				<li><a class="a-button" href="<%=request.getContextPath() %>/">비번찾기</a></li>
			</ul>
		
		</div>
	 
<div class="container">
  <div class="nav nav-pills">        
  
  <ul class="nav nav-justified">
  <li>
   <a href="<%=request.getContextPath() %>Board?Board=FreeBoard">자유게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=FreeContent">자유연재게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=Funding">펀드게시판</a></li>
   <li>
   <a href="<%=request.getContextPath() %>Board?Board=FAQ">QnA</a></li>
   </ul>

</div>
</div>  
	</c:otherwise>
	
	</c:choose>
</nav>




</body>
</html>