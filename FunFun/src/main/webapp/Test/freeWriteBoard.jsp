<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
.category {
	width: 200px;
	float: left;
}

.freeWriteBoard-List {
	position: fixed;
	top: 180px;
	left:250px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/main/headerfoot.jsp"></jsp:include>


	<div class="form-horizontal">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="#">카테고리</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">만화 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">코믹</a></li>
					<li><a href="#">공포</a></li>
					<li><a href="#">멜로</a></li>
				</ul></li>
			<li><a href="#">영화</a></li>
			<li><a href="#">연극</a></li>
		</ul>
	</div>
	<div class="clearfix visible-lg"></div>





	<div class="form-horizontal">

		<h2 align="center">게시글</h2>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				
			</tbody>
		</table>
	</div>







	<jsp:include page="/WEB-INF/view/main/footer.jsp"></jsp:include>

</body>
</html>