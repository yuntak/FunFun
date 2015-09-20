<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

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

<meta charset="utf-8">
<title>Welcome</title>

</head>
<body>

<jsp:include page="/headerfoot"></jsp:include>
	</nav>
	<div class="text-center v-center">
	<h1>메인</h1>
	</div>
	<div class="jumbotron">
		<a href="<%=request.getContextPath() %>/fundboard">
			 펀딩글
		</a>
		
		
	</div>
	<div class="jumbotron">
	<a href="<%=request.getContextPath() %>/modify">
			수정
	</a>
	</div>
	<div class="PassEditForm">
	<a href="<%=request.getContextPath() %>/PassEditForm">
			비번수정
	</a>
	</div>
</nav>


</body>

</html>
