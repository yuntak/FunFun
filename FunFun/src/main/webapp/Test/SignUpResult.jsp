<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<c:choose>
<c:when test="${!empty FunFunSignUpId }"><p>ID:${FunFunSingUpId }로 회원가입 되었습니다.</p></c:when>
<c:otherwise>
<p>회원 가입에 실패하셨습니다.</p>
</c:otherwise>
</c:choose>
<a href="./main"><button>확인</button></a>
</div>
</body>
</html>