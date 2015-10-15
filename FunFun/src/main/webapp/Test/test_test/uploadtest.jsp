<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:url value="/upload" var="upload"></c:url>
	<form method="post" enctype="multipart/form-data" action="${upload }">
		<label for="comment">설명</label>
		<input type="text" id="comment" name="comment"><br>
		<input type="file" name="uploadFile"> 
		<button type="submit">upload</button>
	</form>
	
	<div>파일명: ${uploaded}</div>
	<c:if test="${uploaded.endsWith('JPG')}">
	  <img src="<%=request.getContextPath()%>/upload/${uploaded}" width="200px">
	</c:if>
	
</body>
</html>