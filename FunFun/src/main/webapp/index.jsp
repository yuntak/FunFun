<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
	<head>
		<meta charset="utf-8">
		<title>Welcome</title>
	</head> 
	<body>	
		<jsp:include page="/WEB-INF/view/main/Template.jsp"></jsp:include>
		<a href="<%=request.getContextPath()%>/freeWrite">자유게시판글쓰기</a>
	</body>
</html>
