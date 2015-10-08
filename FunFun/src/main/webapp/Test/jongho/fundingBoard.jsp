<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>

	<div class="panel panel-default" style="position: relative;">
		<div class="panel-heading">코멘트</div>

		<div class="panel panel" style="height: 80px;"></div>

		<div class="panel panel-danger" style="width: 900px;">
			
			
			<div class="jumbotron">
			<div class="container">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe style="width: 850px; height: 400px"
						src="https://www.youtube.com/embed/4OrCA1OInoo" frameborder="0"></iframe>
				</div>
			</div>
			
				<button type="button" class="btn btn-info">
					<span class="glyphicon glyphicon-thumbs-up"></span> like
					
				</button>
			
		</div>
		
		</div>

		


	</div>

	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>
</body>
</html>