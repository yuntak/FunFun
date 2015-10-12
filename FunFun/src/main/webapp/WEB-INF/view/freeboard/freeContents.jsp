<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="funfun.jdbc.dto.FBoard"%>
<%@page import="funfun.jdbc.dto.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
/*  .top {
	border-top: solid; color: #DEDEE9;
	border-bottom: solid; color: #DEDEE9;;
	background-color:#F5F5F9;
	height: 40px;
	width: 900px;
	position: absolute;
	right: 530px;
}  */

/* .up{

	border-color: black;
	border: 1px solid;
	display: inline-block; width:90px; height: 90px;
	text-align: center; 
	font-size: 27px;
} */
#wrwr {
	
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>

	
	<%
		Object FlistObj = request.getAttribute("FBoardList");
		List<FBoard> list = null;
		if (FlistObj != null && FlistObj instanceof List) {
			list = (List<FBoard>) FlistObj;
		}
	%>
	<div class="panel-body">
		<%
			FBoard fdto = null;
			for (int i = 0; i < list.size(); i++) {
				fdto = (FBoard) list.get(i);
		%>

		<%
			}
		%>

		<div id="toppanel" class="panel panel-default">
			<ul class="nav nav-justified">
				<li>
					<div align="left" class="panel-body" style="width: 200px">게시물제목란</div>
				</li>
				<li>
					<div align="center" class="panel-body" style="width: 200px">날짜</div>
				</li>
				<li>
					<div align="right" class="panel-body" style="width: 200px">작성자</div>
				</li>
			</ul>
		</div>
	</div>
	</div>



	<div class="panel panel-default">
		<div class="panel-body" style="height: 400px">게시물 내용</div>
	</div>

	<div class="panel panel-default">
		<label for="user" id="wrwr">작성자</label>

		<textarea rows="4" cols="100" id="user">sdf</textarea>
		<a href="<%=request.getContextPath()%>/main"><img
			src="<%=request.getContextPath()%>/img/ok.PNG"
			style="width: 100px; height: 100px"> </a>
	</div>

	</div>
	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>